    SUBROUTINE close_file()
        ! close the output file
        IMPLICIT NONE
        CALL check( nf90mpi_close(ncid) )
    
    END SUBROUTINE close_file
    