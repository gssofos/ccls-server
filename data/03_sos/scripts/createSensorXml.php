<?php header("Content-type: text/xml"); ?>
<?php
/**
 * Created by IntelliJ IDEA.
 * User: sofos
 * Date: 06/09/16
 * Time: 19:09
 *
 * http://127.0.0.1/phd/batch/createsensorxml.php?id=SG92
 *http:127.0.0.1:8080/52n-sos-webapp/client?method=POST&accept=application%2Fsoap%2Bxml&contentType=application%2Fsoap%2Bxml&url=http%3A%2F%2F127.0.0.1%3A8080%2F52n-sos-webapp%2Fservice&request=%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3Cenv%3AEnvelope%0A%20%20%20%20xmlns%3Aenv%3D%22http%3A%2F%2Fwww.w3.org%2F2003%2F05%2Fsoap-envelope%22%0A%20%20%20%20xmlns%3Axsi%3D%22http%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema-instance%22%20xsi%3AschemaLocation%3D%22http%3A%2F%2Fwww.w3.org%2F2003%2F05%2Fsoap-envelope%20http%3A%2F%2Fwww.w3.org%2F2003%2F05%2Fsoap-envelope%2Fsoap-envelope.xsd%20http%3A%2F%2Fwww.opengis.net%2Fsos%2F2.0%20http%3A%2F%2Fschemas.opengis.net%2Fsos%2F2.0%2FsosInsertSensor.xsd%20%20%20%20%20http%3A%2F%2Fwww.opengis.net%2Fswes%2F2.0%20http%3A%2F%2Fschemas.opengis.net%2Fswes%2F2.0%2Fswes.xsd%22%3E%0A%20%20%20%20%3Cenv%3ABody%3E%0A%20%20%20%20%20%20%20%20%3Cswes%3AInsertSensor%0A%20%20%20%20%20%20%20%20%20%20%20%20xmlns%3Aswes%3D%22http%3A%2F%2Fwww.opengis.net%...0%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csos%3AobservationType%3Ehttp%3A%2F%2Fwww.opengis.net%2Fdef%2FobservationType%2FOGC-OM%2F2.0%2FOM_GeometryObservation%3C%2Fsos%3AobservationType%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csos%3AobservationType%3Ehttp%3A%2F%2Fwww.opengis.net%2Fdef%2FobservationType%2FOGC-OM%2F2.0%2FOM_SWEArrayObservation%3C%2Fsos%3AobservationType%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C!--%20multiple%20values%20possible%20--%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Csos%3AfeatureOfInterestType%3Ehttp%3A%2F%2Fwww.opengis.net%2Fdef%2FsamplingFeatureType%2FOGC-OM%2F2.0%2FSF_SamplingPoint%3C%2Fsos%3AfeatureOfInterestType%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fsos%3ASosInsertionMetadata%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fswes%3Ametadata%3E%0A%20%20%20%20%20%20%20%20%3C%2Fswes%3AInsertSensor%3E%0A%20%20%20%20%3C%2Fenv%3ABody%3E%0A%3C%2Fenv%3AEnvelope%3E
 *
 */

            include './cred.php';

            $query = "SELECT * FROM LS_Process WHERE setPointCode=?";
            ($stmt = $db->prepare($query))		|| 		fail('MySQL prepare', $db->error);
            $c=$_GET['id'];
            $stmt->bind_param('s', $c)		|| 		fail('MySQL bind_param', $db->error);
            $stmt->execute();
            //$stmt->bind_result($e)|| 		fail('MySQL bind_result', $db->error);
            $e=$stmt->get_result()->fetch_all(1);
            $stmt->close();

            $_id = $e[0]["_id"];
            $fk_operator = $e[0]['fk_operator'];
            $fk_totalStation = $e[0]['fk_totalStation'];

            $height = $e[0]['setPointHeight'];
            $stationId = $e[0]['setPointCode'];


            $query = "SELECT name,contact FROM LS_Operator WHERE _id=?";
            ($stmt = $db->prepare($query))		|| 		fail('MySQL prepare', $db->error);
            $stmt->bind_param('i', $fk_operator)		|| 		fail('MySQL bind_param', $db->error);
            $stmt->execute();
            $stmt->bind_result($operatorName,$email)|| 		fail('MySQL bind_result', $db->error);
            $stmt->fetch();
            $stmt->close();



            $query = "SELECT model FROM LS_TotalStation WHERE _id=?";
            ($stmt = $db->prepare($query))		|| 		fail('MySQL prepare', $db->error);
            $stmt->bind_param('i', $fk_totalStation)		|| 		fail('MySQL bind_param', $db->error);
            $stmt->execute();
            $stmt->bind_result($model)|| 		fail('MySQL bind_result', $db->error);
            $stmt->fetch();
            $stmt->close();


            $query = "SELECT X(coor), Y(coor) FROM LS_Point WHERE tmpcode=?";
            ($stmt = $db->prepare($query))		|| 		fail('MySQL prepare', $db->error);
            $stmt->bind_param('s', $stationId)		|| 		fail('MySQL bind_param', $db->error);
            $stmt->execute();
            $stmt->bind_result($longitude,$latitude)|| 		fail('MySQL bind_result', $db->error);
            $stmt->fetch();
            $stmt->close();

            $offeringID = "tps0000_" . $_id . "_" . $fk_operator . "_" . $fk_totalStation . "_" . $stationId ;

            $longitude=($longitude>0)?$longitude:0;
            $latitude=($latitude>0)?$latitude:0;
            $longName = $model;
            $shortName = $model;



            $db->close();
 ?>
<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope
    xmlns:env="http://www.w3.org/2003/05/soap-envelope"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/2003/05/soap-envelope http://www.w3.org/2003/05/soap-envelope/soap-envelope.xsd http://www.opengis.net/sos/2.0 http://schemas.opengis.net/sos/2.0/sosInsertSensor.xsd     http://www.opengis.net/swes/2.0 http://schemas.opengis.net/swes/2.0/swes.xsd">
    <env:Body>
        <swes:InsertSensor
            xmlns:swes="http://www.opengis.net/swes/2.0"
            xmlns:sos="http://www.opengis.net/sos/2.0"
            xmlns:swe="http://www.opengis.net/swe/2.0"
            xmlns:sml="http://www.opengis.net/sensorml/2.0"
            xmlns:gml="http://www.opengis.net/gml/3.2"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:gco="http://www.isotc211.org/2005/gco"
            xmlns:gmd="http://www.isotc211.org/2005/gmd" service="SOS" version="2.0.0">
            <swes:procedureDescriptionFormat>http://www.opengis.net/sensorml/2.0</swes:procedureDescriptionFormat>
            <swes:procedureDescription>
                <sml:PhysicalSystem gml:id="sensor9">

                        <!--Unique identifier -->
                        <gml:identifier codeSpace="uniqueID">http://www.engicloud.net/sos/ls/procedure/<?php echo $offeringID; ?></gml:identifier>
                        <sml:identification>
                            <sml:IdentifierList>

                                <sml:identifier>
                                    <sml:Term definition="urn:ogc:def:identifier:OGC:1.0:longName">
                                        <sml:label>longName</sml:label>
                                        <sml:value><?php echo $longName; ?></sml:value>
                                    </sml:Term>
                                </sml:identifier>

                                <sml:identifier>
                                    <sml:Term definition="urn:ogc:def:identifier:OGC:1.0:shortName">
                                        <sml:label>shortName</sml:label>
                                        <sml:value><?php echo $shortName; ?></sml:value>
                                    </sml:Term>
                                </sml:identifier>

                                <sml:identifier>
                                    <sml:Term definition="http://www.engicloud.net/sos/ls/projectName">
                                        <sml:label>projectName</sml:label>
                                        <sml:value>ArchCadastre</sml:value>
                                    </sml:Term>
                                </sml:identifier>

                                <sml:identifier>
                                    <sml:Term
                                        definition="http://sensorml.com/ont/swe/property/HeightAboveGround">
                                        <sml:label>height</sml:label>
                                        <sml:value><?php echo $height; ?></sml:value>
                                    </sml:Term>
                                </sml:identifier>

                                <sml:identifier>
                                    <sml:Term definition="http://www.engicloud.net/sos/ls/observableProperty/stationId">
                                        <sml:label>stationId</sml:label>
                                        <sml:value><?php echo $stationId; ?></sml:value>
                                    </sml:Term>
                                </sml:identifier>

                            </sml:IdentifierList>
                        </sml:identification>


                        <sml:capabilities name="offerings">
                            <sml:CapabilityList>
                                <sml:capability name="offeringID">
                                    <swe:Text definition="urn:ogc:def:identifier:OGC:offeringID">
                                        <swe:label>offeringID</swe:label>
                                        <swe:value>http://www.engicloud.net/sos/ls/procedure/<?php echo $offeringID; ?></swe:value>
                                    </swe:Text>
                                </sml:capability>
                            </sml:CapabilityList>
                        </sml:capabilities>


                        <sml:contacts>
                            <sml:ContactList>
                                <sml:contact>
                                    <gmd:CI_ResponsibleParty>
                                        <gmd:individualName>
                                            <gco:CharacterString><?php echo $operatorName; ?></gco:CharacterString>
                                        </gmd:individualName>
                                        <gmd:organisationName>
                                            <gco:CharacterString>NA</gco:CharacterString>
                                        </gmd:organisationName>
                                        <gmd:contactInfo>
                                            <gmd:CI_Contact>
                                                <gmd:address>
                                                    <gmd:CI_Address>
                                                        <gmd:electronicMailAddress>
                                                            <gco:CharacterString><?php echo $email; ?></gco:CharacterString>
                                                        </gmd:electronicMailAddress>
                                                    </gmd:CI_Address>
                                                </gmd:address>
                                                <gmd:onlineResource xlink:href="http://www.sofos.me"/>
                                            </gmd:CI_Contact>
                                        </gmd:contactInfo>
                                        <gmd:role>
                                            <gmd:CI_RoleCode codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode/" codeListValue="CI_RoleCode_pointOfContact">Point of Contact</gmd:CI_RoleCode>
                                        </gmd:role>
                                    </gmd:CI_ResponsibleParty>
                                </sml:contact>
                            </sml:ContactList>
                        </sml:contacts>




                        <sml:outputs>
                            <sml:OutputList>
                                <sml:output name="shv">
                                    <swe:DataArray>
                                        <swe:elementCount>
                                            <swe:Count/>
                                        </swe:elementCount>
                                        <swe:elementType name="Components">
                                            <swe:DataRecord xmlns:ns="http://www.opengis.net/swe/2.0">
                                                <ns:field name="targetId">
                                                    <swe:Text definition="http://sensorml.com/ont/swe/property/ObjectOfInterestIdentifier"/>
                                                </ns:field>
                                                <ns:field name="slopeDistance">
                                                    <swe:Quantity definition="http://sensorml.com/ont/swe/property/CollectorToObjectOfInterestDistance">
                                                        <ns:uom code="m"/>
                                                    </swe:Quantity>
                                                </ns:field>
                                                <ns:field name="horizontalDirection">
                                                    <swe:Quantity definition="http://sensorml.com/ont/swe/property/Azimuth">
                                                        <ns:uom code="degree"/>
                                                    </swe:Quantity>
                                                </ns:field>
                                                <ns:field name="verticalAngle">
                                                    <swe:Quantity definition="http://sensorml.com/ont/swe/property/AlphaAngle">
                                                        <ns:uom code="degree"/>
                                                    </swe:Quantity>
                                                </ns:field>
                                                <ns:field name="targetHeight">
                                                    <swe:Quantity definition="http://sensorml.com/ont/swe/property/HeightAboveGround">
                                                        <ns:uom code="m"/>
                                                    </swe:Quantity>
                                                </ns:field>
                                                <ns:field name="targetType">
                                                    <swe:Text definition="http://www.engicloud.net/sos/ls/observableProperty/targetType"/>
                                                </ns:field>
                                            </swe:DataRecord>
                                        </swe:elementType>
                                    </swe:DataArray>
                                </sml:output>
                            </sml:OutputList>
                        </sml:outputs>


                        <sml:position>
                            <swe:Vector referenceFrame="urn:ogc:def:crs:EPSG::4326">
                                <swe:coordinate name="easting">
                                    <swe:Quantity axisID="x">
                                        <swe:uom code="degree"/>
                                        <swe:value><?php echo $longitude; ?></swe:value>
                                    </swe:Quantity>
                                </swe:coordinate>
                                <swe:coordinate name="northing">
                                    <swe:Quantity axisID="y">
                                        <swe:uom code="degree"/>
                                        <swe:value><?php echo $latitude; ?></swe:value>
                                    </swe:Quantity>
                                </swe:coordinate>
                                <swe:coordinate name="altitude">
                                    <swe:Quantity axisID="z">
                                        <swe:uom code="m"/>
                                        <swe:value>0</swe:value>
                                    </swe:Quantity>
                                </swe:coordinate>
                            </swe:Vector>
                        </sml:position>


                    </sml:PhysicalSystem>
                </swes:procedureDescription>
                <!-- multiple values possible -->
                <swes:observableProperty>http://sensorml.com/ont/swe/property/Azimuth</swes:observableProperty>
                <swes:observableProperty>http://sensorml.com/ont/swe/property/AlphaAngle</swes:observableProperty>
                <swes:observableProperty>http://sensorml.com/ont/swe/property/CollectorToObjectOfInterestDistance</swes:observableProperty>
                <swes:observableProperty>http://sensorml.com/ont/swe/property/HeightAboveGround</swes:observableProperty>
                <swes:observableProperty>http://sensorml.com/ont/swe/property/ObjectOfInterestIdentifier</swes:observableProperty>
                <swes:observableProperty>http://www.engicloud.net/sos/ls/observableProperty/targetType</swes:observableProperty>

                <swes:metadata>
                    <sos:SosInsertionMetadata>
                        <sos:observationType>http://www.opengis.net/def/observationType/OGC-OM/2.0/OM_Measurement</sos:observationType>
                        <sos:observationType>http://www.opengis.net/def/observationType/OGC-OM/2.0/OM_Measurement</sos:observationType>
                        <sos:observationType>http://www.opengis.net/def/observationType/OGC-OM/2.0/OM_Measurement</sos:observationType>
                        <sos:observationType>http://www.opengis.net/def/observationType/OGC-OM/2.0/OM_Measurement</sos:observationType>
                        <sos:observationType>http://www.opengis.net/def/observationType/OGC-OM/2.0/OM_TextObservation</sos:observationType>
                        <sos:observationType>http://www.opengis.net/def/observationType/OGC-OM/2.0/OM_TextObservation</sos:observationType>
                    </sos:SosInsertionMetadata>
                </swes:metadata>
            </swes:InsertSensor>
        </env:Body>
    </env:Envelope>