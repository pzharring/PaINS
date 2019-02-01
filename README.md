# PaINS
Parallel Inviscid Navier-Stokes Solver

3D parallel fluid dynamics simulation application for solving compressible Navier-Stokes equations, with no viscosity.
Code uses the Rusanov method to solve the equations, with parallelization done by decomposing the domain along the z-direction into slabs.
Data is stored by each process using collective writes via the parallel netCDF I/O library.
More detailed description of the code design, physical model, and testing and performance analysis can be found in "Report.pdf"

Main program: run_prog.f90
