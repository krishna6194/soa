<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.innovatrics.com/afismq/schema/message/afismqrequest"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd eo app oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Biometric/V1/BiometricEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/EBioApi/AppMetadata/xsds/messages/afismqrequest.xsd"/>
        <oracle-xsl-mapper:rootElement name="message"
                                       namespace="http://www.innovatrics.com/afismq/schema/message/afismqrequest"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE JUN 02 12:53:48 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <app:message>
      <app:header>
        <app:version>1</app:version>
        <app:type>Verify</app:type>
        <app:system>
          <xsl:value-of select="/eo:ESBMsg/com:Source"/>
        </app:system>
        <app:request_id>
          <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
        </app:request_id>
      </app:header>
      <app:verify>
        <app:probe>
          <app:biometric_data>
            <app:fingerprints>
              <app:fingerprint>
                <app:position>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Biometric/eo:BiometricImage/com:FingerPrints/com:ImageR5/@fileName"/>
                </app:position>
                <app:image>
                  <app:resolution_dpi>500</app:resolution_dpi>
                  <app:format>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Biometric/eo:BiometricImage/com:FingerPrints/com:ImageR5/@mimeCode"/>
                  </app:format>
                  <app:data>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Biometric/eo:BiometricImage/com:FingerPrints/com:ImageR5"/>
                  </app:data>
                </app:image>
              </app:fingerprint>
            </app:fingerprints>
          </app:biometric_data>
        </app:probe>
        <app:response_content>
          <app:image_format>PNG</app:image_format>
          <app:wsq_bitrate>125</app:wsq_bitrate>
          <app:jpeg2k_compression_ratio>15</app:jpeg2k_compression_ratio>
        </app:response_content>
        <app:gallery>
          <app:applicant>
            <app:afis_id>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Biometric/com:BiometricIdentifier/com:BiometricID"/>
            </app:afis_id>
            <app:biometric_data/>
          </app:applicant>
        </app:gallery>
        <app:parameters>
          <app:similarity_threshold>750</app:similarity_threshold>
        </app:parameters>
      </app:verify>
    </app:message>
  </xsl:template>
</xsl:stylesheet>
