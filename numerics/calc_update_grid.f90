    SUBROUTINE calc_update_grid(ch_val, q, fx, dfx, fy, dfy, fz, dfz, debug)
       ! calc_update_grid -------------------------------------------------
       !
       ! This subroutine calculates the change of a quantity for a given
       ! region of the simulation domain via the Rusanov method. One layer
       ! of boundary/ghost cells are assumed.
       !
       ! 
       ! INPUTS: q   -- full array of values representing the 
       !                quantity of interest in the given region
       !         fx  -- flux function for x-direction
       !         dfx -- derivative of flux function for x-direction
       !         fy  -- flux function for y-direction
       !         dfy -- derivative of flux function for y-direction
       !         fz  -- flux function for z-direction
       !         dfz -- derivative of flux function for z-direction
       ! 
       ! OUTPUTS: ch_val  -- array storing values of the RHS term for 
       !                      each element in the region
       ! 
       ! ------------------------------------------------------------------
       
       IMPLICIT NONE
       INTEGER :: j, k, l, debug
       REAL(kind=kr), DIMENSION (:,:,:) :: q, ch_val
       REAL(kind=kr), EXTERNAL :: fx, dfx, fy, dfy, fz, dfz
       
       
       DO l= 2, size_z - 1
           DO k= 2, Ynum-1
               DO j= 2, Xnum-1
                  CALL calc_update(ch_val(j,k,l), q, j,k,l, fx, dfx, fy, dfy, fz, dfz, debug)
               ENDDO
           ENDDO
       ENDDO
       
    END SUBROUTINE calc_update_grid
    