    SUBROUTINE init_energy()
        ! init_energy -----------------------------------------------------
        !
        ! This subroutine initializes the energy density field.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: scalar
        
        scalar = 1.d-4
        
        ! Set interior inital condition
        DO l=1, size_z
            DO k=1, Ynum
                DO j=1, Xnum
                    E%f_prev(j,k,l) = scalar
                ENDDO
            ENDDO
        ENDDO
    
    
    END SUBROUTINE init_energy
    