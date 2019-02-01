MODULE communication

    ! communication +++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ! 
    ! This module defines the variables and subroutines for the domain 
    ! decomposition and MPI communication. Domain is decomposed 
    ! one-dimensionally along the z-direction (the "z-slab" configuration).
    ! 
    ! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    USE mpi
    USE model_params
    USE sim_state
    IMPLICIT NONE
    
    INTEGER :: nprocs, ierr, rank, tag1, tag2
    INTEGER, DIMENSION(4) :: reqs, statuses
    INTEGER :: mysz, myez ! z-direction start and end indices for the rank
    INTEGER :: size_z ! number of elements in z direction for the rank
    INTEGER :: stride_z ! partition domain every stride_z cells
    INTEGER :: adj_zL, adj_zU ! adjacent ranks (lower, upper)
    REAL(kind=kr) :: tc1, tc2, tc ! timers for communication
    
    ! Buffers for neighboring ghost cell data
    REAL(kind=kr), DIMENSION (:), ALLOCATABLE :: prevbufo, nextbufo, prevbufi, nextbufi
    
    
    CONTAINS
    
    INCLUDE "message_passing/decompose.f90"
    INCLUDE "message_passing/ghost_exchanges.f90"

END MODULE communication

