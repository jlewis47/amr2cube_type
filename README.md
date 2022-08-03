# amr2cube_type
Quick modification/Hack of RAMSES amr2cube tool for speeding things up

Base code found in ramses bitbucket under utils/f90

Original version would read all data then write output for one field, this modification allows writing several fields at once using a set of preconfigured 
arguments/names. Written files are named automatically according to the choices of fields.
Note that there are further modifications allowing execution for the Cosmic Dawn II simulation : input files are split amongst 16 directories for each 
snapshot & file numbers are encoded on 6 digits (versus default ramses' 5).

Compile using make amr2cube_summit_type

Use as ([] denote required input, % are explanatory comments):

./amr2cube_summit_type -inp [str, path to input dir] 
                       -out [str, path to output dir] 
                       -num [int, file number] 
                       -xmi [float, min x coord]
                       -xma [float, max x coord] 
                       -ymi [float, min y coord] 
                       -yma [float, max y coord] 
                       -zmi [float, min z coord] 
                       -zma [float, max z coord]
                       -rho %write gas densities
                       -rhod %write dust densities
                       -vx %write x dir gas velocities
                       -vy %write y dir gas velocities
                       -vz %write z dir gas velocities  
                       -metal %write gas metallicities
                       -xion %write the ionised fraction of H gas from ATON

