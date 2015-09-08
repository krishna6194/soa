<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd app eo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/FIN_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryClientEmailOutputCollection"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON JUL 27 12:36:14 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/app:QueryClientEmailOutputCollection/app:QueryClientEmailOutput">
          <eo:Customer>
            <com:Person>
              <com:PersonName>
                <com:FullName>
                  <xsl:value-of select="app:CustomerName"/>
                </com:FullName>
              </com:PersonName>
              <com:Employment>
                <com:Email>
                  <com:EmailAddress>
                    <xsl:value-of select="app:Email"/>
                  </com:EmailAddress>
                </com:Email>
              </com:Employment>
            </com:Person>
            <acceo:Account>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="app:AccountNumber"/>
                </com:AccountID>
              </com:AccountIdentifier>
            </acceo:Account>
          </eo:Customer>
        </xsl:for-each>
        <xsl:if test="count (/app:QueryClientEmailOutputCollection/app:QueryClientEmailOutput ) > 0">
          <com:Status>
            <com:Code>ESB-00</com:Code>
            <com:Type>Success</com:Type>
            <com:Text>Client Email queried successfully</com:Text>
          </com:Status>
        </xsl:if>
        <xsl:if test="count (/app:QueryClientEmailOutputCollection/app:QueryClientEmailOutput ) &lt;= 0">
          <com:Status>
            <com:Code>ESB-100</com:Code>
            <com:Type>Failue</com:Type>
            <com:Text>Client Email queried successfully</com:Text>
          </com:Status>
        </xsl:if>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
