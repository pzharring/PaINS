MODULE output_writing

    ! output_writing ++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ! 
    ! This module handles writing the output files for the simulation, 
    ! using netCDF. All are stored as 4D arrays, 3 axes for the spatial
    ! dimensions and one axis for time.
    !
    ! +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    USE pnetcdf
    USE sim_state
    USE model_params
    USE communication
    IMPLICIT NONE
    
    CHARACTER (len = *), PARAMETER :: FILE_NAME = "PaINS_out.cdf"
    INTEGER :: ncid
    REAL(kind=kr) :: ts1, ts2, ts ! timers for storage

    ! Coordinates
    INTEGER, PARAMETER :: NDIMS = 4
    CHARACTER (len = *), PARAMETER :: XCOORD_NAME = "x"
    CHARACTER (len = *), PARAMETER :: YCOORD_NAME = "y"     
    CHARACTER (len = *), PARAMETER :: ZCOORD_NAME = "z"
    CHARACTER (len = *), PARAMETER :: TREC_NAME = "time"
    INTEGER :: x_dimid, y_dimid, z_dimid, t_dimid
    INTEGER :: x_varid, y_varid, z_varid, t_varid

    ! Physical variables
    INTEGER(kind=MPI_OFFSET_KIND) :: Wstart(NDIMS), Wcount(NDIMS)
    INTEGER :: dimids(NDIMS)
    INTEGER :: dens_varid, mom_x_varid, mom_y_varid, mom_z_varid,&
               mag_x_varid, mag_y_varid, mag_z_varid, energy_varid
    CHARACTER (len = *), PARAMETER :: DENS_NAME="density"
    CHARACTER (len = *), PARAMETER :: MOM_X_NAME="momentum x"
    CHARACTER (len = *), PARAMETER :: MOM_Y_NAME="momentum y"
    CHARACTER (len = *), PARAMETER :: MOM_Z_NAME="momentum z"
    CHARACTER (len = *), PARAMETER :: ENERGY_NAME="energy"
    
    ! Units
    CHARACTER (len = *), PARAMETER :: UNITS = "units"
    CHARACTER (len = *), PARAMETER :: SPATIAL_UNITS = "m"
    CHARACTER (len = *), PARAMETER :: TIME_UNITS = "s"
    CHARACTER (len = *), PARAMETER :: DENS_UNITS = "kg/m^3"
    CHARACTER (len = *), PARAMETER :: MOM_UNITS = "kg m^2/s^2"
    CHARACTER (len = *), PARAMETER :: ENERGY_UNITS = "J/m^3"


    CONTAINS
    
    ! Initialization subroutines
    INCLUDE "storage/init_output_file.f90"
    INCLUDE "phys_functs/init_density.f90"
    INCLUDE "phys_functs/init_momentum.f90"
    INCLUDE "phys_functs/init_energy.f90"
    INCLUDE "phys_functs/init_pressure.f90"
    INCLUDE "storage/init_all.f90"
    
    ! data allocation/writing subroutines
    INCLUDE "storage/write_step.f90"
    INCLUDE "storage/check.f90"
    INCLUDE "storage/close_file.f90"
    INCLUDE "storage/allocate_arrays.f90"
    INCLUDE "storage/deallocate_arrays.f90"


END MODULE output_writing

