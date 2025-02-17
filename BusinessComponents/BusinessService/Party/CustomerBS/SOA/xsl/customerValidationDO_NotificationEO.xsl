<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
        <oracle-xsl-mapper:param name="customerValidationDO"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/Notification/V1/NotificationEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON AUG 03 13:58:38 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ESBMsg>
      <tns:RqData actionCode="SendEmail">
        <tns:Notification>
          <tns:FromEmailAddress>shubham.jain@prosense.co.in</tns:FromEmailAddress>
          <tns:ToEmailAddress>
            <xsl:value-of select="/ns0:ESBMsg/ns0:RsData/ns0:Customer/com:Person/com:Employment/com:Email/com:EmailAddress"/>
          </tns:ToEmailAddress>
          <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/ns0:Customer/tns:Notification/tns:Attachment">
            <tns:Attachment>
              <com:MimeType>
                <xsl:value-of select="com:MimeType"/>
              </com:MimeType>
              <com:AttachentName>
                <xsl:value-of select="com:AttachentName"/>
              </com:AttachentName>
              <com:AttachmentContent>
                <xsl:value-of select="com:AttachmentContent"/>
              </com:AttachmentContent>
            </tns:Attachment>
          </xsl:for-each>
          <tns:Subject>Testing Send Email</tns:Subject>
          <tns:Body>Body is working</tns:Body>
        </tns:Notification>
      </tns:RqData>
      <tns:ToEmailAddress/>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
