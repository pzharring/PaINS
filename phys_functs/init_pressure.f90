    SUBROUTINE init_pressure()
        ! init_pressure -----------------------------------------------------
        !
        ! This subroutine initializes the pressure field.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        INTEGER :: j,k,l, l_eff
        REAL(kind=kr) :: scalar, r
        
        scalar = 0.1_kr
        
        DO l=1, size_z
            DO k=1, Ynum
                DO j=1, Xnum
                    l_eff = mysz + l - 1
                    r = SQRT(xarr(j)**2 + yarr(k)**2 + zarr(l_eff)**2)
                    IF (r < 0.1_kr) THEN
                        p(j,k,l) = 100*scalar
                    ELSE
                        p(j,k,l) = scalar
                    ENDIF
                ENDDO
            ENDDO
        ENDDO
        
        
    
    
    END SUBROUTINE init_pressure
    
    