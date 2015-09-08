<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Payment/V1"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pymteo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Payment/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd rs pymteo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:rcom="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Payment/V1/PaymentRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Payment/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Payment/V1/PaymentEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Payment/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU JUN 18 16:37:13 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <pymteo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/rs:ESBMsg/rcom:MsgID"/>
      </com:MsgID>
      <com:Source>COR</com:Source>
      <com:MsgType>Requester</com:MsgType>
      <com:Service>PaymentES</com:Service>
      <pymteo:RqData actionCode="CreateBillPayment">
        <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment">
          <pymteo:Payment>
            <pymteo:PaymentType>
              <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:PaymentType"/>
            </pymteo:PaymentType>
            <com:BillIdentifier>
              <com:BillerID>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:BillPaymentIdentifier/com:BillerID"/>
              </com:BillerID>
              <com:BillID>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:BillPaymentIdentifier/com:BillID"/>
              </com:BillID>
            </com:BillIdentifier>
            <com:BillAmount currencyCode="{/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:BillAmount/rcom:CurrencyCode}">
              <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:BillAmount/rcom:Value"/>
            </com:BillAmount>
            <com:TotalAmount currencyCode="{/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:TotalAmount/rcom:CurrencyCode}">
              <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:TotalAmount/rcom:Value"/>
            </com:TotalAmount>
            <com:ChargeAmount currencyCode="{/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:ChargeAmount/rcom:CurrencyCode}">
              <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:ChargeAmount/rcom:Value"/>
            </com:ChargeAmount>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName">
              <com:PersonName>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:FullName">
                  <com:FullName>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:FullName"/>
                  </com:FullName>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:FirstName">
                  <com:FirstName>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:FirstName"/>
                  </com:FirstName>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:MiddleName">
                  <com:MiddleName>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:MiddleName"/>
                  </com:MiddleName>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:LastName">
                  <com:LastName>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:LastName"/>
                  </com:LastName>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:ShortName">
                  <com:ShortName>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:ShortName"/>
                  </com:ShortName>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:Title">
                  <com:Title>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PersonName/com:Title"/>
                  </com:Title>
                </xsl:if>
              </com:PersonName>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:Remarks">
              <com:Remarks>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:Remarks"/>
              </com:Remarks>
            </xsl:if>
            <com:PayFromAccount>
              <com:AccountIdentifier>
                <com:BankID>
                  <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:PayFromAccount/com:BankID"/>
                </com:BankID>
                <com:AccountID>
                  <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:PayFromAccount/com:AccountID"/>
                </com:AccountID>
              </com:AccountIdentifier>
            </com:PayFromAccount>
            <com:PayeeAccount>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:PayeeAccount/com:AccountID"/>
                </com:AccountID>
              </com:AccountIdentifier>
            </com:PayeeAccount>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:Remarks">
              <pymteo:TransactionRemarks>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:Remarks"/>
              </pymteo:TransactionRemarks>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:TransactionParticulars">
              <pymteo:TransactionParticulars>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:TransactionParticulars"/>
              </pymteo:TransactionParticulars>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:ValType">
              <pymteo:ValType>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:ValType"/>
              </pymteo:ValType>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:ChargeEventID">
              <pymteo:ChargeEventID>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:ChargeEventID"/>
              </pymteo:ChargeEventID>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:BranchName">
              <com:BranchName>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:BranchName"/>
              </com:BranchName>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:DealerCode">
              <com:DealerCode>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:DealerCode"/>
              </com:DealerCode>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PayMethod">
              <com:PayMethod>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/com:PayMethod"/>
              </com:PayMethod>
            </xsl:if>
            <xsl:if test="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:FinacleUserID">
              <com:UserID>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:BillPayment/rcom:FinacleUserID"/>
              </com:UserID>
            </xsl:if>
          </pymteo:Payment>
        </xsl:if>
      </pymteo:RqData>
    </pymteo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
