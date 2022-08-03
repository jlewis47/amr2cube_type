# Makefile for RAMSES utils
BINDIR=.

# Ifort configuration
#F90=mpiifort
#CFLAGS=-free -fpp -traceback

# Summit
F90=mpif90 -cpp -O3 -g -traceback
#F90=pgfortran -O3 -g -cpp
CFLAGS= -DSIXDIGITS

# # Gfortran configuration
#F90=
#CFLAGS=-ffree-line-length-none -std=f2008  -Wall -x f95-cpp-input
#CFLAGS= -free -fpp

LFLAGS= -DSIXDIGITS

MODOBJ=random.o utils.o io_ramses.o

# Make all targets
#all: amr2prof amr2cylprof ramses2tipsy amr2map part2map part2prof \
     part2cube part2list partcenter part2birth part2sfr getstarlist \
     amr2cube amr2cube_joe amr2cube_joe_summit amr2cube_summit amr2cube_summit_type getstarlist_summit

all: getstarlist amr2cube

amr2prof: $(MODOBJ) amr2prof.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
amr2cylprof: $(MODOBJ) amr2cylprof.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
amr2map: $(MODOBJ) amr2map.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

amr2cube: $(MODOBJ) amr2cube.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

amr2cube_joe: $(MODOBJ) amr2cube_joe.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

amr2cube_joe_summit: $(MODOBJ) amr2cube_joe_summit.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

amr2cube_summit: $(MODOBJ) amr2cube_summit.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

amr2cube_summit_type: $(MODOBJ) amr2cube_summit_type.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

ramses2tipsy: $(MODOBJ) ramses2tipsy.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

part2map: $(MODOBJ) utils.o part2map.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
part2cube: $(MODOBJ) utils.o part2cube.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
part2prof: $(MODOBJ) utils.o part2prof.o
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
part2list: $(MODOBJ) utils.o part2list.f90
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@

partcenter: $(MODOBJ) utils.o partcenter.f90
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
part2birth: $(MODOBJ) utils.o part2birth.f90
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
part2sfr: $(MODOBJ) part2sfr.f90
	$(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
getstarlist:  $(MODOBJ) getstarlist.f90 
	 $(F90) $(LFLAGS) $^ -o $(BINDIR)/$@
getstarlist_summit:  $(MODOBJ) getstarlist_summit.f90 
	 $(F90) $(LFLAGS) $^ -o $(BINDIR)/$@


# Make a specific object file
%.o: %.f90
	$(F90) $(CFLAGS) -c $^ -o $@
clean:
	rm *.o *.mod
