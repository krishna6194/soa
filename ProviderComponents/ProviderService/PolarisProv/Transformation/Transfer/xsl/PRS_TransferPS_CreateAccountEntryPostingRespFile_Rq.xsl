<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd eo app oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/ftp/PRS_FTP_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="AccountEntryPostingRespFileInput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU MAY 14 15:40:36 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <app:AccountEntryPostingRespFileInput>
      <app:HeaderLine>
        <app:LineIdentifier>H</app:LineIdentifier>
        <app:FileName>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/fileo:File/fileo:FileName"/>
        </app:FileName>
        <app:Date>
          <xsl:value-of select="xp20:format-dateTime(xp20:current-date(),'[Y0001][M01][D01]')"/>
        </app:Date>
        <!--app:FileName>
          <xsl:value-of select="concat(/eo:ESBMsg/eo:RqData/@actionCode,'_Feed_',xp20:format-dateTime(xp20:current-date(),'[Y0001][M01][D01][H01][M01][s01]'))"/>
        </app:FileName>
        <app:Date>
          <xsl:value-of select="xp20:format-dateTime(xp20:current-date(),'[Y0001][M01][D01]')"/>
        </app:Date-->
      </app:HeaderLine>
      <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Transfer">
        <app:DataLine>
          <app:LineIdentifier>D</app:LineIdentifier>
          <app:UnitID>
            <xsl:value-of select="com:TransferIdentifier/com:BankID"/>
          </app:UnitID>
          <app:TransactionRefNo>
            <xsl:value-of select="com:TransactionReferenceNumber"/>
          </app:TransactionRefNo>
          <app:BankCoreRefNo/>
          <xsl:choose>
            <xsl:when test='starts-with(eo:TransferStatus, "FAILURE")'>
              <app:ErrCd>ESB-100</app:ErrCd>
            </xsl:when>
            <xsl:otherwise>
              <app:ErrCd>ESB-00</app:ErrCd>
            </xsl:otherwise>
          </xsl:choose>
          <app:ErrMsg>
            <xsl:value-of select="eo:TransferStatus"/>
          </app:ErrMsg>
        </app:DataLine>
      </xsl:for-each>
      <app:TrailerLine>
        <app:LineIdentifier>T</app:LineIdentifier>
        <app:NumberOfRows>
          <xsl:value-of select="count (/eo:ESBMsg/eo:RqData/eo:Transfer )"/>
        </app:NumberOfRows>
      </app:TrailerLine>
    </app:AccountEntryPostingRespFileInput>
  </xsl:template>
</xsl:stylesheet>
