    SUBROUTINE init_momentum()
        ! init_momentum ---------------------------------------------------
        !
        ! This subroutine initializes the momentum field, by multiplying
        ! the initial density field by given initial velocity field 
        ! information.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: scalar
        
        scalar = 0._kr
        DO l=1, size_z
            DO k=1, Ynum
                DO j=1, Xnum
                    rho_u%f_prev(j,k,l,1) = rho%f_prev(j,k,l)*scalar
                    rho_u%f_prev(j,k,l,2) = 0._kr!rho%f_prev(j,k,l)*scalar
                    rho_u%f_prev(j,k,l,3) = 0._kr!rho%f_prev(j,k,l)*scalar
                ENDDO
            ENDDO
        ENDDO
    
    END SUBROUTINE init_momentum
    