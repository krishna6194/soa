<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:ns0="urn:control.services.tiplus2.misys.com"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:ns2="urn:messages.service.ti.apps.tiplus2.misys.com"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Misys/AppMetadata/V1/Control.xsd"/>
        <oracle-xsl-mapper:rootElement name="ServiceRequest" namespace="urn:control.services.tiplus2.misys.com"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON MAY 11 14:56:42 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="UUIDUserFunction:uuid ( )"/>
      </com:MsgID>
      <com:Source>COR</com:Source>
      <com:MsgType>Enterprise</com:MsgType>
      <com:Service>AccountES</com:Service>
      <tns:RqData actionCode="QueryRetailAccountDetailByID">
        <tns:Account>
          <com:AccountIdentifier>
            <com:BankID>54</com:BankID>
            <xsl:if test="/ns0:ServiceRequest/ns2:AccountDetailsRequest/ns2:AccountNumber">
              <com:AccountID>
                <xsl:value-of select="/ns0:ServiceRequest/ns2:AccountDetailsRequest/ns2:AccountNumber"/>
              </com:AccountID>
            </xsl:if>
          </com:AccountIdentifier>
        </tns:Account>
      </tns:RqData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>