MODULE sim_state

    ! sim_state +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ! 
    ! This module defines the global variables that track the state of the 
    ! simulation as it advances forward in time. Physical variables are 
    ! density, momentum, density*energy (since the equations
    ! are written in conservative form), and pressure. The code advances the
    ! first three via the conservative inviscid Navier-Stokes equations, 
    ! and then pressure is updated accordingly after each timestep completes.
    !
    ! The simulation time, indices for current and previous timesteps, and 
    ! the sizes of current and previous timesteps are also defined here.
    !
    ! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    IMPLICIT NONE
    
    SAVE
    PUBLIC :: rho, rho_u, E, p, chmatr_in, chmatr_out
    
    INTEGER, PARAMETER :: kr  = kind(dble(0.))   !double precision
    REAL(kind=kr), PARAMETER :: pi = 4._kr * atan(1._kr) ! pi
    REAL(kind=kr), PARAMETER :: mu0 = 4._kr*pi !4._kr*pi*1.d7


    TYPE scalarfield
        
        ! indices are (j,k,l)
        ! j = x-index, k = y-index, l = z-index
        REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:) :: field
        REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:) :: f_prev
        REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:) :: change
        
    END TYPE scalarfield
    
    TYPE vectorfield 
        
        ! indices are (j,k,l, direction)
        ! j = x-index, k = y-index, l = z-index
        ! direction: 1=x, 2=y, 3=z
        REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:,:) :: field
        REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:,:) :: f_prev
        REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:,:) :: change
        
    END TYPE vectorfield


    ! Simulation physical variables
    TYPE(scalarfield) :: rho ! density
    TYPE(vectorfield) :: rho_u ! momentum
    TYPE(scalarfield) :: E ! energy
    REAL(kind=kr), ALLOCATABLE, DIMENSION(:,:,:) :: p ! pressure
    
    ! matrices to hold ghost cell values between MPI ranks
    REAL(kind=kr), ALLOCATABLE, DIMENSION (:,:,:,:) :: chmatr_in, chmatr_out
    
    
    REAL(kind=kr) :: simtime ! current time in the simulation
    INTEGER :: stepnum ! number of timesteps taken
    
    !timestep sizes
    REAL(kind=kr) :: DT ! current stepsize
    REAL(kind=kr) :: DT_max ! maximum allowable stepsize
    

    CONTAINS

END MODULE sim_state

