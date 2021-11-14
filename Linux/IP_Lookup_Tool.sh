 #!/bin/bash
 # use ipinfo.io to obtain geographic information about IP address
     curl -s http://ipinfo.io/$1 > $1.txt
 
 # Location can be determined using only the coordinates

 # isolcate the longitude and latitude 
     grep -i loc $1.txt > $1_loc.txt 
     awk -F" " '{print $2}' $1_loc.txt > $1_loc2.txt
     cat $1_loc2.txt | sed s/'"*",'// | sed s/'"'// > $1_coordinates.txt

 # remove extra location files
     rm $1_loc.txt $1_loc2.txt

 # save IP lookup info in a directory
     echo "Creating directory $1"
     mkdir $1 | mv $1* $1

 # user input required to open Google Maps
     echo "Type the following coordinates then hit Enter"
     cat $1/$1_coordinates.txt
     read coordinates
     echo "Looking up $coordinates"
     firefox https://www.google.com/maps/@"$coordinates",14z
