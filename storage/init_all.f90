    SUBROUTINE init_all()
        ! init_all --------------------------------------------------------
        !
        ! Creates and opens the output file, and initialized the simulation.
        !
        ! -----------------------------------------------------------------

        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom_squared
        
        IF (rank==0) THEN
            PRINT *, "Initializing..."
        ENDIF
        
        ! Decompose domain
        CALL decompose()
        
        ! Allocate and set up memory
        CALL create_coords()
        CALL allocate_arrays()
        CALL init_output_file()
        
        ! Initilaize physical fields
        CALL init_density()
        CALL init_momentum()
        
        ! Initialize energy field from pressure, momentum fields
        CALL init_pressure()
        
        DO l = 1, size_z
            DO k= 1, Ynum
                DO j= 1, Xnum
                    mom_squared = (rho_u%f_prev(j,k,l,1))**2 + (rho_u%f_prev(j,k,l,2))**2 + (rho_u%f_prev(j,k,l,3))**2
                    E%f_prev(j,k,l) = (1._kr/(gamma-1._kr))*p(j,k,l) &
                                    + 0.5*mom_squared/rho%f_prev(j,k,l)
                ENDDO
            ENDDO
        ENDDO

        simtime = 0._kr
        
    
    END SUBROUTINE init_all
    
    