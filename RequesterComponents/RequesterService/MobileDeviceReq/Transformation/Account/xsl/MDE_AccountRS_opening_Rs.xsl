<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:tns="http://xmlns.equitybank.co.ke/RM/MobileDevice/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://xmlns.equitybank.co.ke/BM/RetailBanking/Account/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:biomeo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ro="http://xmlns.equitybank.co.ke/ESB/RO/MobileDevice/Account/V1"
                xmlns:bo="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/MobileDevice/Account/V1/AccountRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="AccountOpeningResponseRM"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RO/MobileDevice/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU MAR 12 20:33:03 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <ro:AccountOpeningResponseRM>
      <com:MsgID>
        <xsl:value-of select="/bo:ESBMsg/com:MsgID"/>
      </com:MsgID>
      <ro:CustomerID>
        <xsl:value-of select="/bo:ESBMsg/bo:RsData/custeo:Customer/com:CustomerIdentifier/com:CustomerID"/>
      </ro:CustomerID>
      <xsl:for-each select="/bo:ESBMsg/bo:RsData/eo:Account">
        <ro:AccountDetails>
          <ro:AccountId>
            <xsl:value-of select="com:AccountIdentifier/com:AccountID"/>
          </ro:AccountId>
          <ro:SchemeCode>
            <xsl:value-of select="eo:AccountSubType"/>
          </ro:SchemeCode>
          <ro:SchemeType>
            <xsl:value-of select="eo:AccountType"/>
          </ro:SchemeType>
        </ro:AccountDetails>
      </xsl:for-each>
      <ro:Status>
        <ro:Status>
          <xsl:value-of select="/bo:ESBMsg/bo:RsData/com:Status/com:Type"/>
        </ro:Status>
        <ro:Code>
          <xsl:value-of select="/bo:ESBMsg/bo:RsData/com:Status/com:Code"/>
        </ro:Code>
        <ro:Description>
          <xsl:value-of select="/bo:ESBMsg/bo:RsData/com:Status/com:Text"/>
        </ro:Description>
      </ro:Status>
    </ro:AccountOpeningResponseRM>
  </xsl:template>
</xsl:stylesheet>