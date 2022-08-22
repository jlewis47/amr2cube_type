# amr2cube_type
Quick modification/Hack of RAMSES amr2cube tool for speeding things up

Base code found in ramses bitbucket under utils/f90

Original version would read all data then write output for one field, this modification allows writing several fields at once using a set of preconfigured 
arguments/names. Written files are named automatically according to the choices of fields.
Note that there are further modifications allowing execution for the Cosmic Dawn III simulation : input files are split amongst 16 directories for each 
snapshot & file numbers are encoded on 6 digits (versus default ramses' 5).

Compile using make amr2cube_summit_type

Use as ([] denote required input; line jumps were added for readability):

./amr2cube_summit_type -inp [str, path to input dir]   
                       -out [str, path to output dir]   
                       -num [int, file number]   
                       -xmi [float, min x coord]  
                       -xma [float, max x coord]   
                       -ymi [float, min y coord]  
                       -yma [float, max y coord]  
                       -zmi [float, min z coord]  
                       -zma [float, max z coord] 
                       -rho [int, type int associated with field] 
                       -rhod [int, type int associated with field]
                       -vx [int, type int associated with field] 
                       -vy [int, type int associated with field]
                       -vz [int, type int associated with field]  
                       -metal [int, type int associated with field]  
                       -xion [int, type int associated with field] 
                       
                       
As a reminder, a list of the type ints and associated fields can be found in each snapshot output folder in the file "hydro_part_descriptor.txt"
rho -> gas density
rhod -> dust densities
vx, vy, vz -> gas velocities
metal -> gas metallicities
xion -> ATON H gas ionisation fraction

The field arguments are optional, but if none are selected, nothing will be written!

