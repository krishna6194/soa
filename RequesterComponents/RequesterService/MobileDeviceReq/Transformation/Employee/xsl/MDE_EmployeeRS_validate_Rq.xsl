<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:tns="http://xmlns.equitybank.co.ke/BM/Party/Employee/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/RM/MobileDevice/Employee/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/EO/Parties/Customer/V1"
                xmlns:ideo="http://xmlns.equitybank.co.ke/EO/Resilience/IdentityDocument/V1"
                xmlns:ro="http://xmlns.equitybank.co.ke/ESB/RO/MobileDevice/Employee/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:empeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:id="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/MobileDevice/Employee/V1/EmployeeRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="EmployeeValidationRequestRM"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RO/MobileDevice/Employee/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Employee/V1/EmployeeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU MAR 12 20:27:17 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <empeo:ESBMsg>
      <empeo:RqData>
        <empeo:Employee>
          <com:Person>
            <com:IdentityDocument>
              <com:IdentityDocumentID>
                <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:PersonInfo/ro:IdNr"/>
              </com:IdentityDocumentID>
              <com:IdentityDocumentSerialNumber>
                <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:PersonInfo/ro:IDSerialNr"/>
              </com:IdentityDocumentSerialNumber>
              <com:IssueDate>
                <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:PersonInfo/ro:IssueDate"/>
              </com:IssueDate>
            </com:IdentityDocument>
          </com:Person>
          <bio:Biometric>
          <com:BiometricIdentifier>
            <com:BiometricID/>
          </com:BiometricIdentifier>
            <com:BiometricUserIdentifier>
              <com:BiometricUserID>
                <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:AgentBioDetails/ro:AgentPinDetails/ro:UserID"/>
              </com:BiometricUserID>
              <com:BiometricUserPin>
                <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:AgentBioDetails/ro:AgentPinDetails/ro:UserPin"/>
              </com:BiometricUserPin>
            </com:BiometricUserIdentifier>
          <bio:BiometricImage>
            <com:FingerPrints>
              <com:ImageL1>
                <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:AgentBioDetails/ro:Image"/>
              </com:ImageL1>
            </com:FingerPrints>
          </bio:BiometricImage>
          <com:CustomerIdentifier>
            <com:CustomerID>
              <xsl:value-of select="/ro:EmployeeValidationRequestRM/ro:AgentBioDetails/ro:AgentPinDetails/ro:UserID"/>
            </com:CustomerID>
          </com:CustomerIdentifier>
          </bio:Biometric>
        </empeo:Employee>
      </empeo:RqData>
    </empeo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>