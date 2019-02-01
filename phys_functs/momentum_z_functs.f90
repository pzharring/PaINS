! momentum z component flux functions


    REAL(kind=kr) FUNCTION mom_z_fx(mom, j,k,l)
        ! x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_z_fx = mom*rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION mom_z_fx
    
    REAL(kind=kr) FUNCTION mom_z_fy(mom, j,k,l)
        ! y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_z_fy = mom*rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION mom_z_fy
    
    REAL(kind=kr) FUNCTION mom_z_fz(mom, j,k,l)
        ! z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_z_fz = (mom**2)/rho%f_prev(j,k,l) + p(j,k,l)
    END FUNCTION mom_z_fz
    
    REAL(kind=kr) FUNCTION mom_z_dfx(mom, j,k,l)
        ! derivative of x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_z_dfx = rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION mom_z_dfx
    
    REAL(kind=kr) FUNCTION mom_z_dfy(mom, j,k,l)
        ! derivative of y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_z_dfy = rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION mom_z_dfy
    
    REAL(kind=kr) FUNCTION mom_z_dfz(mom, j,k,l)
        ! derivative of z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: mom
        mom_z_dfz = 2._kr*mom/rho%f_prev(j,k,l)
    END FUNCTION mom_z_dfz
    
