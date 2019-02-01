    SUBROUTINE deallocate_arrays()
        ! deallocate_arrays -----------------------------------------------
        !
        ! This subroutine deallocates the arrays that store the necessary 
        ! values for the physical variables.
        !
        ! -----------------------------------------------------------------
        IMPLICIT NONE
        
        ! density
        
        DEALLOCATE(rho%field)
        DEALLOCATE(rho%f_prev)
        DEALLOCATE(rho%change)
        
        ! momentum
        DEALLOCATE(rho_u%field)
        DEALLOCATE(rho_u%f_prev)
        DEALLOCATE(rho_u%change)
        
        ! energy
        
        DEALLOCATE(E%field)
        DEALLOCATE(E%f_prev)
        DEALLOCATE(E%change)
        
        ! pressure
        
        DEALLOCATE(p)
        
        ! ghost cell data arrays
        DEALLOCATE(chmatr_in)
        DEALLOCATE(chmatr_out)
        DEALLOCATE(prevbufo)
        DEALLOCATE(prevbufi)
        DEALLOCATE(nextbufo)
        DEALLOCATE(nextbufi)
    
    END SUBROUTINE deallocate_arrays
    
    