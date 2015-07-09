
# GS1 external extension

This is a work-in-progress folder containing information about GS1's schemas and 
their mappings to schema.org

# Files

Please do note cite or use these as anything other than experimental works-in-progress.

* nlv01111-gs1.nt 
* sdo-gs1-seealso.csv 


The latter was created via 

> grep schema.org nlv01111-gs1.nt | grep seeAlso |  sed 's/[<>]//g' | awk '{print $1, ", ", $3}'

