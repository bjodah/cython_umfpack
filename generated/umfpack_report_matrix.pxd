# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_report_matrix.h":

    int umfpack_di_report_matrix(int n_row, int n_col, const int *Ap, const int *Ai, const double *Ax, int col_form, const double Control)

    int umfpack_dl_report_matrix(int n_row, int n_col, const int *Ap, const int *Ai, const double *Ax, int col_form, const double Control)

    int umfpack_zi_report_matrix(int n_row, int n_col, const int *Ap, const int *Ai, const double *Ax, const double *Az, int col_form, const double Control)

    int umfpack_zl_report_matrix(int n_row, int n_col, const int *Ap, const int *Ai, const double *Ax, const double *Az, int col_form, const double Control)


