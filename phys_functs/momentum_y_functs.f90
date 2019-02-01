! momentum y component flux functions


    REAL(kind=kr) FUNCTION mom_y_fx(mom, j,k,l)
        ! x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_y_fx = mom*rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION mom_y_fx
    
    REAL(kind=kr) FUNCTION mom_y_fy(mom, j,k,l)
        ! x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_y_fy = (mom**2)/rho%f_prev(j,k,l) + p(j,k,l)
    END FUNCTION mom_y_fy
    
    REAL(kind=kr) FUNCTION mom_y_fz(mom, j,k,l)
        ! z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_y_fz = mom*rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION mom_y_fz
    
    REAL(kind=kr) FUNCTION mom_y_dfx(mom, j,k,l)
        ! derivative of x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_y_dfx = rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION mom_y_dfx
    
    
    REAL(kind=kr) FUNCTION mom_y_dfy(mom, j,k,l)
        ! derivative of y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_y_dfy = 2._kr*mom/rho%f_prev(j,k,l)
    END FUNCTION mom_y_dfy
    
    REAL(kind=kr) FUNCTION mom_y_dfz(mom, j,k,l)
        ! derivative of z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_y_dfz = rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION mom_y_dfz
    
