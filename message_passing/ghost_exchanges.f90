    SUBROUTINE ghost_exchanges()
       ! ghost_exchanges ---------------------------------------------------
       !
       ! This subroutine sends the required updates between ghost cells.
       !
       ! ------------------------------------------------------------------
       IMPLICIT NONE
       INTEGER :: msg_size, j,k
       !REAL(kind=kr), DIMENSION (:), ALLOCATABLE :: prevbufo, nextbufo, prevbufi, nextbufi
       
       !ALLOCATE(prevbufo(Xnum*Ynum*5))
       !ALLOCATE(nextbufo(Xnum*Ynum*5))
       !ALLOCATE(prevbufi(Xnum*Ynum*5))
       !ALLOCATE(nextbufi(Xnum*Ynum*5))
       
       
       
       ! Populate the change matrix to be sent to adjacent ghost cells
       chmatr_out(:,:,1,1) = rho%change(:,:, 2)
       chmatr_out(:,:,1,2) = rho%change(:,:, size_z - 1)
       chmatr_out(:,:,2,1) = rho_u%change(:,:, 2, 1)
       chmatr_out(:,:,2,2) = rho_u%change(:,:, size_z - 1, 1)
       chmatr_out(:,:,3,1) = rho_u%change(:,:, 2, 2)
       chmatr_out(:,:,3,2) = rho_u%change(:,:, size_z - 1, 2)
       chmatr_out(:,:,4,1) = rho_u%change(:,:, 2, 3)
       chmatr_out(:,:,4,2) = rho_u%change(:,:, size_z - 1, 3)
       chmatr_out(:,:,5,1) = E%change(:,:, 2)
       chmatr_out(:,:,5,2) = E%change(:,:, size_z - 1)
       
       
       prevbufo(:) = PACK(chmatr_out(:,:,:,1), .TRUE.)
       nextbufo(:) = PACK(chmatr_out(:,:,:,2), .TRUE.)
       
       ! send and receive
       msg_size = Xnum*Ynum*5
       
       IF (MOD(rank,2) == 0) THEN
           CALL MPI_RECV(prevbufi(:), msg_size, MPI_DOUBLE_PRECISION, adj_zL, tag1, &
                      MPI_COMM_WORLD, statuses(1), ierr)
           CALL MPI_RECV(nextbufi(:), msg_size, MPI_DOUBLE_PRECISION, adj_zU, tag2, &
                      MPI_COMM_WORLD, statuses(2), ierr)
           CALL MPI_SEND(nextbufo(:), msg_size, MPI_DOUBLE_PRECISION, adj_zU, tag1, &
                      MPI_COMM_WORLD, ierr)
           CALL MPI_SEND(prevbufo(:), msg_size, MPI_DOUBLE_PRECISION, adj_zL, tag2, &
                      MPI_COMM_WORLD, ierr)
       ELSE
           CALL MPI_SEND(nextbufo(:), msg_size, MPI_DOUBLE_PRECISION, adj_zU, tag1, &
                      MPI_COMM_WORLD, ierr)
           CALL MPI_SEND(prevbufo(:), msg_size, MPI_DOUBLE_PRECISION, adj_zL, tag2, &
                      MPI_COMM_WORLD, ierr)
           CALL MPI_RECV(prevbufi(:), msg_size, MPI_DOUBLE_PRECISION, adj_zL, tag1, &
                      MPI_COMM_WORLD, statuses(1), ierr)
           CALL MPI_RECV(nextbufi(:), msg_size, MPI_DOUBLE_PRECISION, adj_zU, tag2, &
                      MPI_COMM_WORLD, statuses(2), ierr)
       ENDIF
       
       chmatr_in(:,:,:,1) = RESHAPE(prevbufi(:), (/ Xnum, Ynum, 5 /))
       chmatr_in(:,:,:,2) = RESHAPE(nextbufi(:), (/ Xnum, Ynum, 5 /))
       
       
       rho%change(:,:, 1) = chmatr_in(:,:,1,1)
       rho%change(:,:, size_z) = chmatr_in(:,:,1,2)
       rho_u%change(:,:,1, 1) = chmatr_in(:,:,2,1)
       rho_u%change(:,:,size_z, 1) = chmatr_in(:,:,2,2)
       rho_u%change(:,:,1, 2) = chmatr_in(:,:,3,1)
       rho_u%change(:,:,size_z, 2) = chmatr_in(:,:,3,2)
       rho_u%change(:,:,1, 3) = chmatr_in(:,:,4,1)
       rho_u%change(:,:,size_z, 3) = chmatr_in(:,:,4,2)
       E%change(:,:, 1) = chmatr_in(:,:,5,1)
       E%change(:,:, size_z) = chmatr_in(:,:,5,2)
       
       
       !DEALLOCATE(prevbufo)
       !DEALLOCATE(prevbufi)
       !DEALLOCATE(nextbufo)
       !DEALLOCATE(nextbufi)
       
    END SUBROUTINE ghost_exchanges
    