MODULE model_params

    ! model_params ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ! 
    ! This module defines the relevant parameters of the model to be
    ! run. These include the simulation box size, grid spacing, and 
    ! function definitions for the flux functions in the x-y-z directions 
    ! for each variable.
    !
    ! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    USE sim_state
    IMPLICIT NONE
    SAVE
    
    ! grid spacing
    REAL(kind=kr) :: DX
    REAL(kind=kr) :: DY
    REAL(kind=kr) :: DZ
    REAL(kind=kr) :: gamma = 5._kr/3._kr ! ratio of specific heats
    
    ! number of indices along x, y, z axes
    INTEGER :: Xnum = 100
    INTEGER :: Ynum = 100
    INTEGER :: Znum = 150
    
    ! x,y,z bounds
    REAL(kind=kr) :: Xstart = -0.5_kr
    REAL(kind=kr) :: Xend = 0.5_kr
    REAL(kind=kr) :: Ystart = -0.5_kr
    REAL(kind=kr) :: Yend = 0.5_kr
    REAL(kind=kr) :: Zstart = -0.75_kr
    REAL(kind=kr) :: Zend = 0.75_kr
    
    INTEGER :: maxsteps  = 800 ! maximum number of timesteps to take
    INTEGER :: save_n_steps = 80 ! save simulation data every n steps
    
    ! arrays to store the coordinates of the grid points
    REAL(kind=kr), DIMENSION(:), ALLOCATABLE :: xarr, yarr, zarr
    
    
    

    CONTAINS
    
    ! flux functions
    INCLUDE "phys_functs/density_functs.f90"
    INCLUDE "phys_functs/momentum_x_functs.f90"
    INCLUDE "phys_functs/momentum_y_functs.f90"
    INCLUDE "phys_functs/momentum_z_functs.f90"
    INCLUDE "phys_functs/energy_functs.f90"
    
    ! Subroutine to construct coordinates
    INCLUDE "storage/create_coords.f90"


END MODULE model_params

