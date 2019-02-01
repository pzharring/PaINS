    SUBROUTINE advance_fields()
       ! advance_fields ---------------------------------------------------
       !
       ! This subroutine advances the physical fields to the next timestep 
       ! via the Rusanov method.
       !
       ! ------------------------------------------------------------------
       IMPLICIT NONE
       INTEGER :: msg_size
       
       ! density
       rho%field(2:Xnum - 1, 2:Ynum - 1, : ) = rho%f_prev(2:Xnum - 1, 2:Ynum - 1, :)&
                                             + rho%change(2:Xnum - 1, 2:Ynum - 1, :)
       ! momentum
       rho_u%field(2:Xnum - 1, 2:Ynum - 1, :, :) = rho_u%f_prev(2:Xnum - 1, 2:Ynum - 1, :, :)&
                                                 + rho_u%change(2:Xnum - 1, 2:Ynum - 1, :, :)
       ! energy
       E%field(2:Xnum - 1, 2:Ynum - 1, :) = E%f_prev(2:Xnum - 1, 2:Ynum - 1, :) &
                                          + E%change(2:Xnum - 1, 2:Ynum - 1, :)
       
    END SUBROUTINE advance_fields
    