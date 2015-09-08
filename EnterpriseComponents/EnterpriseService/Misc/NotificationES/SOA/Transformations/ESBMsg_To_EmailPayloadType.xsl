<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:tnsd="http://xmlns.oracle.com/ias/pcbpel/NotificationService"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tnsd xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:es="http://xmlns.equitybank.co.ke/ESB/ES/Misc/Notification/V1"
                xmlns:ns2="http://xmlns.oracle.com/ias/pcbpel/NotificationService1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/NotificationESWrapper.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/soa/shared/workflow/NotificationService.wsdl"/>
        <oracle-xsl-mapper:rootElement name="EmailPayload" namespace=""/>
        <oracle-xsl-mapper:rootElementDatatype name="EmailPayloadType"
                                               namespace="http://xmlns.oracle.com/ias/pcbpel/NotificationService"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI JUL 31 17:15:12 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <EmailPayload>
      <tnsd:FromAccountName>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Notification/ns0:FromEmailAddress"/>
      </tnsd:FromAccountName>
      <tnsd:To>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Notification/ns0:ToEmailAddress"/>
      </tnsd:To>
      <tnsd:ReplyToAddress>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Notification/ns0:FromEmailAddress"/>
      </tnsd:ReplyToAddress>
      <tnsd:Subject>
        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Notification/ns0:Subject"/>
      </tnsd:Subject>
      <tnsd:Content>
        <tnsd:MimeType>multipart/mixed</tnsd:MimeType>
        <tnsd:ContentBody>
          <tnsd:MultiPart>
            <tnsd:BodyPart>
              <tnsd:MimeType>text/html; charset=UTF-8</tnsd:MimeType>
              <tnsd:ContentBody>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Notification/ns0:Body"/>
              </tnsd:ContentBody>
              <tnsd:BodyPartName></tnsd:BodyPartName>
            </tnsd:BodyPart>
            <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/ns0:Notification/ns0:Attachment">
              <tnsd:BodyPart>
                <tnsd:MimeType>
                  <xsl:value-of select="ns1:MimeType"/>
                </tnsd:MimeType>
                <tnsd:ContentBody>
                  <xsl:value-of select="ns1:AttachmentContent"/>
                </tnsd:ContentBody>
                <tnsd:BodyPartName>
                  <xsl:value-of select="ns1:AttachentName"/>
                </tnsd:BodyPartName>
              </tnsd:BodyPart>
            </xsl:for-each>
          </tnsd:MultiPart>
        </tnsd:ContentBody>
      </tnsd:Content>
    </EmailPayload>
  </xsl:template>
</xsl:stylesheet>
