! energy flux functions


    REAL(kind=kr) FUNCTION energy_fx(E, j,k,l)
        ! x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: E
        energy_fx = (E + p(j,k,l))*rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION energy_fx
    
    REAL(kind=kr) FUNCTION energy_fy(E, j,k,l)
        ! y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: E
        energy_fy = (E + p(j,k,l))*rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION energy_fy
    
    REAL(kind=kr) FUNCTION energy_fz(E, j,k,l)
        ! z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: E
        energy_fz = (E + p(j,k,l))*rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION energy_fz
    
    REAL(kind=kr) FUNCTION energy_dfx(E, j,k,l)
        ! derivative of x-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: E
        energy_dfx = rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION energy_dfx
    
    REAL(kind=kr) FUNCTION energy_dfy(E, j,k,l)
        ! derivative of y-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: E
        energy_dfy = rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION energy_dfy
    
    REAL(kind=kr) FUNCTION energy_dfz(E, j,k,l)
        ! derivative of z-direction flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: E
        energy_dfz = rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION energy_dfz
    
    
    
