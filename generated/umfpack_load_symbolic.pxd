# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_load_symbolic.h":

    int umfpack_di_load_symbolic(void **Symbolic, char *filename)

    int umfpack_dl_load_symbolic(void **Symbolic, char *filename)

    int umfpack_zi_load_symbolic(void **Symbolic, char *filename)

    int umfpack_zl_load_symbolic(void **Symbolic, char *filename)


