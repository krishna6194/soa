<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:es="http://xmlns.equitybank.co.ke/ESB/ES/Accounts/Account/V1"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns4="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
        <oracle-xsl-mapper:param name="RequestVariable.payload"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
        <oracle-xsl-mapper:param name="ResponseVariable.payload"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU MAY 21 02:41:24 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="RequestVariable.payload"/>
  <xsl:param name="ResponseVariable.payload"/>
  <xsl:variable name="Counter" select="count($ResponseVariable.payload/ns0:ESBMsg/ns0:RsData/ns0:Account)+1"/>
  <xsl:template match="/">
    <ns0:ESBMsg>
      <ns0:RsData>
        <xsl:for-each select="$ResponseVariable.payload/ns0:ESBMsg/ns0:RsData/ns0:Account">
          <ns0:Account>
            <ns1:AccountIdentifier>
              <ns1:AccountID>
                <xsl:value-of select="ns1:AccountIdentifier/ns1:AccountID"/>
              </ns1:AccountID>
            </ns1:AccountIdentifier>
            <ns0:AccountType>
              <xsl:value-of select="ns0:AccountType"/>
            </ns0:AccountType>
            <ns0:AccountSubType>
              <xsl:value-of select="ns0:AccountSubType"/>
            </ns0:AccountSubType>
          </ns0:Account>
        </xsl:for-each>
        <ns0:Account>
          <ns1:AccountIdentifier>
            <ns1:AccountID>
              <xsl:value-of select="/ns0:ESBMsg/ns0:RsData/ns0:Account/ns1:AccountIdentifier/ns1:AccountID"/>
            </ns1:AccountID>
          </ns1:AccountIdentifier>
          <ns0:AccountType>
            <xsl:value-of select="$RequestVariable.payload/ns0:ESBMsg/ns0:RqData/ns0:Account[$Counter]/ns0:AccountType"/>
          </ns0:AccountType>
          <ns0:AccountSubType>
            <xsl:value-of select="$RequestVariable.payload/ns0:ESBMsg/ns0:RqData/ns0:Account[$Counter]/ns0:AccountSubType"/>
          </ns0:AccountSubType>
        </ns0:Account>
        <ns1:Status>
          <ns1:Code>ESB-00</ns1:Code>
          <ns1:Type>Success</ns1:Type>
          <ns1:Text>Success</ns1:Text>
        </ns1:Status>
      </ns0:RsData>
    </ns0:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
