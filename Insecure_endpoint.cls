public class FetchDepositTermsAndRates {

    @future (callout=true)
    public static void fetchTermsAndRates(){ 
        try{ 
            
            Boolean isMetadataUpdateNeeded = false;
            Http httpProtocol = new Http();
            HttpRequest request = new HttpRequest();
            String endpoint = System.label.DepositsTermsAndRatesEndpoint;
            request.setEndPoint(endpoint);
            request.setMethod('GET');
            
            HttpResponse response = httpProtocol.send(request);
                List<Account_Options_Setting__mdt> accOptList = [Select Id,DeveloperName,MasterLabel,Is_Active__c,APY__c,APY_percent__c,Dividend_Rate_in_Text__c,Dividend_Rate__c,Minimum_Deposit_Amount__c,Effective_Date__c,Term__c,TermInMonths__c,Term_in_months__c FROM Account_Options_Setting__mdt];
                if(!accOptList.isEmpty())
                {
                    Map<String,Account_Options_Setting__mdt> accOptOldMap = new  Map<String,Account_Options_Setting__mdt>();
                    for(Account_Options_Setting__mdt accOpts : accOptList){
                        accOptOldMap.put(accOpts.Term__c, accOpts);
                    }
                    Date effctDate;
                    Integer minDepAmt;           
                    List<DepositTermsAndRatesWrapper> termsAndRatesList = DepositTermsAndRatesWrapper.parse(response.getBody());
                    
                    List<DepositTermsAndRatesWrapper> mmcdList = new List<DepositTermsAndRatesWrapper>(); 
                     
                    Map<String,String> mmcdTermRateMap = new Map<String,String>();  
                    for(DepositTermsAndRatesWrapper mmCert: termsAndRatesList ){
                        if(mmCert.name.contains('MM Cert') || mmCert.name.contains('IRA Cert')){ 
                            System.debug('mmCert name===================='+mmCert.name);          
                            mmcdList.add(mmCert);           
                        }
                        
                    }
                    
                    for(DepositTermsAndRatesWrapper mmCertMinAmtAndDate: mmcdList ){
                        if(mmCertMinAmtAndDate.name.contains('Rate')){
                            String currentRate;
                            if(mmCertMinAmtAndDate.name.contains('MM Cert')){
                               currentRate = mmCertMinAmtAndDate.name.substringAfter('MM Cert ').remove(' Rate');
                            }
                            else if(mmCertMinAmtAndDate.name.contains('IRA Cert')) {
                                currentRate = mmCertMinAmtAndDate.name.substringAfter('IRA Cert ').remove(' Rate');
                            }
                            mmcdTermRateMap.put(currentRate,mmCertMinAmtAndDate.rate);
                           
                        }
                        System.debug('mmcdTermRateMap==========='+mmcdTermRateMap);
                        if(mmCertMinAmtAndDate.name.contains('MM Cert Min Amount') || mmCertMinAmtAndDate.name.contains('IRA Cert Min Amount')){
                            String minAmt = mmCertMinAmtAndDate.Rate.replace(',','');
                            minDepAmt = Integer.valueOf(minAmt);
                            
                        }
                        if(mmCertMinAmtAndDate.name.contains('MM Cert Effective Date') || mmCertMinAmtAndDate.name.contains('IRA Cert Effective Date')){
                            String effdt = mmCertMinAmtAndDate.Rate.replace(',','');
                            String[] effDate = effdt.split(' ');
                            Map<String, Integer> monthNumMap = new Map<String, Integer>();
                            String[] months =new String[] {'January','February','March','April','May','June','July','August','September','October','November','December'};
                                for(Integer i=0; i<= (months.size()-1); i++){
                                    monthNumMap.put(months[i],i+1);
                                }
                            integer monthNum = monthNumMap.get(effDate[0]);
                            String month = string.valueof(monthNum);
                            String fullDate = month+'/'+effDate[1]+'/'+effDate[2];             
                            effctDate = date.parse(fullDate);
                            
                        }
                    }
                    
                    List<Metadata.CustomMetadata> metadataRecList = new List<Metadata.CustomMetadata>();
                    Set<String> termSet = new Set<String>();
                    for(DepositTermsAndRatesWrapper var: mmcdList ){
                        Metadata.CustomMetadata metadataRec = new Metadata.CustomMetadata();
                        if(var.name.contains('APY')){
                            Integer termsInMonths;
                            String termsInMonthsText;
                            String monthOrYear = '';
                            String currentAPYRate = var.rate;
                            Decimal currentAPYRatePercent = Decimal.valueOf(currentAPYRate);
                            String currentAPY = var.name;
                            String dividendRate = mmcdTermRateMap.get(currentAPY.substringAfter('Cert ').remove(' APY'));
                            
                            String invalidNumbers = '[^0-9]';
                            String num = currentAPY.replaceAll(invalidNumbers,'') ;
                            
                            if(currentAPY.contains('Mo')){
                                monthOrYear = 'Month';
                            }  
                            if(currentAPY.contains('Yr')){
                                monthOrYear = 'Year';
                            }
                            String termKey = num+' '+monthOrYear;
                            
                            termSet.Add(termKey);

                            String APIName;
                            String prodName;
                            if(var.name.contains('MM Cert')){
                                APIName = 'MMCD'+'_'+num+'_'+monthOrYear+'_'+'APY_Record';  
                                prodName = 'MMCD';       
                            }
                            else if (var.name.contains('IRA Cert')){
                                APIName = 'IRA'+'_'+num+'_'+monthOrYear+'_'+'APY_Record';
                                prodName = 'REA';         
                            }

                            if(accOptOldMap.containsKey(termKey) && accOptOldMap.get(termKey).DeveloperName == APIName){
                                metadataRec.fullName = 'Account_Options_Setting__mdt.'+accOptOldMap.get(termKey).DeveloperName;
                                metadataRec.label = accOptOldMap.get(termKey).MasterLabel;            
                            }
                            else{
                                metadataRec.fullName = 'Account_Options_Setting__mdt.'+APIName;
                                metadataRec.label = APIName;
                                
                            }

                            
                            
                            System.debug('metadataRec.label========'+metadataRec.label);

                            metadata.CustomMetadataValue insertProductName = new metadata.CustomMetadataValue();
                            insertProductName.field = 'Product_Name__c';
                            insertProductName.value = prodName; 

                            metadata.CustomMetadataValue insertIsActive = new metadata.CustomMetadataValue();
                            insertIsActive.field = 'Is_Active__c';
                            insertIsActive.value = true; 
                            
                            metadata.CustomMetadataValue insertMinAmount = new metadata.CustomMetadataValue();
                            insertMinAmount.field = 'Minimum_Deposit_Amount__c';
                            insertMinAmount.value = minDepAmt; 
                            
                            metadata.CustomMetadataValue insertEffectiveDate = new metadata.CustomMetadataValue();
                            insertEffectiveDate.field = 'Effective_Date__c';
                            insertEffectiveDate.value = effctDate;
                            
                            metadata.CustomMetadataValue insertTerm = new metadata.CustomMetadataValue();
                            insertTerm.field = 'Term__c';
                            insertTerm.value = num+' '+monthOrYear;
                            
                            metadata.CustomMetadataValue insertTermInMonths = new metadata.CustomMetadataValue();
                            insertTermInMonths.field = 'TermInMonths__c';
                            if(monthOrYear == 'Month'){
                                termsInMonths = integer.valueof(num);
                                termsInMonthsText = num;
                            }
                            else{
                                termsInMonths = (integer.valueof(num)*12);
                                termsInMonthsText = string.valueof(termsInMonths);
                            }            
                            insertTermInMonths.value = termsInMonths;
                            
                            metadata.CustomMetadataValue insertTermInMonthsText = new metadata.CustomMetadataValue();
                            insertTermInMonthsText.field = 'Term_in_months__c';
                            insertTermInMonthsText.value = termsInMonthsText;
                            
                            metadata.CustomMetadataValue insertAPY = new metadata.CustomMetadataValue();
                            insertAPY.field = 'APY__c';
                            insertAPY.value = currentAPYRate+'%';
                            
                            metadata.CustomMetadataValue insertAPYPercent = new metadata.CustomMetadataValue();
                            insertAPYPercent.field = 'APY_percent__c';
                            insertAPYPercent.value = currentAPYRatePercent;
                            
                            metadata.CustomMetadataValue insertDividendRateText = new metadata.CustomMetadataValue();
                            insertDividendRateText.field = 'Dividend_Rate_in_Text__c';
                            insertDividendRateText.value = dividendRate+'%';
                            
                            metadata.CustomMetadataValue insertDividendRate = new metadata.CustomMetadataValue();
                            insertDividendRate.field = 'Dividend_Rate__c';
                            insertDividendRate.value =  Decimal.valueOf(dividendRate);
                            
                            metadataRec.values.add(insertIsActive);
                            metadataRec.values.add(insertMinAmount);
                            metadataRec.values.add(insertEffectiveDate);
                            metadataRec.values.add(insertTerm);
                            metadataRec.values.add(insertTermInMonths);
                            metadataRec.values.add(insertTermInMonthsText);
                            metadataRec.values.add(insertAPY);
                            metadataRec.values.add(insertAPYPercent);
                            metadataRec.values.add(insertDividendRateText);
                            metadataRec.values.add(insertDividendRate);
                            metadataRec.values.add(insertProductName);
                            metadataRecList.add(metadataRec);
                            
                        }
                    }
                    for(String oldKey :accOptOldMap.keySet()){
                        if(!termSet.contains(oldKey)){
                            Metadata.CustomMetadata metadataRec = new Metadata.CustomMetadata();
                            metadataRec.fullName = 'Account_Options_Setting__mdt.'+accOptOldMap.get(oldKey).DeveloperName;
                            metadataRec.label = accOptOldMap.get(oldKey).MasterLabel;
                            
                            metadata.CustomMetadataValue insertIsActive = new metadata.CustomMetadataValue();
                            insertIsActive.field = 'Is_Active__c';
                            insertIsActive.value = false; 
                            metadataRec.values.add(insertIsActive);
                            metadataRecList.add(metadataRec);
                        }
                    }
                    Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
                    for(Metadata.CustomMetadata metaRecs : metadataRecList){            
                        mdContainer.addMetadata(metaRecs);
                        isMetadataUpdateNeeded = true;            
                    }
                    if(isMetadataUpdateNeeded)
                    {                      
                        Id deployRequestId =  Metadata.Operations.enqueueDeployment(mdContainer, null);             
                    }
                }
                   
        }
        catch(Exception ex){
            
            sendMail(System.Label.MMCD_Terms_and_rates_Subject_Line,'CCO:  Open an ITSM Incident and assign to the Salesforce External (Member 360) On Call with the information below. </br> </br> The Salesforce "Rates and Terms" job failed with this error: </br> </br>'+ex.getMessage()+'</br></br> NOTE:  The Salesforce job retrieves the information from the https://www.penfed.org/content/penfed/public/services/getallrates.json page.  See the https://penfed.atlassian.net/wiki/download/attachments/547061891/Refresh%20Product%20Rates.docx?api=v2 page in Confluence for more details.');            
        }    
    } 
    public static void sendMail(String Subject,String Body){
    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
    String toAddressesStr = System.Label.Salesforce_System_Users_Email;
    List<String> toAddressString = toAddressesStr.split(','); 
    message.toAddresses = toAddressString;
    message.optOutPolicy = 'FILTER';
    message.subject = Subject ;
    message.htmlBody = Body;
    Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
    
    if (results[0].success) {
        System.debug('The email was sent successfully.');
    } else {
        System.debug('The email failed to send: ' + results[0].errors[0].message);
    }
}
}
