# This code was automatically generated by CWrap version 0.0.0

cdef extern from "umfpack_get_determinant.h":

    int umfpack_di_get_determinant(double *Mx, double *Ex, void *NumericHandle, double User_Info)

    int umfpack_dl_get_determinant(double *Mx, double *Ex, void *NumericHandle, double User_Info)

    int umfpack_zi_get_determinant(double *Mx, double *Mz, double *Ex, void *NumericHandle, double User_Info)

    int umfpack_zl_get_determinant(double *Mx, double *Mz, double *Ex, void *NumericHandle, double User_Info)


