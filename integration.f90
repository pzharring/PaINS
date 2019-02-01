MODULE integration

    ! integration +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ! 
    ! This module handles the general numerical integration techniques used
    ! to advance the conservative ideal MHD equations in time. Advancement
    ! is done via the Rusanov method.
    ! 
    ! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    USE sim_state
    USE model_params
    USE communication
    IMPLICIT NONE
    REAL(kind=kr) :: tn1, tn2, tn ! timers for numerical calcualtion

    
    CONTAINS
    

    INCLUDE "numerics/advance_all.f90"
    INCLUDE "numerics/advance_fields.f90"
    INCLUDE "numerics/calc_field_changes.f90"
    INCLUDE "phys_functs/calc_pressure.f90"

    INCLUDE "numerics/calc_update_grid.f90"
    INCLUDE "numerics/calc_update.f90"
    INCLUDE "numerics/set_next_DT.f90"
    INCLUDE "numerics/set_BCs.f90"
    INCLUDE "numerics/shift_fields.f90"

    

END MODULE integration

