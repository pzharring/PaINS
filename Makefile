# Beta Makefile

OBJECTS = integration.o sim_state.o model_params.o run_prog.o output_writing.o communication.o
LINKFLAG = -dynamic
PROG = PaINS_executable
F90 = ftn

all: $(PROG)

$(PROG): $(OBJECTS)
	$(F90) $(LINKFLAG) $(OBJECTS) -o $(PROG)


sim_state.o:
	$(F90) $(LINKFLAG) sim_state.f90 -c

model_params.o: sim_state.o
	$(F90) $(LINKFLAG) model_params.f90 -c

integration.o: sim_state.o model_params.o communication.o
	$(F90) $(LINKFLAG) integration.f90 -c

output_writing.o: sim_state.o model_params.o
	$(F90) $(LINKFLAG) output_writing.f90 -c


.SUFFIXES: $(SUFFIXES) .f90

.f90.o:
	$(F90) $(LINKFLAG) -c $<

.mod.o:
	$(F90) $(LINKFLAG) -c $*.f90

run_prog.o: integration.o model_params.o sim_state.o output_writing.o communication.o

clean:
	rm -f $(OBJECTS) $(OBJECTS) *.mod $(PROG)
