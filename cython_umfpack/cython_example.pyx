from umfpack cimport umfpack_di_symbolic, umfpack_di_numeric, umfpack_di_free_symbolic,umfpack_di_solve, umfpack_di_free_numeric, UMFPACK_A

def main():
    """
    Matches closely example code in beginning of UMFPACK User Guide
    """

    cdef int n = 5
    cdef int *Ap =    [0, 2, 5, 9, 10, 12]
    cdef int *Ai =    [0,  1,  0,   2,  4,  1,   2,  3,  4,  2,  1,  4]
    cdef double *Ax = [2., 3., 3., -1., 4., 4., -3., 1., 2., 2., 6., 1.]
    cdef double *b =  [8., 45., -3., 3., 19.]
    cdef double x[5]

    cdef double *null = <double *> NULL
    cdef int i
    cdef void *Symbolic, *Numeric
    umfpack_di_symbolic(n, n, Ap, Ai, Ax, &Symbolic, null, null)
    umfpack_di_numeric(Ap, Ai, Ax, Symbolic, &Numeric, null, null)
    umfpack_di_free_symbolic(&Symbolic)
    umfpack_di_solve(UMFPACK_A, Ap, Ai, Ax, x, b, Numeric, null, null)
    umfpack_di_free_numeric(&Numeric)
    for i in range(n):
        print("x[{}] = {}\n".format(i, x[i])),
    return 0

if __name__ == '__main__':
    main()
