! density flux functions


    REAL(kind=kr) FUNCTION dens_fx(density, j,k,l)
        ! x-direction density flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: density
        dens_fx = density*(rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l))
    END FUNCTION dens_fx
    
    REAL(kind=kr) FUNCTION dens_fy(density, j,k,l)
        ! y-direction density flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: density
        dens_fy = density*(rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l))
    END FUNCTION dens_fy
    
    REAL(kind=kr) FUNCTION dens_fz(density, j,k,l)
        ! z-direction density flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: density
        dens_fz = density*(rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l))
    END FUNCTION dens_fz
    
    REAL(kind=kr) FUNCTION dens_dfx(density, j,k,l)
        ! derivative of x-direction density flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: density
        dens_dfx = rho_u%f_prev(j,k,l,1)/rho%f_prev(j,k,l)
    END FUNCTION dens_dfx
    
    REAL(kind=kr) FUNCTION dens_dfy(density, j,k,l)
        ! derivative of y-direction density flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: density
        dens_dfy = rho_u%f_prev(j,k,l,2)/rho%f_prev(j,k,l)
    END FUNCTION dens_dfy
    
    REAL(kind=kr) FUNCTION dens_dfz(density, j,k,l)
        ! derivative of z-direction density flux function
        IMPLICIT NONE
        INTEGER :: j,k,l
        REAL(kind=kr) :: density
        dens_dfz = rho_u%f_prev(j,k,l,3)/rho%f_prev(j,k,l)
    END FUNCTION dens_dfz
    