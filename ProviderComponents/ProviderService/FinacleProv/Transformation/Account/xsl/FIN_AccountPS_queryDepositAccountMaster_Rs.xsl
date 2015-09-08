<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/FIN_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryDepositAccountMasterOutputCollection"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN MAY 10 10:31:28 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/app:QueryDepositAccountMasterOutputCollection/app:QueryDepositAccountMasterOutput">
          <eo:Account>
            <com:AccountIdentifier>
              <com:BankID>
                <xsl:value-of select="app:BankId"/>
              </com:BankID>
              <com:AccountID>
                <xsl:value-of select="app:DepositAccountNumber"/>
              </com:AccountID>
              <com:AccountCurrency>
                <xsl:value-of select="app:Currency"/>
              </com:AccountCurrency>
            </com:AccountIdentifier>
            <custeo:Customer>
              <com:CustomerIdentifier>
                <com:CustomerID>
                  <xsl:value-of select="app:CustomerId"/>
                </com:CustomerID>
              </com:CustomerIdentifier>
            </custeo:Customer>
            <com:Balance>
              <com:BalanceAmount>
                <xsl:value-of select="app:CurrentPrincipalAmount"/>
              </com:BalanceAmount>
            </com:Balance>
            <com:Amount>
              <xsl:value-of select="app:DepositAmount"/>
            </com:Amount>
            <com:TransactionReferenceNumber>
              <xsl:value-of select="app:BilyetNumber"/>
            </com:TransactionReferenceNumber>
            <eo:MaturityDate>
              <xsl:value-of select="concat (substring (app:MaturityDate, 1, 4 ), &quot;-&quot;, substring (app:MaturityDate, 5, 2 ), &quot;-&quot;, substring (app:MaturityDate, 7, 2 ) )"/>
            </eo:MaturityDate>
            <eo:CurrentInterestRate>
              <xsl:value-of select="app:CurrentInterestRate"/>
            </eo:CurrentInterestRate>
            <eo:InterestRate>
              <xsl:value-of select="app:InterestRate"/>
            </eo:InterestRate>
            <eo:TenorValue>
              <xsl:value-of select="app:TenorValue"/>
            </eo:TenorValue>
            <com:Remarks/>
            <eo:InterestToDate>
              <xsl:value-of select="app:InterestToDate"/>
            </eo:InterestToDate>
            <eo:PostedDateTime>
              <xsl:value-of select="concat (substring (app:PostingDate, 1, 4 ), &quot;-&quot;, substring (app:PostingDate, 5, 2 ), &quot;-&quot;, substring (app:PostingDate, 7, 2 ), &quot;T00:00:00&quot; )"/>
            </eo:PostedDateTime>
            <eo:MaturityInstructions>
              <xsl:value-of select="app:MaturityInstructions"/>
            </eo:MaturityInstructions>
            <eo:AccountStatus>
              <xsl:value-of select="app:Status"/>
            </eo:AccountStatus>
          </eo:Account>
        </xsl:for-each>
        <xsl:if test="count (/app:QueryDepositAccountMasterOutputCollection/app:QueryDepositAccountMasterOutput ) > 0">
          <com:Status>
            <com:Code>ESB-00</com:Code>
            <com:Type>Success</com:Type>
            <com:Text>Deposit account master details queried successfully</com:Text>
          </com:Status>
        </xsl:if>
        <xsl:if test="count (/app:QueryDepositAccountMasterOutputCollection/app:QueryDepositAccountMasterOutput ) &lt;= 0">
          <com:Status>
            <com:Code>ESB-100</com:Code>
            <com:Type>Failue</com:Type>
            <com:Text>Deposit account master details not found</com:Text>
          </com:Status>
        </xsl:if>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
