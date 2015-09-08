<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Way4/Adapter/db"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Statement/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Statement/V1/StatementEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Statement/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/WY4_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryCreditCardTransactionSummaryInput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Way4/Adapter/db"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU MAY 14 10:53:27 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <app:QueryCreditCardTransactionSummaryInput>
      <app:cardNumber>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Statement/com:CardIdentifier/com:CardNumber"/>
      </app:cardNumber>
      <app:startDate>
        <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Statement/eo:FromDate,'[D01]-[MNn,3-3]-[Y0001]')"/>
      </app:startDate>
      <app:endDate>
        <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Statement/eo:ToDate,'[D01]-[MNn,3-3]-[Y0001]')"/>
      </app:endDate>
    </app:QueryCreditCardTransactionSummaryInput>
  </xsl:template>
</xsl:stylesheet>
