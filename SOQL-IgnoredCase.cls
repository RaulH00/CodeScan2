public without sharing class AccountSearch {

    /**
    IGNORED CASE:
    whenever we are passing the parameter to the method which has database.query() directly it is giving violation.
    but this shouldn't give because later he is assigning with one static value,
    But we are ignoring this case, since it is not variable declaration and the data flow of this is a different, 
    it might effect some existing functionality if we change anything.
     */
       
    /**
     In the same way whenever a method takes parameter and assignd to query variable directly it will consider that value not the re-assignments
     
     public AccountSearch(String query2){ //Not Giving Violation

            query2='select * from abc'; //Not Consider this assignment
            query=query2;    ----> Considers only this, because the 
        }

     */
        
        public void searchInternalAccount(String query){

            query ='select id,Name,D_U_N_S__c,Billingcountry,billingstate,Type,account_status__c,recordtypeId,recordtype.name,BillingStateCode,billingcity,billingpostalcode,BillingStreet,billingcountrycode,Phone,website,owner.name from account where ';
            List<account> sfdcaccList = new List<Account>();

            sfdcaccList = database.query(query);
        }

}