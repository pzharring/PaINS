! momentum x component flux functions


    REAL(kind=kr) FUNCTION mom_x_fx(mom, j,k,l)
        ! x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_x_fx = (mom**2)/rho%f_prev(j,k,l) + p(j,k,l)
    END FUNCTION mom_x_fx
    
    REAL(kind=kr) FUNCTION mom_x_fy(mom, j,k,l)
        ! y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_x_fy = mom*rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION mom_x_fy
    
    REAL(kind=kr) FUNCTION mom_x_fz(mom, j,k,l)
        ! z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_x_fz = mom*rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION mom_x_fz
    
    REAL(kind=kr) FUNCTION mom_x_dfx(mom, j,k,l)
        ! derivative of x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_x_dfx = 2._kr*mom/rho%f_prev(j,k,l)
    END FUNCTION mom_x_dfx
    
    REAL(kind=kr) FUNCTION mom_x_dfy(mom, j,k,l)
        ! derivative of y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_x_dfy = rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION mom_x_dfy
    
    REAL(kind=kr) FUNCTION mom_x_dfz(mom, j,k,l)
        ! derivative of z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_x_dfz = rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION mom_x_dfz
    
    
    