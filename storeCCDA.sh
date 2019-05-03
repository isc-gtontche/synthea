#!/usr/bin/env bash
outputDir=/home/synthea/output
ccdaDir=$outputDir/ccda/
sdaDir=$outputDir/sdarepo/
splitDir=$sdaDir/split

if [ ! -d $ccdaDir ]; then
   sudo mkdir -p $ccdaDir
fi
if [ ! -d $sdaDir ]; then
   sudo mkdir -p $sdaDir
fi
if [ ! -d $splitDir ]; then
   sudo mkdir -p $sdaDir/split
fi


echo $sdaDir
echo $ccdaDir

ccontrol session STRESS <<- EOS
_system
SYS
zn "HSLIB" zw ##class(Synthea.CCDAtoSDAConverter).ConvertCCDA("$ccdaDir","$sdaDir") 
EOS

for f in $ccdaDir/*.xml
	do 
		sudo rm "$f"
	done
        
for f in $sdaDir/*.xml
	do 
		sudo rm "$f"
	done

for f in $splitDir/*.xml
	do 
		sudo rm "$f"
	done
echo "HELLO FROM INSIDE HELL" >> ./Kuleet.txt
done
