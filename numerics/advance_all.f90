    SUBROUTINE advance_all()
       ! advance_all ------------------------------------------------------
       !
       ! This subroutine advances the simulation to the next timestep 
       ! via the Rusanov method.
       !
       ! ------------------------------------------------------------------
       IMPLICIT NONE
       INTEGER :: j,k,l
       
       ! calculate field changes

       tn1 = MPI_WTIME()
       CALL calc_field_changes()
       tn2 = MPI_WTIME()
       tn = tn + (tn2 - tn1)
       
       tc1 = MPI_WTIME()
       ! exchange updates between ghost cells
       CALL ghost_exchanges()
       tc2 = MPI_WTIME()
       tc = tc + (tc2 - tc1)
       
       ! advance fields
       tn1 = MPI_WTIME()
       CALL advance_fields()
       
       ! enforce periodic BCs and advance simtime
       CALL set_BCs()
       CALL shift_fields()

       simtime = simtime + DT
       
       ! update helper quantities
       CALL calc_pressure()
       tn2 = MPI_WTIME()
       tn = tn + (tn2 - tn1)
       
       
    END SUBROUTINE advance_all
    
    