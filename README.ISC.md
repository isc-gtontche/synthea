# Generating HL7 files with synthea
- this is a VERY old veresion of synthea.
- The workflow is based on generating CCDA documents and converting these to HL7 using the IRIS CCDAtoHL7 converter.

- the script `storeCCDA.sh` assumes that iris is installed locally and contains all the necessary classes to run this command:
  - zn "HSLIB" zw ##class(Synthea.CCDAtoSDAConverter).ConvertCCDA("$ccdaDir","$sdaDir","$filename") 
  
- Custom code for CCDA to HL7 converter:
  - https://swarm.iscinternal.com/files/qdtools/healthshare/stress-test/Synthea/HSLIB/CCDAtoSDAConverter.xml

- Custom code for writing HL7 to iris, instead of CCDA to disk:
- `src/main/java/org/mitre/synthea/export/Exporter.java` is modified to execute `storeCCDA.sh` instead of writing the CCDA to disk.
