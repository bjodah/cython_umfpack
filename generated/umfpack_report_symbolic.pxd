# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_report_symbolic.h":

    int umfpack_di_report_symbolic(void *Symbolic, const double Control)

    int umfpack_dl_report_symbolic(void *Symbolic, const double Control)

    int umfpack_zi_report_symbolic(void *Symbolic, const double Control)

    int umfpack_zl_report_symbolic(void *Symbolic, const double Control)


