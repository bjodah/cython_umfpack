# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_report_vector.h":

    int umfpack_di_report_vector(int n, const double *X, const double Control)

    int umfpack_dl_report_vector(int n, const double *X, const double Control)

    int umfpack_zi_report_vector(int n, const double *Xx, const double *Xz, const double Control)

    int umfpack_zl_report_vector(int n, const double *Xx, const double *Xz, const double Control)


