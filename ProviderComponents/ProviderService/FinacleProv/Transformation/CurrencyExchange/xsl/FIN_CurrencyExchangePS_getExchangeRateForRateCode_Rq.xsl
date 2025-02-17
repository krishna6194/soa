<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/CurrencyExchange/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/CurrencyExchange/V1/CurrencyExchangeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/CurrencyExchange/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <app:FIXML schemalocation="http://www.finacle.com/fixml">
      <app:Header>
        <app:RequestHeader>
          <app:MessageKey>
            <app:RequestUUID>
              <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
            </app:RequestUUID>
            <app:ServiceRequestId>getExchangeRateForRateCode</app:ServiceRequestId>
            <app:ServiceRequestVersion>10.2</app:ServiceRequestVersion>
            <app:ChannelId>
            <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </app:ChannelId>
            <app:LanguageId/>
          </app:MessageKey>
          <app:RequestMessageInfo>
            <app:BankId>54</app:BankId>
            <app:TimeZone/>
            <app:EntityId/>
            <app:EntityType/>
            <app:ArmCorrelationId/>
            <app:MessageDateTime>
              <xsl:value-of select="xp20:format-dateTime(xp20:current-dateTime(),'[Y0001]-[M01]-[D01]T[H01]:[M01]:[s01].[s001]')"/>
            </app:MessageDateTime>
          </app:RequestMessageInfo>
          <app:Security>
            <app:Token>
              <app:PasswordToken>
                <app:UserId/>
                <app:Password/>
              </app:PasswordToken>
            </app:Token>
            <app:FICertToken/>
            <app:RealUserLoginSessionId/>
            <app:RealUser/>
            <app:RealUserPwd/>
            <app:SSOTransferToken/>
          </app:Security>
        </app:RequestHeader>
      </app:Header>
      <app:Body>
        <app:getExchangeRateForRateCodeRequest>
          <app:ExchangeRateForRateCodeInputVO>
            <app:fromCrncyCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:CurrencyExchange/eo:FromCurrencyCode"/>
            </app:fromCrncyCode>
            <app:rateCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:CurrencyExchange/eo:ConversionRate/@unitCode"/>
            </app:rateCode>
            <app:toCrncyCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:CurrencyExchange/eo:ToCurrencyCode"/>
            </app:toCrncyCode>
            <app:txnAmount>
              <app:amountValue>
                <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:CurrencyExchange/com:Amount"/>
              </app:amountValue>
            </app:txnAmount>
          </app:ExchangeRateForRateCodeInputVO>
        </app:getExchangeRateForRateCodeRequest>
      </app:Body>
    </app:FIXML>
  </xsl:template>
</xsl:stylesheet>
