    SUBROUTINE set_next_DT()
        ! set_next_DT -----------------------------------------------------
        !
        ! This subroutine sets the size of the next step size based on the 
        ! CFL condition.  The result is selected to be the minimum between 
        ! the CFL value, the maximum allowable step size, and a 5% increase
        ! of the current timestep size. This way, if the value given by the 
        ! CFL condition is very large, the step size will still be tightly 
        ! bound to ensure the simulation doesn't "step-over" sections 
        ! requiring more detail.
        !
        ! ------------------------------------------------------------------
        IMPLICIT NONE
        INTEGER :: j, k, l
        REAL(kind=kr) :: maxvalue, max_x, max_y, max_z, DT_CFLval, &
                         xvel, yvel, zvel, global_max
        
        
        
        maxvalue = 0._kr
        
        max_x = 0._kr
        max_y = 0._kr
        max_z = 0._kr
        
        DO l=1, size_z
            DO k=1, Ynum-1
                DO j=1, Xnum-1
                   xvel = ABS(rho_u%f_prev(j,k,l, 1)/rho%f_prev(j,k,l))
                   yvel = ABS(rho_u%f_prev(j,k,l, 2)/rho%f_prev(j,k,l))
                   zvel = ABS(rho_u%f_prev(j,k,l, 3)/rho%f_prev(j,k,l))
                   IF ( xvel > max_x) THEN
                       max_x = xvel
                   ELSEIF (yvel > max_y) THEN
                       max_y = yvel
                   ELSEIF (zvel > max_z) THEN
                       max_z = zvel
                   ENDIF
                ENDDO
            ENDDO
        ENDDO
        
        maxvalue = 2._kr*MAX(max_x/DX, max_y/DY, max_z/DZ)
        
        CALL MPI_ALLREDUCE(maxvalue, global_max, 1, MPI_DOUBLE_PRECISION, &
                           MPI_MAX, MPI_COMM_WORLD, ierr)
        
        IF (global_max < 1.d-30) THEN
            DT_CFLval = 1.d30 ! set CFL speed to huge number if the velocity is small
        ELSE
            DT_CFLval = 0.9_kr/(2._kr * global_max)
        ENDIF
        
        DT = MIN(DT_CFLval, DT*1.05, DT_max)
    
    END SUBROUTINE set_next_DT
    