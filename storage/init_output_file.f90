    SUBROUTINE init_output_file()
        ! init_output_file ------------------------------------------------
        !
        ! This subroutine creates and defines dimenions and units for the 
        ! netCDF file that stores simulation data.
        !
        ! -----------------------------------------------------------------
    
        CALL check( nf90mpi_create(MPI_COMM_WORLD, FILE_NAME, &
                    OR(NF90_CLOBBER, NF90_64BIT_OFFSET), MPI_INFO_NULL, ncid) )
          
        ! Define coordinate dimensions and assign names, units
        CALL check( nf90mpi_def_dim(ncid, ZCOORD_NAME, &
                                    INT(Znum, kind=MPI_OFFSET_KIND), z_dimid) )
        CALL check( nf90mpi_def_dim(ncid, YCOORD_NAME, &
                                    INT(Ynum, kind=MPI_OFFSET_KIND), y_dimid) )
        CALL check( nf90mpi_def_dim(ncid, XCOORD_NAME, &
                                    INT(Xnum, kind=MPI_OFFSET_KIND), x_dimid) )
        CALL check( nf90mpi_def_dim(ncid, TREC_NAME, NF90MPI_UNLIMITED, t_dimid) )
        
        CALL check( nf90mpi_def_var(ncid, XCOORD_NAME, NF90_DOUBLE, x_dimid, x_varid) )
        CALL check( nf90mpi_def_var(ncid, YCOORD_NAME, NF90_DOUBLE, y_dimid, y_varid) )
        CALL check( nf90mpi_def_var(ncid, ZCOORD_NAME, NF90_DOUBLE, z_dimid, z_varid) )
        CALL check( nf90mpi_def_var(ncid, TREC_NAME, NF90_DOUBLE, t_dimid, t_varid) )
        CALL check( nf90mpi_put_att(ncid, x_varid, UNITS, SPATIAL_UNITS) )
        CALL check( nf90mpi_put_att(ncid, y_varid, UNITS, SPATIAL_UNITS) )
        CALL check( nf90mpi_put_att(ncid, z_varid, UNITS, SPATIAL_UNITS) )
        CALL check( nf90mpi_put_att(ncid, t_varid, UNITS, TIME_UNITS) )
        

        
        dimids = (/ x_dimid, y_dimid, z_dimid, t_dimid /)

        ! Define physical variables and assign units
        CALL check( nf90mpi_def_var(ncid, DENS_NAME, NF90_DOUBLE, dimids, dens_varid) )
        CALL check( nf90mpi_def_var(ncid, MOM_X_NAME, NF90_DOUBLE, dimids, mom_x_varid) )
        CALL check( nf90mpi_def_var(ncid, MOM_Y_NAME, NF90_DOUBLE, dimids, mom_y_varid) )
        CALL check( nf90mpi_def_var(ncid, MOM_Z_NAME, NF90_DOUBLE, dimids, mom_z_varid) )
        CALL check( nf90mpi_def_var(ncid, ENERGY_NAME, NF90_DOUBLE, dimids, energy_varid) )
        CALL check( nf90mpi_put_att(ncid, dens_varid, UNITS, DENS_UNITS) )
        CALL check( nf90mpi_put_att(ncid, mom_x_varid, UNITS, MOM_UNITS) )
        CALL check( nf90mpi_put_att(ncid, mom_y_varid, UNITS, MOM_UNITS) )
        CALL check( nf90mpi_put_att(ncid, mom_z_varid, UNITS, MOM_UNITS) )
        CALL check( nf90mpi_put_att(ncid, energy_varid, UNITS, ENERGY_UNITS) )
          
        ! End define mode
        CALL check( nf90mpi_enddef(ncid) )
        
        
        ! Write the coordinate grid data into the file
        
        CALL check( nf90mpi_begin_indep_data(ncid) )
        
        IF (rank == 0) THEN
            CALL check( nf90mpi_put_var(ncid, x_varid, xarr) )
            CALL check( nf90mpi_put_var(ncid, y_varid, yarr) )
            CALL check( nf90mpi_put_var(ncid, z_varid, zarr) )
        ENDIF
        
        CALL check( nf90mpi_end_indep_data(ncid) )
    
    END SUBROUTINE init_output_file
    