<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd eo tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Charge/V1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:app="http://xmlns.oracle.com/ProviderService/ESBPortalProv/EBP_Charges_Http_Adapter" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Charge/V1/ChargeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Charge/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../../../ESBMetadata/ComponentLibrary/ProviderServices/ESBPortal/AppMetadata/wsdls/EBP_Charges_Http_Adapter.wsdl"/>
        <oracle-xsl-mapper:rootElement name="getAccountCharges_params" namespace="http://xmlns.oracle.com/ProviderService/ESBPortalProv/EBP_Charges_Http_Adapter"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU AUG 13 14:22:35 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="index"/>
  <xsl:template match="/">
    <app:getAccountCharges_params>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:ChargeIdentifier/com:AccountID">
        <app:accountId>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:ChargeIdentifier/com:AccountID"/>
        </app:accountId>
      </xsl:if>
      <xsl:if test="/eo:ESBMsg/eo:RqData/eo:Charge/com:ChargeIdentifier/com:ChargeID">
        <app:chargeMasterId>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Charge[number($index)]/com:ChargeIdentifier/com:ChargeID"/>
        </app:chargeMasterId>
      </xsl:if>
    </app:getAccountCharges_params>
  </xsl:template>
</xsl:stylesheet>