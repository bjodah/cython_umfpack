# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_numeric.h":

    int umfpack_di_numeric(const int *Ap, const int *Ai, const double *Ax, void *Symbolic, void **Numeric, const double Control, double Info)

    int umfpack_dl_numeric(const int *Ap, const int *Ai, const double *Ax, void *Symbolic, void **Numeric, const double Control, double Info)

    int umfpack_zi_numeric(const int *Ap, const int *Ai, const double *Ax, const double *Az, void *Symbolic, void **Numeric, const double Control, double Info)

    int umfpack_zl_numeric(const int *Ap, const int *Ai, const double *Ax, const double *Az, void *Symbolic, void **Numeric, const double Control, double Info)


