<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Document/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/Document/V1/DocumentEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Document/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/ContentManager/AppMetadata/xsds/xsd0.xsd"/>
        <oracle-xsl-mapper:rootElement name="documentVO" namespace=""/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI MAY 08 23:31:11 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <documentVO>
      <batchId>test batch id</batchId>
      <username>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentCreatedBy"/>
      </username>
      <entityIdNumber>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentSubTypeID"/>
      </entityIdNumber>
      <entityIdType>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentTypeID"/>
      </entityIdType>
      <contentType>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentFileContent/@mimeCode"/>
      </contentType>
      <content>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentFileContent"/>
      </content>
      <filename>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentFileContent/@fileName"/>
      </filename>
      <instruction>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentStatus"/>
      </instruction>
      <updatedBy>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Document/ns0:DocumentUpdatedBy"/>
      </updatedBy>
      <originId>1</originId>
      <documenTypeId>5</documenTypeId>
      <contextId>1</contextId>
      <documentSubTypeId>5</documentSubTypeId>
      <cmStoreStatusId>1</cmStoreStatusId>
    </documentVO>
  </xsl:template>
</xsl:stylesheet>
