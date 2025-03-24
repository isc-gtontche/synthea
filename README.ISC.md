# Generating HL7 files with synthea
- this is a VERY old veresion of synthea. We need to rebase with latest Synthea.
- The workflow for generating HL7 from Synthea is based on having Synthea generate CCDA documents and then converting these to HL7 using IRIS.
- Iris converts first to SDA3, then each SDA3 is converted to HL7 and the message is written to IRIS.
- Writing to IRIS is essential, as CCDAs / SDA3 files can quickly exhaust available local storage.

## CCDAtoSDAConverter
- covernts a large CCDA to an SDA3 object.

## SDASplitter
- converts SDA3 streamlets from the CCDA patient record to individual HL7 files

- InsertHL7 writes the HL7 messages as a string into the database as a `Synthea.HSLIB.PatientRecords` record

- the script `storeCCDA.sh` assumes that iris is installed locally and contains all the necessary classes to run this command:
  - zn "HSLIB" zw ##class(Synthea.CCDAtoSDAConverter).ConvertCCDA("$ccdaDir","$sdaDir","$filename") 
  
- Custom code for CCDA to HL7 converter:
  - https://swarm.iscinternal.com/files/qdtools/healthshare/stress-test/Synthea/HSLIB/CCDAtoSDAConverter.xml

- Custom code for writing HL7 to iris, instead of CCDA to disk:
- `src/main/java/org/mitre/synthea/export/Exporter.java` is modified to execute `storeCCDA.sh` instead of writing the CCDA to disk.
