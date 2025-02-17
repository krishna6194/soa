<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Authentication/MobileAuth/V1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source/>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Authentication/MobileAuth/V1/MobileAuthEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Authentication/MobileAuth/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI MAY 15 12:35:34 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ESBMsg>
      <tns:RsData>
        <tns:RC>
          <xsl:value-of select="/MidletRs/Set/String[@Name='RC']"/>
        </tns:RC>
        <tns:DataRC>
          <xsl:value-of select="/MidletRs/Set/String[@Name='DATARS']"/>
        </tns:DataRC>
        <tns:Role>
          <xsl:value-of select="/MidletRs/Set/String[@Name='ROLE']"/>
        </tns:Role>
        <tns:Firstname>
          <xsl:value-of select="/MidletRs/Set/String[@Name='FIRSTNAME']"/>
        </tns:Firstname>
        <tns:PACC>
          <xsl:value-of select="/MidletRs/Set/String[@Name='PACC']"/>
        </tns:PACC>
        <xsl:choose>
          <xsl:when test="/MidletRs/Set/String[@Name='RC'] = 'OK'">
            <tns:Status>
              <tns:Code>
                <xsl:value-of select="string('0')"/>
              </tns:Code>
              <tns:Description>
                <xsl:value-of select="string('Success')"/>
              </tns:Description>
            </tns:Status>
          </xsl:when>
          <xsl:otherwise>
            <tns:Status>
              <xsl:choose>
                <xsl:when test="/MidletRs/Set/String[@Name='TEXT'] = 'Wrong PIN'">
                  <tns:Code>
                    <xsl:value-of select="string('2')"/>
                  </tns:Code>
                </xsl:when>
                <xsl:otherwise>
                  <tns:Code>
                    <xsl:value-of select="string('1')"/>
                  </tns:Code>
                </xsl:otherwise>
              </xsl:choose>
              <tns:Description>
                <xsl:value-of select="/MidletRs/Set/String[@Name='TEXT']"/>
              </tns:Description>
            </tns:Status>
          </xsl:otherwise>
        </xsl:choose>
      </tns:RsData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>