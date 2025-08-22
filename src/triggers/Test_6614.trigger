trigger AppliedServiceProduct_All on Applied_Service_Product_AC__c (before insert, before update) {
    if (CodeUtils.stopAppliedServiceProductTrigger) {
        return;
    }


    private Map<String,Price_Book_AC__c> getPriceForASP(Map<Id,SVMXC__Service_Contract__c> contractMap) {

        List<Price_Book_AC__c> priceBookLst = [SELECT Rate_AC__c, Curr_Code_AC__c, Product_AC__c, Sales_Org_AC__c,Country_Code_AC__c FROM Price_Book_AC__c 
                                                WHERE Product_AC__c IN :productSet
                                                AND Sales_Org_AC__c IN :salesOrgSet
                                                AND ( (Start_Date_AC__c <= :todayDate AND End_Date_AC__c >= :todayDate AND End_Date_AC__c != null)
                                                    OR (Start_Date_AC__c <= :todayDate AND End_Date_AC__c = null) ) ];
                   return priceBookMap;
    }
}