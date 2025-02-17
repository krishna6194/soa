<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:app="http://listeners.webtools.integrator.polaris.com"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd app eo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:ns1="http://org.apache.axis2/xsd" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:wsaw="http://www.w3.org/2006/05/addressing/wsdl"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Polaris/AppMetaData/wsdls/Integrator.wsdl"/>
        <oracle-xsl-mapper:rootElement name="processMessageResponse"
                                       namespace="http://listeners.webtools.integrator.polaris.com"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/File/V1/FileEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI JUN 19 20:06:48 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:choose>
          <xsl:when test='contains (/app:processMessageResponse/app:return, "000" ) and contains (/app:processMessageResponse/app:return, "Successful" )'>
            <com:Status>
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Processed Successfully</com:Text>
            </com:Status>
          </xsl:when>
          <xsl:otherwise>
            <com:Status>
              <com:Code>ESB-100</com:Code>
              <com:Type>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "PolarisCode", /app:processMessageResponse/app:return/FileNotifyResp/ErrorCode, "ESBType", "" )'/>
              </com:Type>
              <com:Text>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "PolarisCode", /app:processMessageResponse/app:return/FileNotifyResp/ErrorCode, "ESBText", "" )'/>
              </com:Text>
            </com:Status>
          </xsl:otherwise>
        </xsl:choose>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>