
if [ ! $# -eq 0 ]
 then
    syntheaOutput=$1
 else
    echo 'WARNING: No output directory specified. '
    exit
fi
syntheaProperties='./src/main/resources/synthea.properties'
sed -i "s,exporter.baseDirectory = ./output/,exporter.baseDirectory = $syntheaOutput,g" $syntheaProperties
