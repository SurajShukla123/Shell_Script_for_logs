#!/bin/bash

#date of creation for that use date command
#$Revision:001$

#variable

BASE=/home/suraj/tutorials/find_command
Days=7
DEPTH=1
RUN=0
#Check if the Directory is present or not 
 
If[ !-d $BASE]
then  
           echo “Directory does not exist: $BASE”
           exit 1
fi
#Create a archive folder if not already present

If[ ! -d $BASE/archive ]
then  
      mkdir $BASE/archive
fi

# find the list of file larger that 10MB

for i in `find $BASE -maxdepth $DEPTH -type f -size +10M`
do 
   if[$Run -eq 0 ]
   then 
         echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive" 
         gzip $i || exit 1
	     mv $i.gz $BASE/archive || exit 1
	  
	   fi
	done
	
