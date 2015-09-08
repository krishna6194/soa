<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Document/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/RO/ContentManager/Document/V1"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/MobileDevice/Document/V1/DocumentRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="CreateAccountsRequestRM"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RO/ContentManager/Document/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/Document/V1/DocumentEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Document/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN MAY 17 23:54:35 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ESBMsg>
      <com:Source>MDE</com:Source>
      <com:MsgType>Requester</com:MsgType>
      <com:Service>DocumentES</com:Service>
      <tns:RqData actionCode="CreateAccount">
        <tns:Document>
          <com:DocumentIdentifier>
            <com:DocumentID>
              <xsl:value-of select="/ns0:CreateAccountsRequestRM/ns0:ID"/>
            </com:DocumentID>
          </com:DocumentIdentifier>
          <xsl:for-each select="/ns0:CreateAccountsRequestRM/ns0:Account">
            <ns3:Account>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="ns0:AccountNumber"/>
                </com:AccountID>
              </com:AccountIdentifier>
              <ns3:AccountType>
                <xsl:value-of select="ns0:AccountType"/>
              </ns3:AccountType>
            </ns3:Account>
          </xsl:for-each>
        </tns:Document>
      </tns:RqData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
