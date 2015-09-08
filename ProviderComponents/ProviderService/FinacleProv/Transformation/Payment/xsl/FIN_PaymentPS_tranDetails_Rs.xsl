<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Payment/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Payment/V1/PaymentEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Payment/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:RequestMessageKey/app:RequestUUID"/>
      </com:MsgID>
      <eo:RsData>
        <xsl:for-each select="/app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:CustTran">
          <eo:Payment>
            <com:PaymentIdentifier>
              <com:PaymentID>
                <xsl:value-of select="app:TRAN_ID"/>
              </com:PaymentID>
            </com:PaymentIdentifier>
            <eo:PaymentType>
              <xsl:value-of select="app:PART_TRAN_TYPE"/>
            </eo:PaymentType>
            <com:ValueDate>
              <xsl:value-of select="app:VALUE_DATE"/>
            </com:ValueDate>
            <com:PersonName>
              <com:FullName>
                <xsl:value-of select="app:ACCT_NAME"/>
              </com:FullName>
            </com:PersonName>
            <com:PayFromAccount>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="app:FORACID"/>
                </com:AccountID>
              </com:AccountIdentifier>
            </com:PayFromAccount>
            <eo:TransactionParticulars>
              <xsl:value-of select="app:TRAN_PARTICULAR"/>
            </eo:TransactionParticulars>
          </eo:Payment>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="count (/app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Error) &lt;= 0">
            <com:Status>
              <com:Code>ESB-00</com:Code>
              <com:Type>
                <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
              </com:Type>
              <com:Text>Transaction details queried successfully</com:Text>
            </com:Status>
          </xsl:when>
          <xsl:otherwise>
            <com:Status>
              <com:Code>ESB-100</com:Code>
              <com:Type>
                <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
              </com:Type>
              <com:Text>
                <xsl:value-of select="concat ('ErrorCode ', /app:FIXML/app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Error)"/>
              </com:Text>
            </com:Status>
          </xsl:otherwise>
        </xsl:choose>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
