#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import re

def extract_num_defines(src, dest):
    """
    Transforms defines of kind in 'some_lib.h':
      #define A (-2)
      #define B 99

    into some_lib.pxd:
      cdef enum some_lib_h:
          A = -2
          B = 99
    """
    output=['cdef enum {}_num_defines:'.format(os.path.basename(src).replace('.','_'))]
    for i,line in enumerate(open(src, 'rt')):
        m = re.match(r'^\#define\s(\w+)\s[\(]*([0-9\-]+)[\)]*(.+)',line)
        if m:
            output.append('    {} = {} # LN{}, {}'.format(m.group(1),m.group(2),i+1,m.group(3)))
    if len(output) > 1:
        ofh = open(dest, 'wt')
        ofh.write('\n'.join(output))
        ofh.close()

def main(sources, outdir):
    """
    Usage:

    python c_defines_to_pxd_enum.py somelib_core.h somelib_utils.h pxd_def_enum_out/
    """
    assert os.path.isdir(outdir)
    for src in sources:
        print(src)
        assert os.path.isfile(src)
        # Dest follows same naming convention
        # as cwrap
        dest = os.path.join(
            outdir, '_' + os.path.splitext(
            os.path.basename(src))[0]+'.pxd')
        extract_num_defines(src, dest)

if __name__ == '__main__':
    main(sys.argv[1:-1], outdir=sys.argv[-1])

