<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns0="http://tempuri.org/"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:ns1="http://schemas.datacontract.org/2004/07/IPRSManager"
                xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/Arrays"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Iprs/AppMetadata/wsdl/IPRSServerWCF.xsd_xsd0.xsd"/>
        <oracle-xsl-mapper:rootElement name="GetDataByIdCardResponse" namespace="http://tempuri.org/"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/NationalIdentity/V1/NationalIdentityEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI MAY 15 18:09:12 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ESBMsg>
      <tns:RsData>
        <tns:NationalIdentity>
          <com:Person>
            <com:PersonName>
              <com:FirstName>
                <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:First_Name"/>
              </com:FirstName>
              <com:LastName>
                <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Surname"/>
              </com:LastName>
            </com:PersonName>
            <xsl:choose>
              <xsl:when test='string-length (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ) ) = 1 and string-length (substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ) ) = 1'>
                <com:BirthDate>
                  <xsl:value-of select='concat (substring-after (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "-0", substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ), "-0", substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "T12:00:00" )'/>
                </com:BirthDate>
              </xsl:when>
              <xsl:when test='string-length (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ) ) = 1 and string-length (substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" )) != 1'>
                <com:BirthDate>
                  <xsl:value-of select='concat (substring-after (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "-0", substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ), "-", substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "T12:00:00" )'/>
                </com:BirthDate>
              </xsl:when>
              <xsl:when test='string-length (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ) ) != 1 and string-length (substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" )) = 1'>
                <com:BirthDate>
                  <xsl:value-of select='concat (substring-after (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "-", substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ), "-0", substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "T12:00:00" )'/>
                </com:BirthDate>
              </xsl:when>
              <xsl:otherwise>
                <com:BirthDate>
                  <xsl:value-of select='concat (substring-after (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "-", substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, "/" ), "-", substring-before (substring-after (substring-before (/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Birth, " " ), "/" ), "/" ), "T12:00:00" )'/>
                </com:BirthDate>
              </xsl:otherwise>
            </xsl:choose>
            <com:DeathDate>
              <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Date_of_Death"/>
            </com:DeathDate>
            <com:Nationality>
              <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Citizenship"/>
            </com:Nationality>
            <com:FaceImage>
              <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Photo"/>
            </com:FaceImage>
          </com:Person>
          <com:IdentityDocument>
            <com:IdentityDocumentID>
              <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:ID_Number"/>
            </com:IdentityDocumentID>
            <com:IdentityDocumentSerialNumber>
              <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:Serial_Number"/>
            </com:IdentityDocumentSerialNumber>
          </com:IdentityDocument>
        </tns:NationalIdentity>
        <com:Status>
          <xsl:choose>
            <xsl:when test="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:ErrorOcurred = 'true'">
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>IPRS details processed successfully</com:Text>
            </xsl:when>
            <xsl:otherwise>
              <com:Code>
                <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:ErrorCode"/>
              </com:Code>
              <com:Type>
                <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:ErrorOcurred"/>
              </com:Type>
              <com:Text>
                <xsl:value-of select="/ns0:GetDataByIdCardResponse/ns0:GetDataByIdCardResult/ns1:ErrorMessage"/>
              </com:Text>
            </xsl:otherwise>
          </xsl:choose>
        </com:Status>
      </tns:RsData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
