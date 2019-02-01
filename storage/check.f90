    SUBROUTINE check(errcode)
        ! Simple subroutine to check netCDF error codes
        INTEGER, INTENT(in) :: errcode
        
        IF(errcode /= nf90_noerr) THEN
          PRINT *, trim(nf90mpi_strerror(errcode))
          CALL MPI_Abort(MPI_COMM_WORLD, -1, errcode)
          STOP "Stopped"
        END IF
    END SUBROUTINE check  
    