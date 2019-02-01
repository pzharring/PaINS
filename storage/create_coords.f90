    SUBROUTINE create_coords()
        ! create_coords ---------------------------------------------------
        !
        ! This subroutine fills the arrays that store the coordinate values
        ! of the grid points.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        INTEGER :: i
        
        ALLOCATE(xarr(Xnum))
        ALLOCATE(yarr(Ynum))
        ALLOCATE(zarr(Znum))
        
        ! x axis
        DO i = 1, Xnum
           xarr(i) = Xstart + (i-1)*DX
        ENDDO
        
        ! y axis
        DO i = 1, Ynum
           yarr(i) = Ystart + (i-1)*DY
        ENDDO
        
        ! z axis
        DO i = 1, Znum
           zarr(i) = Zstart + (i-1)*DZ
        ENDDO
        
    
    END SUBROUTINE create_coords
    