# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_save_symbolic.h":

    int umfpack_di_save_symbolic(void *Symbolic, char *filename)

    int umfpack_dl_save_symbolic(void *Symbolic, char *filename)

    int umfpack_zi_save_symbolic(void *Symbolic, char *filename)

    int umfpack_zl_save_symbolic(void *Symbolic, char *filename)


