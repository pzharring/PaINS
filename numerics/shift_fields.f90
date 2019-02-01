    SUBROUTINE shift_fields()
        ! shift_fields ----------------------------------------------------
        !
        ! This subroutine shifts the fields forward in time so that the
        ! f_prev arrays contain the most recent timestep.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        
        rho%f_prev(:,:, :) = rho%field(:,:, :)
        rho_u%f_prev(:,:, :,:) = rho_u%field(:,:,:, :)
        E%f_prev(:,:, :) = E%field(:,:, :)
    
    END SUBROUTINE shift_fields
    