PROGRAM run_prog
    ! prog_test.f90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    !
    !  --------- PaINS ---------------------
    ! Parallel Inviscid Navier-Stokes solver
    ! Peter Harrington
    ! --------------------------------------
    !
    ! This is the driver program for the PaINS code
    !
    ! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   USE integration
   USE sim_state
   USE model_params
   USE output_writing
   USE communication
   IMPLICIT NONE
   
   INTEGER, PARAMETER :: dp = SELECTED_REAL_KIND(15, 307)
   REAL(kind=dp) :: t1, t2
   
   
   CALL MPI_INIT(ierr)
   CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
   CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
   
   tn = 0._kr
   tc = 0._kr
   ts = 0._kr
   
   IF (rank == 0) THEN
       PRINT *, "Running with", nprocs, "processes"
       t1 = MPI_WTIME()
   ENDIF
   
   ! Set DX, DY, DZ
   DX = (Xend-Xstart)/real(Xnum-1,kind=kr)
   DY = (Yend-Ystart)/real(Ynum-1,kind=kr)
   DZ = (Zend-Zstart)/real(Znum-1,kind=kr)
   
   DT = 1d-3
   DT_max = 1._kr
   
   ! initialize
   CALL init_all()
   
   DO stepnum=1, maxsteps
       ! advance the simulation
       CALL set_next_DT()
       
       CALL advance_all()
       
       ! save data
       IF (MOD(stepnum, save_n_steps) == 0) THEN
           ts1 = MPI_WTIME()
           CALL write_step()
           ts2 = MPI_WTIME()
           ts = ts + (ts2 - ts1)
       ENDIF
       
   ENDDO
   
   ! end sim
   CALL deallocate_arrays()
   CALL close_file()
   
   
   
   IF (rank==0) THEN
       PRINT *, "Simulation finished"
       t2 = MPI_Wtime()
       PRINT *, "rank", rank, "tc", tc, "tn", tn, "ts", ts
       PRINT *, "total time:", t2-t1
   ENDIF
   
   CALL MPI_FINALIZE(ierr)
   
   
END PROGRAM run_prog



