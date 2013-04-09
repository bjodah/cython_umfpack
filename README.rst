=======================================
Cython umfpack (pre-alpha release) Demo
=======================================

Experimental cython interface to umfpack. Uses [cwrap](https://github.com/geggo/cwrap) and a
provided utility script to generate relevant .pxd files. Currently it may be seen as a demo
and proof of concept of the excellent cwrap tool.

It currently compiles a small example program provided.

Usage
=====

Compiling

::

  python setup.py build_ext --inplace

note: make sure clang and llvm is on PATH, e.g.:

::

  env LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/llvm/lib/ python setup.py build_ext --inplace

To compile the pure ANSI C example (from UMFPACK's user's guide)
``gcc original_example.c -o original_example -lumfpack``

cython_exapmle.pyx
==================
A more or less literate transcription of the small original_example.c program.
The point is: using cwrap a complex library as UMFPACK is _easily_ interfaced!

generated/
==========
If you can't get cwrap to work, the generated pxd files for UMFPACK 5.4 is provided in this dir.

LICENSE
=======
Open Soucrce. Released under the very permissive "simplified (2-clause) BSD license". See LICENCE.tx for further details.

