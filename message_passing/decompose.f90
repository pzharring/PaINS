    SUBROUTINE decompose()
        ! decompose -------------------------------------------------------
        !
        ! Decomposes the simulation domain into slabs along the z-direction
        ! by setting the tracking variables/indices to the appropriate 
        ! values.
        !
        ! -----------------------------------------------------------------

        IMPLICIT NONE
        
        stride_z = Znum/nprocs
        
        
        ! Define start and end indices for z
        IF (rank == 0) THEN
            ! bottom z-boundary
            mysz = 1
            myez = stride_z + 1
            size_z = stride_z + 1
            adj_zL = nprocs - 1
            adj_zU = rank + 1
        ELSEIF (rank == nprocs - 1) THEN
            ! top z-boundary
            mysz = rank*stride_z
            myez = Znum
            size_z = Znum - mysz + 1
            adj_zL = rank - 1
            adj_zU = 0
        ELSE
            ! z interior
            mysz = rank*stride_z
            myez = mysz + stride_z + 1
            size_z = stride_z + 2
            adj_zL = rank - 1
            adj_zU = rank + 1
        ENDIF
    
    END SUBROUTINE decompose
    
    