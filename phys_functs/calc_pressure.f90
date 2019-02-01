    SUBROUTINE calc_pressure()
        ! Pressure:
        ! p = (gamma-1)*(E - 1/2 rho v^2)
        IMPLICIT NONE
        INTEGER :: j,k,l

        
        DO l = 1, size_z
            DO k = 1, Ynum
                DO j = 1, Xnum
                    p(j,k,l) = (gamma-1._kr)*(E%f_prev(j,k,l) &
                                                -0.5_kr*(rho_u%f_prev(j,k,l,1)**2 &
                                                + rho_u%f_prev(j,k,l,2)**2 &
                                                + rho_u%f_prev(j,k,l,3)**2) &
                                                /rho%f_prev(j,k,l) )
                ENDDO
            ENDDO
        ENDDO
        
    END SUBROUTINE calc_pressure
    