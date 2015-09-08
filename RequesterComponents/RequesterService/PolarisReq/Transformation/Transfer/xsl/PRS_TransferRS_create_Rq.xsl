<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Transfer/V1"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl rs eo oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:rcom="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Transfer/V1/TransferRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Transfer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON JUN 29 11:34:37 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <xsl:variable name="path" select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:Transaction"/>
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/rs:ESBMsg/rcom:MsgID"/>
      </com:MsgID>
      <com:Source>ERP</com:Source>
      <com:MsgType>Requester</com:MsgType>
      <com:Service>TransferES</com:Service>
      <xsl:choose>
        <xsl:when test='/rs:ESBMsg/rs:RqData/rs:Transfer/eo:TransferType = "Inter-Country"'>
          <xsl:if test="/rs:ESBMsg/rs:RqData">
            <eo:RqData actionCode="CreateRetailIntraBankTransfer">
              <eo:Transfer>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/eo:TransferType">
                  <eo:TransferType>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/eo:TransferType"/>
                  </eo:TransferType>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Amount">
                  <com:Amount currencyCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Amount/rcom:CurrencyCode}">
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Amount/rcom:Value"/>
                  </com:Amount>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:ChargeAmount">
                  <com:ChargeAmount currencyCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:ChargeAmount/rcom:CurrencyCode}">
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:ChargeAmount/rcom:Value"/>
                  </com:ChargeAmount>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:ValueDate">
                  <com:ValueDate>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:ValueDate"/>
                  </com:ValueDate>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Rate">
                  <com:Rate unitCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Rate/rcom:CurrencyCode}"
                            baseValue="{/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Rate/rcom:BaseValue}"
                            baseUnitCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Rate/rcom:BaseCurrencyCode}">
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Rate/rcom:Value"/>
                  </com:Rate>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:Remarks">
                  <com:Remarks>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:Remarks"/>
                  </com:Remarks>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromAccount">
                  <com:PayFromAccount>
                    <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromAccount/com:AccountIdentifier">
                      <com:AccountIdentifier>
                        <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromAccount/com:AccountIdentifier/com:BankID">
                          <com:BankID>
                            <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromAccount/com:AccountIdentifier/com:BankID"/>
                          </com:BankID>
                        </xsl:if>
                        <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromAccount/com:AccountIdentifier/com:AccountID">
                          <com:AccountID>
                            <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromAccount/com:AccountIdentifier/com:AccountID"/>
                          </com:AccountID>
                        </xsl:if>
                      </com:AccountIdentifier>
                    </xsl:if>
                  </com:PayFromAccount>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount">
                  <com:PayeeAccount>
                    <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier">
                      <com:AccountIdentifier>
                        <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier/com:BankID">
                          <com:BankID>
                            <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier/com:BankID"/>
                          </com:BankID>
                        </xsl:if>
                        <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountID">
                          <com:AccountID>
                            <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountID"/>
                          </com:AccountID>
                        </xsl:if>
                        <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountCurrency">
                          <com:AccountCurrency>
                            <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountCurrency"/>
                          </com:AccountCurrency>
                        </xsl:if>
                      </com:AccountIdentifier>
                    </xsl:if>
                  </com:PayeeAccount>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransactionType">
                  <eo:TransactionType>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransactionType"/>
                  </eo:TransactionType>
                </xsl:if>
              </eo:Transfer>
            </eo:RqData>
          </xsl:if>
        </xsl:when>
        <xsl:when test='/rs:ESBMsg/rs:RqData/rs:Transfer/eo:TransferType = "MobileWallet"'>
          <xsl:if test="/rs:ESBMsg/rs:RqData">
            <eo:RqData actionCode="CreateMobileWalletTransfer">
              <eo:Transfer>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/eo:TransferType">
                  <com:TransactionReferenceNumber>
                    <xsl:value-of select="UUIDUserFunction:uuid ( )"/>
                  </com:TransactionReferenceNumber>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Amount">
                  <com:Amount currencyCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Amount/rcom:CurrencyCode}">
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rcom:Amount/rcom:Value"/>
                  </com:Amount>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:MobileWalletVendor">
                  <com:MobileWalletVendor>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:MobileWalletVendor"/>
                  </com:MobileWalletVendor>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromMobileWallet">
                  <com:PayFromMobileWallet>
                    <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromMobileWallet/com:MobileNumber">
                      <com:MobileNumber>
                        <xsl:value-of select="concat('254',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromMobileWallet/com:MobileNumber,2))"/>
                      </com:MobileNumber>
                    </xsl:if>
                    <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromMobileWallet/com:MobileUser">
                      <com:MobileUser>
                        <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayFromMobileWallet/com:MobileUser"/>
                      </com:MobileUser>
                    </xsl:if>
                  </com:PayFromMobileWallet>
                </xsl:if>
                <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeMobileWallet">
                  <com:PayeeMobileWallet>
                    <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeMobileWallet/com:MobileNumber">
                      <com:MobileNumber>
                        <xsl:value-of select="concat('254',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeMobileWallet/com:MobileNumber,2))"/>
                      </com:MobileNumber>
                    </xsl:if>
                    <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeMobileWallet/com:MobileUser">
                      <com:MobileUser>
                        <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/com:PayeeMobileWallet/com:MobileUser"/>
                      </com:MobileUser>
                    </xsl:if>
                  </com:PayeeMobileWallet>
                </xsl:if>
              </eo:Transfer>
            </eo:RqData>
          </xsl:if>
        </xsl:when>
        <xsl:when test='$path/rs:TransactionTypeCode = "Inter-Country"'>
          <xsl:if test="/rs:ESBMsg/rs:RqData">
            <eo:RqData actionCode="CreateRetailIntraBankTransfer">
              <eo:Transfer>
                <com:TransferIdentifier>
                  <com:BankID/>
                </com:TransferIdentifier>
                <xsl:for-each select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:Transaction">
                  <com:Transaction>
                    <com:AccountIdentifier>
                      <com:BankID>
                        <xsl:value-of select="com:BankID"/>
                      </com:BankID>
                      <com:AccountID>
                        <xsl:value-of select="com:AccountID"/>
                      </com:AccountID>
                      <com:AccountCurrency>
                        <xsl:value-of select="rs:AccountCurrency"/>
                      </com:AccountCurrency>
                    </com:AccountIdentifier>
                    <com:TransactionType>
                      <xsl:value-of select="rs:TransactionType"/>
                    </com:TransactionType>
                    <com:TransactionReferenceNumber>
                      <xsl:value-of select="rs:TransferReferenceNumber"/>
                    </com:TransactionReferenceNumber>
                    <com:TransactionDescription>
                      <xsl:value-of select="rs:TransactionDescription"/>
                    </com:TransactionDescription>
                    <com:TransactionAmount currencyCode="{rs:AccountCurrency}">
                      <xsl:value-of select="rs:TransactionAmount"/>
                    </com:TransactionAmount>
                    <com:Remarks>
                      <xsl:value-of select="com:Remarks"/>
                    </com:Remarks>
                    <com:ValueDate>
                      <xsl:value-of select="concat(substring(rs:ValueDate,1,4),'-',substring(rs:ValueDate,5,2),'-',substring(rs:ValueDate,7,2))"/>
                    </com:ValueDate>
                  </com:Transaction>
                </xsl:for-each>
              </eo:Transfer>
            </eo:RqData>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <eo:RqData actionCode="CreateSwiftTransfer">
            <eo:Transfer>
              <com:TransferIdentifier>
                <com:BankID>
                  <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/com:BankID"/>
                </com:BankID>
              </com:TransferIdentifier>
              <eo:PurposeCode>1A1</eo:PurposeCode>
              <eo:ChargeEventID>FIRTGS</eo:ChargeEventID>
              <eo:ChargeOption>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ChargeType"/>
              </eo:ChargeOption>
              <eo:WaiveChargesIndicator>N</eo:WaiveChargesIndicator>
              <eo:TransferOrderType>CT</eo:TransferOrderType>
              <com:Amount currencyCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:DebitCurrency}">
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:DebitAmount"/>
              </com:Amount>
              <eo:InstructedAmount currencyCode="{/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransferCurrency}">
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransferAmount"/>
              </eo:InstructedAmount>
              <com:ValueDate>
                <xsl:value-of select="concat(substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ValueDate,1,4),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ValueDate,5,2),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ValueDate,7,2))"/>
              </com:ValueDate>
              <eo:DebitExecutionDate>
                <xsl:value-of select="concat(substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,1,4),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,5,2),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,7,2))"/>
              </eo:DebitExecutionDate>
              <eo:CreditValueDate>
                <xsl:value-of select="concat(substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ValueDate,1,4),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ValueDate,5,2),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ValueDate,7,2))"/>
              </eo:CreditValueDate>
              <eo:CreditExecutionDate>
                <xsl:value-of select="concat(substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,1,4),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,5,2),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,7,2))"/>
              </eo:CreditExecutionDate>
              <com:Rate>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ConversionRate1"/>
              </com:Rate>
              <eo:TransferReferenceNumber>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/com:TransactionReferenceNumber"/>
              </eo:TransferReferenceNumber>
              <eo:AutoVerify>Y</eo:AutoVerify>
              <eo:POType>SWIFT</eo:POType>
              <eo:RequestExecutionDate>
                <xsl:value-of select="concat(substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,1,4),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,5,2),'-',substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:TransactionDate,7,2))"/>
              </eo:RequestExecutionDate>
              <eo:AWIAddressIndicator>B</eo:AWIAddressIndicator>
              <eo:RemitInfo>
                <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:RemittanceInfo"/>
              </eo:RemitInfo>
              <eo:RateCode>TTS</eo:RateCode>
              <com:PayFromAccount>
                <com:AccountIdentifier>
                  <com:AccountID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/com:AccountID"/>
                  </com:AccountID>
                  <com:IBAN>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:ChargeDebitAccountNumber"/>
                  </com:IBAN>
                </com:AccountIdentifier>
              </com:PayFromAccount>
              <com:PayeeAccount>
                <com:AccountIdentifier>
                  <com:BankID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:OurCorrespBankCode"/>
                  </com:BankID>
                  <com:BankBIC>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryBankBIC"/>
                  </com:BankBIC>
                  <com:BranchID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:OurCorrespBrCode"/>
                  </com:BranchID>
                  <com:AccountID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryAccount"/>
                  </com:AccountID>
                </com:AccountIdentifier>
                <com:PartyReference>
                  <com:PersonName>
                    <com:FullName>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryName"/>
                    </com:FullName>
                  </com:PersonName>
                  <com:Address>
                    <com:LineOne>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryBankAddress1"/>
                    </com:LineOne>
                    <com:LineTwo>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryBankAddress2"/>
                    </com:LineTwo>
                    <com:LineThree>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryBankAddress3"/>
                    </com:LineThree>
                  </com:Address>
                </com:PartyReference>
              </com:PayeeAccount>
              <com:CountryCode>
                <xsl:value-of select="substring(/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:BeneficiaryBankBIC,5,2)"/>
              </com:CountryCode>
              <eo:IntermediaryAccount>
                <com:AccountIdentifier>
                  <com:BankID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:OurCorrespBankCode"/>
                  </com:BankID>
                  <com:BankBIC>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:OurCorrespBrBIC"/>
                  </com:BankBIC>
                  <com:BranchID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/rcom:OurCorrespBrCode"/>
                  </com:BranchID>
                  <com:AccountID>
                    <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Transfer/rs:TransferIdentifier/com:AccountID"/>
                  </com:AccountID>
                </com:AccountIdentifier>
              </eo:IntermediaryAccount>
            </eo:Transfer>
          </eo:RqData>
        </xsl:otherwise>
      </xsl:choose>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>