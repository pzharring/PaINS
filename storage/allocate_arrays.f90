    SUBROUTINE allocate_arrays()
        ! allocate_arrays -------------------------------------------------
        !
        ! This subroutine allocates the arrays that store the necessary 
        ! values for the physical variables.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        
        ! density
        ALLOCATE(rho%field(Xnum, Ynum, size_z))
        ALLOCATE(rho%f_prev(Xnum, Ynum, size_z))
        ALLOCATE(rho%change(Xnum, Ynum, size_z))
        
        ! momentum
        ALLOCATE(rho_u%field(Xnum, Ynum, size_z, 3))
        ALLOCATE(rho_u%f_prev(Xnum, Ynum, size_z, 3))
        ALLOCATE(rho_u%change(Xnum, Ynum, size_z, 3))
        
        ! energy
        ALLOCATE(E%field(Xnum, Ynum, size_z))
        ALLOCATE(E%f_prev(Xnum, Ynum, size_z))
        ALLOCATE(E%change(Xnum, Ynum, size_z))
        
        ! pressure
        ALLOCATE(p(Xnum, Ynum, size_z))
        
        ! arrays for ghost cell data
        ALLOCATE(chmatr_in(Xnum, Ynum, 5, 2))
        ALLOCATE(chmatr_out(Xnum, Ynum, 5, 2))
        ALLOCATE(prevbufo(Xnum*Ynum*5))
        ALLOCATE(nextbufo(Xnum*Ynum*5))
        ALLOCATE(prevbufi(Xnum*Ynum*5))
        ALLOCATE(nextbufi(Xnum*Ynum*5))
        
    
    
    END SUBROUTINE allocate_arrays
    