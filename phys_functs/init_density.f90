    SUBROUTINE init_density()
        ! init_density ----------------------------------------------------
        !
        ! This subroutine initializes the density field.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: scalar
        
        scalar = 1._kr

        DO l=1, size_z
            DO k=1, Ynum
                DO j=1, Xnum
                    rho%f_prev(j,k,l) = scalar
                ENDDO
            ENDDO
        ENDDO
    
    
    END SUBROUTINE init_density
    