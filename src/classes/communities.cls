/**
 * An apex page controller that takes the user to the right start page based on credentials or lack thereof
 */
@IsTest
public with sharing class CommunitiesLandingControllerTest {
    @IsTest(SeeAllData=true)
    public static void testCommunitiesLandingController() {
        // Instantiate a new controller with all parameters in the page
        CommunitiesLandingController controller = new CommunitiesLandingController();
        PageReference pageRef = controller.forwardToStartPage();
        //PageRef is either null or an empty object in test context
        if (pageRef != null) {
            String url = pageRef.getUrl();
            if (url != null) {
                Assert.isTrue(String.isEmpty(url));
            }
        }
    }
}
*******************************************************************************************

* @File Name : agentPortal_AgentController.cls

* @Description : To retrieve and populate the Agent Organization Hierarchy table

* @Author : IDC Offshore

* @Group : Salesforce Professional Services

*******************************************************************************************/

public without sharing class agentPortal_AgentController {

private static final String CLASSNAME ='AgentPortal_UserProfileInformation';

private static final String METHODNAME ='getAgntInfo';

private static final string PARENTAGENCY='Parent Agency: ';

private static final string CHILDAGENCY='Agency: ';

private static final string MYAGENCY=' (My Agency)';

/* private static final string FACTORSWITHQUES='/factors?';

private static final string REQUEST_TYPE_GET='GET';

private static final string REQUEST_TYPE_POST='POST';

private static final String METHODNAME3 ='APICallOut';

private static final String METHODNAME5 ='validateLoginCredentials';

private static final String METHODNAME6 ='updateSecurityQuestions';

private static final string STRING_CONTENT_TYPE='Content-Type';

private static final string REQ_CONTENT_TYPE='application/json';

private static final string REQUEST_TYPE_DELETE='DELETE';

private static final string REQUEST_TYPE='POST';

private static final String METHODNAME2 ='sendSMS';

private static final string LIFECYCLE='/lifecycle/';

private static final string QUESTIONMARK='?';

private static final string EQUAL='=';

private static final string OKTAPROVIDER='","provider": "OKTA",';

private static final string ENDINGBRACES='" } }';

private static final string FACTORSTYPE='{ "factorType":"';

private static final string ACTIVATED='activate';

private static final string VALUE='true';

private static final string AUTHRZTN_STR='Authorization';

private static final string ACCEPT='Accept';

private static final string STATUS='status';

private static final string ACTIVEVALUE='ACTIVE';

private static final String METHODNAME1

='sendRegistrationCode';

private static final string PROFILE='"profile": { "phoneNumber": "';

private static final string SINGLEBRACES='"}';

private static final string PASSCODE='{"passCode": "';

private static final string USERS='/users/';

private static final string FACTORS='/factors/';

private static final string FACTOR='/factors';

private static final string CREDENTIALS='/credentials/';

private static final string CHANGE_PASSWORD='change_password?';

private static final string TOKENLIFETIME='tokenLifetimeSeconds=600';

private static final string AGNT_APPGRPID =system.label.AgentPortal_ApplicationGroupId;

private static final string URL ='SSWS00M3zzdKyEegebMmxe5tbQnycY7ialwxsR0kVBA4rL';

private static final String METHODNAME8 = 'passwordChange';

private static final String METHODNAME9='terminateUser';*/

/*******************************************************************************************************************************

@Description:

@Name : getAgntInfo()

@Param :

@Return : Agent_Registration_Audit__c

@throws Exception : N/A;

*************************************************************************/

@AuraEnabled

public static User getAgntInfo(){

user agentrec= new user();

try

{

String uservalId=UserInfo.getUserId();

agentrec = [select ContactId, Contact.Name, Contact.Phone, Contact.Email, Contact.FirstName, Contact.MobilePhone, Contact.MiddleName, Contact.LastName,Contact.Agent_Code__c, Contact.Agency_Role__c, contact.vlocity_ins__Type__c

from User

where Id= :uservalId];

}

catch(Exception e){GA_LogExceptionCls.LogExcp(e, CLASSNAME, METHODNAME); }

return agentrec;

}

/*******************************************************************************************************************************

@Description:

@Name : getAgntDetails()

@Param :

@Return : Agent_Registration_Audit__c

@throws Exception : N/A;

*************************************************************************/

@AuraEnabled

public static Agent_Registration_Audit__c getAgntDetails(){

Agent_Registration_Audit__c agentUserId= new Agent_Registration_Audit__c();

try

{

String uservalId=UserInfo.getUserId();

agentUserId= [SELECT User_Id__c,Email__c,First_Name__c,Last_Name__c FROM Agent_Registration_Audit__c

WHERE Related_Contact__c IN (SELECT ContactId FROM User

where Id= :uservalId)];

}

catch(Exception e){GA_LogExceptionCls.LogExcp(e, CLASSNAME, METHODNAME);

}

return agentUserId;

}

/*******************************************************************************************************************************

@Description:

@Name : getAgencyDetails()

@Param :

@Return : Contact

@throws Exception : N/A;

*************************************************************************/

@AuraEnabled

public static Contact getAgencyDetails(String agntuserid) {

//String contactId;

//String accountId;

//String parentAgencyName;

//string accountName;

String uservalId;

user agentrec= new user();

If(agntuserid!=null && agntuserid !=''){

system.debug(agntuserid);

uservalId = agntuserid;}

else{

uservalId=UserInfo.getUserId();

}

agentrec = [select Id,ContactId, Contact.Name, Contact.Phone, Contact.Email, Contact.FirstName, Contact.MobilePhone, Contact.MiddleName, Contact.LastName,Contact.Agent_Code__c, Contact.Agency_Role__c, Contact.vlocity_ins__Type__c,Contact.Account.name, Contact.Is_Agency_Coordinator__c

from User

where Id= :uservalId];

Contact contact = [SELECT Id,AccountId,Account.GA_Agency_Code__c,Account.GA_Agency_Type__c,Account.Type,Account.GA_Platinum__c,Account.Name,Account.Parent_Agency_Name__c,Account.Phone, Account.GA_Agency_Tier__c,Account.ShippingAddress, Is_Agency_Coordinator__c FROM Contact WHERE Id =:agentrec.ContactId LIMIT 1];

return contact;

}

/*******************************************************************************************************************************

@Description:

@Name : updateAgentCoordinatorPermissionDetails()

@Param :

@Return : Contact

@throws Exception : N/A;

*************************************************************************/

@AuraEnabled

public static Contact assignAgentCoordinatorPermission(String agntuserid,Boolean isAgencyCoordinator ) {

String uservalId;

user agentrec= new user();

If(agntuserid!=null && agntuserid !=''){

system.debug(agntuserid);

uservalId = agntuserid;}

else{

uservalId=UserInfo.getUserId();

}

agentrec = [select Id,ContactId, Contact.Name, Contact.Phone, Contact.Email, Contact.FirstName, Contact.MobilePhone, Contact.MiddleName, Contact.LastName,Contact.Agent_Code__c, Contact.Agency_Role__c, Contact.vlocity_ins__Type__c,Contact.Account.name, Contact.Is_Agency_Coordinator__c

from User

where Id= :uservalId];

Contact contact = [SELECT Id,AccountId,Account.GA_Agency_Code__c,Account.GA_Agency_Type__c,Account.Type,Account.GA_Platinum__c,Account.Name,Account.Parent_Agency_Name__c,Account.Phone, Account.GA_Agency_Tier__c,Account.ShippingAddress, Is_Agency_Coordinator__c FROM Contact WHERE Id =:agentrec.ContactId LIMIT 1];

contact.Is_Agency_Coordinator__c=isAgencyCoordinator;

update contact;

return contact;

}

/*******************************************************************************************************************************

@Description:

@Name : getSelectUserDetails()

@Param :

@Return : Contact

@throws Exception : N/A;

*************************************************************************/

@AuraEnabled

public static Agent_Registration_Audit__c getSelectUserDetails(String agntuserid) {

String uservalId;

//user agentrec= new user();

Agent_Registration_Audit__c agentUserId= new Agent_Registration_Audit__c();

If(agntuserid!=null && agntuserid !=''){

system.debug(agntuserid);

uservalId = agntuserid;}

else{

uservalId=UserInfo.getUserId();

}

agentUserId= [SELECT User_Id__c,Email__c,First_Name__c,Last_Name__c,Related_Contact__r.vlocity_ins__Type__c FROM Agent_Registration_Audit__c

WHERE Related_Contact__c IN (SELECT ContactId FROM User

where Id= :uservalId)];

return agentUserId;

}

/************** *********

Method name : parseIdFromResponse

Params : NA

Return Type : void

Description : This method is used to get factorID and pass it to sendregistercode method.

****************** ********* *****/

@AuraEnabled

public static String parseIdFromResponse(String responseBody) {

Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(responseBody);

String id = (String) responseMap.get('id');

if (id!=null) {

return id;

}

return null;

}

/************** *********

Method name : getAgentHierarchy

Params : NA

Return Type : void

Description : This method is used to retrieve and populate the Agent Organization Hierarchy table.

****************** ********* *****/

@AuraEnabled(cacheable=true)

public static List<AgentHierarchyWrapper> getAgentHierarchy(String agntuserid) {

String contactId;

//String accountId;

String parentAgencyName;

String parentAgencyId;

string accountName;

Agent_Registration_Audit__c agentUserId= new Agent_Registration_Audit__c();

List<AgentHierarchyWrapper> agentHierarchyList = new List<AgentHierarchyWrapper>();

String uservalId;

If(agntuserid!=null && agntuserid !=''){

uservalId = agntuserid;}

else{

uservalId=UserInfo.getUserId();

}

agentUserId= [SELECT User_Id__c,Email__c,First_Name__c,Last_Name__c FROM Agent_Registration_Audit__c

WHERE Related_Contact__c IN (SELECT ContactId FROM User

where Id= :uservalId)];

Agent_Registration_Audit__c agentRegistration = [SELECT Related_Contact__c,Unique_ID__c,User_Id__c FROM Agent_Registration_Audit__c WHERE User_Id__c =:agentUserId.User_Id__c order by createddate desc LIMIT 1];

if (agentRegistration != null && agentRegistration.Related_Contact__c != null) {

contactId = agentRegistration.Related_Contact__c;

}

Contact contact = [SELECT Id,AccountId,Account.Id,Account.Name,Account.GA_Account__c, Account.GA_Agency_Code__c, Account.ParentId,Account.Parent_Agency_Name__c FROM Contact WHERE Id =:contactId LIMIT 1];

if (contact != null && contact.Account != null) {

//accountId = contact.Account.Id;

accountName = contact.Account.Name;

// parentAgencyName = contact.Account.Parent_Agency_Name__c;

system.debug('###'+contact.Account.ParentId);

parentAgencyName = contact.Account.ParentId;

}

system.debug('###'+contact.Account.ParentId);

// if(contact.Account.Parent_Agency_Name__c!=null) {

if(contact.Account.ParentId!=null) {

// parentAgencyName = contact.Account.Parent_Agency_Name__c;

parentAgencyName = contact.Account.ParentId;

system.debug('###'+parentAgencyName);

} else {

// parentAgencyName=accountName;

parentAgencyName=contact.AccountId;

// system.debug('###'+parentAgencyName);

}

// list<Account >account= [SELECT Id, Name,Parent_Agency_Name__c,GA_Account__c,ParentId,Phone,ShippingAddress FROM Account WHERE Id =:parentAgencyName limit 1];

list<Account >account= [SELECT Id, Name,Parent_Agency_Name__c,GA_Agency_Code__c,Phone,ShippingAddress FROM Account WHERE Id =:parentAgencyName limit 1];

List<Account> agentContacts1 =new List<Account>();

List<Account> agentContacts2 =new List<Account>();

if(!account.isEmpty()) {

parentAgencyId = account[0].Name;

system.debug('###'+account);

agentContacts1.add(account[0]);

}

// List<Account> agentContacts = [SELECT Id, Name,Parent_Agency_Name__c,GA_Account__c,Phone,ShippingAddress FROM Account WHERE Parent_Agency_Name__c=:parentAgencyName];

List<Account> agentContacts = [SELECT Id, Name,Parent_Agency_Name__c, GA_Agency_Code__c, GA_Account__c,ParentId,Phone,ShippingAddress FROM Account WHERE ParentId=:parentAgencyName];

//List<Account> agentContacts = [SELECT Id, Name,Parent_Agency_Name__c,GA_Account__c,ParentId,Phone,ShippingAddress FROM Account ];

system.debug('###'+agentContacts);

agentContacts2.addAll(agentContacts1);

agentContacts2.addAll(agentContacts);

boolean parent=false;

for (Account agent : agentContacts2) {

AgentHierarchyWrapper hierarchyWrapper = new AgentHierarchyWrapper();

if(parent==false) {

if (accountName ==parentAgencyId) {

hierarchyWrapper.accountName = PARENTAGENCY + parentAgencyId + MYAGENCY;

} else {

hierarchyWrapper.accountName = PARENTAGENCY + parentAgencyId;

}

hierarchyWrapper.address = getAddress(account[0]);

hierarchyWrapper.phoneNumber = account[0].Phone;

hierarchyWrapper.agencyCode = account[0].GA_Agency_Code__c;

agentHierarchyList.add(hierarchyWrapper);

parent=true;

} else {

if (accountName ==agent.Name) {

hierarchyWrapper.accountName = CHILDAGENCY + agent.Name + MYAGENCY;

} else {

hierarchyWrapper.accountName = CHILDAGENCY + agent.Name;

}

hierarchyWrapper.address = getAddress(agent);

hierarchyWrapper.phoneNumber = agent.Phone;

hierarchyWrapper.agencyCode = agent.GA_Agency_Code__c;

agentHierarchyList.add(hierarchyWrapper);

}

}

system.debug('###'+agentHierarchyList);

system.debug('### size'+agentHierarchyList.size());

return agentHierarchyList;

}

// Utility method to construct the address string

/***********************

Method name : getAddress

Params : NA

Return Type : void

Description : Utility method to construct the address string

****************** ********* *****/

@AuraEnabled

public Static string getAddress(Account account) {

Address addr = account.ShippingAddress;

String address = '';

if (addr.getStreet() != null) {

address += addr.getStreet() + ', ';

}

if (addr.getCity() != null) {

address += addr.getCity() + ', ';

}

if (addr.getState() != null) {

address += addr.getState() + ', ';

}

if (addr.getCountry() != null) {

address += addr.getCountry()+ ', ';

}

if (addr.getPostalCode() != null) {

address += addr.getPostalCode();

}

return address;

}

/***********************

Method name : AgentHierarchyWrapper

Params : NA

Return Type : void

Description : AgentHierarchyWrapper wrapper class

****************** ********* *****/

public class AgentHierarchyWrapper {

@AuraEnabled

public String accountName { get; set; }

@AuraEnabled

public String address { get; set; }

@AuraEnabled

public String phoneNumber { get; set; }

@AuraEnabled

public String agencyCode { get; set; }

}

/*******************************************************************************************************************************

@Description:

@Name : agentUserStatus()

@Param :

@R

throws Exception : N/A;

*************************************************************************/

@AuraEnabled

public static void agentUserStatus(String agntuserid,Boolean status ) {

user agentrec= new user();

agentrec = [select Id,ContactId, IsActive from User where Id= :agntuserid LIMIT 1];

// Contact cont=new Contact();

If(agentrec!=null){

agentrec.IsActive=status;

Database.update(agentrec);

}

//return;

}

/*******************************************************************************************************************************

@Description:

@Name : agentContactStatus()

@Param :

@Return : Contact

@throws Exception : N/A;

************************************************************************/

@AuraEnabled

public static void agentContactStatus(String agntuserid,Boolean status) {

user agentrec= new user();

Contact cont=new Contact();

try{

If(agntuserid!=null && agntuserid !=''){

agentrec = [select Id,ContactId, IsActive from User where Id= :agntuserid LIMIT 1];

cont= [select Id,Active__c from Contact where Id=:agentrec.ContactId ];

if(cont!=null){

cont.Active__c=false;

Database.update(cont);

}

}

}catch(exception er){}

//return;

}

/*******************************************************************************************************************************

@Description: agentUserStatusupdate upon deactivating contact in CRM

@Name : agentUserStatusupdate()

@Param :

@Return : agentrec

@throws Exception : N/A;

*************************************************************************/

/* @future(callout=true)

public static void agentUserStatusupdate(String agntuserid,Boolean status ) {

user agentrec= new user();

agentrec = [select Id,ContactId, IsActive from User where Id= :agntuserid LIMIT 1];

If(agentrec!=null){

agentrec.IsActive=status;

Database.update(agentrec);

}

return;
