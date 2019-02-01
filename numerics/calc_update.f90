    SUBROUTINE calc_update(ch_val, q, j, k, l, fx, dfx, fy, dfy, fz, dfz, debug)
       ! calc_update ------------------------------------------------------
       !
       ! This subroutine calculates the change of a quantity for a given
       ! cell (j,k,l) via the Rusanov method.
       !
       ! 
       ! INPUTS: q   -- full array of values representing the 
       !                quantity of interest
       !         j   -- x-index for cell
       !         k   -- y-index for cell
       !         l   -- z-index for cell
       !         fx  -- flux function for x-direction
       !         dfx -- derivative of flux function for x-direction
       !         fy  -- flux function for y-direction
       !         dfy -- derivative of flux function for y-direction
       !         fz  -- flux function for z-direction
       !         dfz -- derivative of flux function for z-direction
       ! 
       ! OUTPUTS: ch_val -- change in the quantity at cell (j,k,l)
       ! 
       ! ------------------------------------------------------------------
       IMPLICIT NONE
       INTEGER ::j,k,l, debug
       REAL (kind=kr) :: ch_val, spdfac_xp, spdfac_xm, spdfac_yp, &
                         spdfac_ym, spdfac_zp, spdfac_zm, F_xp, F_xm, &
                         G_yp, G_ym, H_zp, H_zm
                        
       REAL (kind=kr), DIMENSION(:,:,:) :: q
       REAL (kind=kr), EXTERNAL :: fx, dfx, fy, dfy, fz, dfz
       
       
       ! Speed factors for x-direction fluxes
       spdfac_xp = MAX( ABS(dfx(q(j,k,l),j,k,l)), ABS(dfx(q(j+1,k,l),j+1,k,l)))
       spdfac_xm = MAX( ABS(dfx(q(j,k,l),j,k,l)), ABS(dfx(q(j-1,k,l),j-1,k,l)))
       ! Speed factors for y-direction fluxes
       spdfac_yp = MAX( ABS(dfy(q(j,k,l),j,k,l)), ABS(dfy(q(j,k+1,l),j,k+1,l)))
       spdfac_ym = MAX( ABS(dfy(q(j,k,l),j,k,l)), ABS(dfy(q(j,k-1,l),j,k-1,l)))
       ! Speed factors for z-direction fluxes
       spdfac_zp = MAX( ABS(dfz(q(j,k,l),j,k,l)), ABS(dfz(q(j,k,l+1),j,k,l+1)))
       spdfac_zm = MAX( ABS(dfz(q(j,k,l),j,k,l)), ABS(dfz(q(j,k,l-1),j,k,l-1)))
       
       
       
       ! x-direction Rusanov fluxes
       F_xp = 0.5_kr*(fx(q(j,k,l), j,k,l) + fx(q(j+1,k,l), j+1,k,l)) &
            - 0.5_kr*spdfac_xp*(q(j+1,k,l) - q(j,k,l))
       F_xm = 0.5_kr*(fx(q(j,k,l), j,k,l) + fx(q(j-1,k,l), j-1,k,l)) &
            - 0.5_kr*spdfac_xm*(q(j,k,l) - q(j-1,k,l))
       ! y-direction Rusanov fluxes
       G_yp = 0.5_kr*(fy(q(j,k,l), j,k,l) + fy(q(j,k+1,l), j,k+1,l)) &
            - 0.5_kr*spdfac_yp*(q(j,k+1,l) - q(j,k,l))
       G_ym = 0.5_kr*(fy(q(j,k,l), j,k,l) + fy(q(j,k-1,l), j,k-1,l)) &
            - 0.5_kr*spdfac_ym*(q(j,k,l) - q(j,k-1,l))
       ! z-direction Rusanov fluxes
       H_zp = 0.5_kr*(fz(q(j,k,l), j,k,l) + fz(q(j,k,l+1), j,k,l+1)) &
            - 0.5_kr*spdfac_zp*(q(j,k,l+1) - q(j,k,l))
       H_zm = 0.5_kr*(fz(q(j,k,l), j,k,l) + fz(q(j,k,l-1), j,k,l-1)) &
            - 0.5_kr*spdfac_zm*(q(j,k,l) - q(j,k,l-1))
            
       ch_val = -DT*( (F_xp - F_xm)/DX + (G_yp - G_ym)/DY + (H_zp - H_zm)/DZ )


    END SUBROUTINE calc_update
    