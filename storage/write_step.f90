    SUBROUTINE write_step()
        ! init_output_file ------------------------------------------------
        !
        ! This subroutine writes the data from the most recent timestep 
        ! into the output file.
        !
        ! -----------------------------------------------------------------
        INTEGER(kind=MPI_OFFSET_KIND) :: timeindex, one
        INTEGER :: sz_eff, ez_eff ! effective write start and end indices for z-direction
        
        timeindex = INT(stepnum/save_n_steps, kind=MPI_OFFSET_KIND)
        one = INT(1, kind=MPI_OFFSET_KIND)
    
        IF (rank == 0) THEN
            Wstart = (/ one, one, one, timeindex /)
            Wcount = (/ INT(Xnum, kind=MPI_OFFSET_KIND), &
                        INT(Ynum, kind=MPI_OFFSET_KIND), &
                        INT(size_z - 1, kind=MPI_OFFSET_KIND), one /)
            sz_eff = 1
            ez_eff = size_z - 1
        ELSEIF (rank == nprocs - 1) THEN
            Wstart = (/ one, one, INT(mysz + 1, kind=MPI_OFFSET_KIND), timeindex /)
            Wcount = (/ INT(Xnum, kind=MPI_OFFSET_KIND), &
                        INT(Ynum, kind=MPI_OFFSET_KIND), &
                        INT(size_z - 1, kind=MPI_OFFSET_KIND), one /)
            sz_eff = 2
            ez_eff = size_z
        ELSE
            Wstart = (/ one, one, INT(mysz + 1, kind=MPI_OFFSET_KIND), timeindex /)
            Wcount = (/ INT(Xnum, kind=MPI_OFFSET_KIND), &
                        INT(Ynum, kind=MPI_OFFSET_KIND), &
                        INT(size_z - 2, kind=MPI_OFFSET_KIND), one /)
            sz_eff = 2
            ez_eff = size_z - 1
        ENDIF

        ! write physical variables
        CALL check( nf90mpi_put_var_all(ncid, dens_varid, rho%field(1:Xnum,1:Ynum,sz_eff:ez_eff),&
                                        start = Wstart, count = Wcount) )
        CALL check( nf90mpi_put_var_all(ncid, mom_x_varid, rho_u%field(1:Xnum,1:Ynum,sz_eff:ez_eff,1),&
                                        start = Wstart, count = Wcount) )
        CALL check( nf90mpi_put_var_all(ncid, mom_y_varid, rho_u%field(1:Xnum,1:Ynum,sz_eff:ez_eff,2),&
                                        start = Wstart, count = Wcount) )
        CALL check( nf90mpi_put_var_all(ncid, mom_z_varid, rho_u%field(1:Xnum,1:Ynum,sz_eff:ez_eff,3),&
                                        start = Wstart, count = Wcount) )
        CALL check( nf90mpi_put_var_all(ncid, energy_varid, E%field(1:Xnum,1:Ynum,sz_eff:ez_eff),&
                                        start = Wstart, count = Wcount) )
        
        ! write simulation time
        !CALL check( nf90mpi_begin_indep_data(ncid) )
        
        !IF (rank == 0) THEN
            !CALL check( nf90mpi_put_var(ncid, t_varid, simtime, start = Wstart) )
        !ENDIF
        
        !CALL check( nf90mpi_end_indep_data(ncid) )
        
    
    END SUBROUTINE write_step
    