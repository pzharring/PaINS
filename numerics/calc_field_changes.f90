    SUBROUTINE calc_field_changes()
       ! calc_field_changes -----------------------------------------------
       !
       ! Calculates the changes due to Rusanov fluxes in each field.
       !
       ! ------------------------------------------------------------------
       IMPLICIT NONE
       
       
       
       ! density
       CALL calc_update_grid( rho%change(:,:,:), &
                              rho%f_prev(:,:,:), &
                              dens_fx, dens_dfx,&
                              dens_fy, dens_dfy,&
                              dens_fz, dens_dfz, 1)
       
       ! energy
       CALL calc_update_grid( E%change(:,:,:), &
                              E%f_prev(:,:,:), &
                              energy_fx, energy_dfx,&
                              energy_fy, energy_dfy,&
                              energy_fz, energy_dfz, 2)
       
       ! momentum
       ! x-direction
       CALL calc_update_grid( rho_u%change(:,:,:,1), &
                              rho_u%f_prev(:,:,:,1), &
                              mom_x_fx, mom_x_dfx,&
                              mom_x_fy, mom_x_dfy,&
                              mom_x_fz, mom_x_dfz, 3)

       ! y-direction
       CALL calc_update_grid( rho_u%change(:,:,:,2), &
                              rho_u%f_prev(:,:,:,2), &
                              mom_y_fx, mom_y_dfx,&
                              mom_y_fy, mom_y_dfy,&
                              mom_y_fz, mom_y_dfz, 4)
       ! z-direction
       CALL calc_update_grid( rho_u%change(:,:,:,3), &
                              rho_u%f_prev(:,:,:,3), &
                              mom_z_fx, mom_z_dfx,&
                              mom_z_fy, mom_z_dfy,&
                              mom_z_fz, mom_z_dfz, 5)
       
       
    END SUBROUTINE calc_field_changes
    