from distutils.core import setup
from Cython.Distutils import Extension
from Cython.Distutils import build_ext

SUITESPARSE_INC='/usr/include/suitesparse'
CWRAP_OUT = './cwrap_out'
PXD_ENUM_OUT = './pxd_enum_out'

def cat(sources, dest):
    import fileinput
    with open(dest, 'w') as ofh:
        for line in fileinput.input(sources):
            ofh.write(line)

def generate_pxd():
    """
    Uses cwrap (https://github.com/geggo/cwrap)

    and

    c_defines_to_pxd_enum.py (hacked for this example)
    """
    from cwrap.config import Config, File
    import sys
    import os
    import glob

    # Run cwrap (output in CWRAP_OUT)
    # if not LLVM_BIN_PATH in sys.path:
    #     sys.path.append(LLVM_BIN_PATH)
    if not os.path.exists(CWRAP_OUT):
        os.mkdirs(CWRAP_OUT)
    umfpack_headers = glob.glob(os.path.join(
        SUITESPARSE_INC, 'umfpack*'))
    cwrap_header_files = list(map(File, umfpack_headers))
    config_clang = Config('clang', files=cwrap_header_files,
                          save_dir = CWRAP_OUT,
                          include_dirs = [SUITESPARSE_INC]
                          )
    config_clang.generate()

    # Extract #define style enums (output to PXD_ENUM_OUT)
    import c_defines_to_pxd_enum
    if not os.path.exists(PXD_ENUM_OUT):
        os.mkdirs(PXD_ENUM_OUT)
    c_defines_to_pxd_enum.main(umfpack_headers, PXD_ENUM_OUT)

    # Join resp. pxd files in cython_umfpack/
    for cwrap_pxd in glob.glob(os.path.join(
        CWRAP_OUT, '*.pxd')):
        pxd_basename = os.path.basename(cwrap_pxd)

        sources = [cwrap_pxd]
        enum_pxd = os.path.join(PXD_ENUM_OUT, pxd_basename)
        if os.path.isfile(enum_pxd):
            sources.append(enum_pxd)
        dest_basename = pxd_basename[1:] if pxd_basename.startswith('_') else pxd_basename
        dest = os.path.join('./cython_umfpack', dest_basename)
        cat(sources, dest)

class my_build_ext(build_ext):
    def run(self):
        if not self.dry_run:
            generate_pxd()
        build_ext.run(self)


setup(
    cmdclass = {'build_ext': my_build_ext},
    ext_modules = [Extension("cython_umfpack.cython_example",
                             ["cython_umfpack/cython_example.pyx"],
                             libraries=['umfpack'],
                             include_dirs = [SUITESPARSE_INC],
                             ),
                   ]
    )
