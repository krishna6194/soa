<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Bill/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd eo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1" xmlns:app="http://ws.equitybank/"
                xmlns:ns1="http://schemas.xmlsoap.org/soap/http">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Safaricom/AppMetadata/wsdls/SafDealerService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="authRequestResponse" namespace="http://ws.equitybank/"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Bill/V1/BillEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Bill/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI MAY 29 19:05:55 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <eo:Bill>
          <com:AccountID/>
          <com:BillIdentifier>
            <com:AccountID>
              <xsl:value-of select="/app:authRequestResponse/return/dealerAccountNumber"/>
            </com:AccountID>
            <com:BillID>
              <xsl:value-of select="/app:authRequestResponse/return/payRef"/>
            </com:BillID>
          </com:BillIdentifier>
          <eo:BillType/>
          <com:BillRef/>
          <com:BranchName>
            <xsl:value-of select="/app:authRequestResponse/return/branchName"/>
          </com:BranchName>
          <com:DealerCode>
            <xsl:value-of select="/app:authRequestResponse/return/dealerCode"/>
          </com:DealerCode>
          <com:DealerName>
            <xsl:value-of select="/app:authRequestResponse/return/dealerName"/>
          </com:DealerName>
          <com:PayMethod>
            <xsl:value-of select="/app:authRequestResponse/return/payMethod"/>
          </com:PayMethod>
          <com:UserID>
            <xsl:value-of select="/app:authRequestResponse/return/finacleUserId"/>
          </com:UserID>
          <com:Amount>
            <xsl:value-of select="/app:authRequestResponse/return/amount"/>
          </com:Amount>
          <eo:BillStatus/>
        </eo:Bill>
        <xsl:choose>
          <xsl:when test="/app:authRequestResponse/return/respCode='00'">
            <com:Status>
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Bill Validation successfully</com:Text>
            </com:Status>
          </xsl:when>
          <xsl:otherwise>
            <com:Status>
              <com:Code>ESB-100</com:Code>
              <com:Type>FAILURE</com:Type>
              <com:Text>
                <xsl:value-of select="/app:authRequestResponse/return/dealerName"/>
              </com:Text>
            </com:Status>
          </xsl:otherwise>
        </xsl:choose>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
