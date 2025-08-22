/**
 * BingoController controls the BINGO page and both BINGO components.
 *
 * @author David Schach
 *
 * Dev Team Chris Shackelford
 *          Brad Gross
 *
 * @version     2.1 2011-02-18
 *  
 */

global with sharing class BINGOController {
    
    public integer x {get; set;}
    
    private id myid;
    public List<User> bingos {get; private set;}
    private List<User> allusers;
    private Set<Id> userids;
    public User me {get; set;}
    public User user1 {get; set;}
    public User user2 {get; set;}
    public User user3 {get; set;}
    public User user4 {get; set;}
    public User user5 {get; set;}
    public User user6 {get; set;}
    public User user7 {get; set;}
    public User user8 {get; set;}
    public User user9 {get; set;}
    public User user10 {get; set;}
    public User user11 {get; set;}
    public User user12 {get; set;}
    public User user13 {get; set;}
    public User user14 {get; set;}
    public User user15 {get; set;}
    public User user16 {get; set;}
    public User user17 {get; set;}
    public User user18 {get; set;}
    public User user19 {get; set;}
    public User user20 {get; set;}
    public User user21 {get; set;}
    public User user22 {get; set;}
    public User user23 {get; set;}
    public User user24 {get; set;}
    public User user25 {get; set;}
    
    //public List<User> bingousers {get; set;}
    
    private static final integer totalsquares = 25;
    
    private static final integer querylimit = 10000;
    
    /**
     * The constructor for BingoController test safsa
     */


    public String method(){

    }

     public String method(){

      }

    
    /**
     * Method getChooseRender
     *
     * @return String
     */
    
    public String getChooseRender() {
        if (ApexPages.currentPage().getParameters().get('p') != null) return 'pdf';
        else return null;
    }
    
    /**
     * Method showAsPDF navigates to the same Visualforce page, but flushes the cache and 
     * performs a GET.  It also places the 'p' parameter in the URL, so ChooseRender
     * returns 'pdf' to the page RenderAs attribute.
     * Note: This also reshuffles the BINGO card, so this does NOT merely display the current
     * BINGO card as a pdf.
     *
     * @return PageReference
     */
    
    public PageReference showAsPDF() {
        PageReference pdfPage =  ApexPages.currentPage();
        pdfpage.getParameters().put('p','p');
        pdfpage.setRedirect(true);
        return pdfpage;
    }
    
    /**
     * Method NewCard navigates to the same Visualforce page, but flushes the cache and 
     * performs a GET.  It does NOT place any 'p' parameter in the URL, so the new page
     * renders as html.  This effectively reshuffles the BINGO card.
     *
     * @return PageReference
     */    
    
    public PageReference NewCard(){
        PageReference pageRef = Page.BINGO;
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    /**
     * Method deprecated, now that renderAs is included in Page.BINGO.
     */
    /*
    public PageReference MakePDF(){
        PageReference pageRef = Page.BINGO_PDF;
        pageRef.setRedirect(false);
        return pageRef;
    }
    */
    
    /**
     * TestMethod - inserts 30 users, has them each follow the running user, 
     * and renders the BINGO card.
     */
    private static  TestMethod void testBINGO_30(){
        
        List<User> users = new List<User>();
        
        for(integer i = 0; i<30; i++)   {
            User u = createTestUser(getSuperProfile());
            users.add(u);
        }
        insert users;
        List<EntitySubscription> followers = new List<EntitySubscription>();
        for ( user u : users){
            EntitySubscription es = new EntitySubscription(SubscriberId = u.id, ParentId = UserInfo.getUserId());
            followers.add(es);
        }
        insert followers;
        
        test.starttest();
        Test.setCurrentPage(Page.Bingo);
      
        BINGOController controller = new BINGOController();
        String NewCard = controller.NewCard().getUrl();
        System.assertEquals('/apex/bingo', NewCard);
        
        String CardPDF = controller.showAsPDF().getUrl();
        System.assertEquals('/apex/bingo?p=p', CardPDF);    
        test.stoptest();
    }
    
     /**
     * TestMethod - inserts 2 users, has them each follow the running user, 
     * and renders the BINGO card.
     * It also has the running user follow each of the 2 inserted users.
     * This is because the BINGO card draws from a user's followers and 
     * from those users who follow the user.
     */
    
    private static  TestMethod void testBINGO_2(){
        
        List<User> users = new List<User>();
        
        for(integer i = 0; i<2; i++)    {
            User u = createTestUser(getSuperProfile());
            users.add(u);
        }
        insert users;
        List<EntitySubscription> followers = new List<EntitySubscription>();
        for ( user u : users){
            EntitySubscription es = new EntitySubscription(SubscriberId = u.id, ParentId = UserInfo.getUserId());
            followers.add(es);
        }
        insert followers;
        
        followers = new List<EntitySubscription>();
        for (user u : users){
            EntitySubscription es = new EntitySubscription(SubscriberId = UserInfo.getUserId(), ParentId = u.id);
            followers.add(es);
        }
        insert followers;
        
        test.starttest();
        Test.setCurrentPage(Page.Bingo);
      
        BINGOController controller = new BINGOController();
        String NewCard = controller.NewCard().getUrl();
        System.assertEquals('/apex/bingo', NewCard);
        String CardPDF = controller.showAsPDF().getUrl(); 
        System.assertEquals('/apex/bingo?p=p', CardPDF);    
        test.stoptest();
    }
    
     /**
     * TestMethod - inserts 0 users, has them each follow the running user, 
     * and renders the BINGO card.
     * This method also verifies that the card is first shown as a html page, not a pdf.
     */
    private static  TestMethod void testBINGO_0(){
        
        test.starttest();
        Test.setCurrentPage(Page.Bingo);
      
        BINGOController controller = new BINGOController();
        System.assertEquals(null, controller.getChooserender()); //We are not making a PDF
        String NewCard = controller.NewCard().getUrl();
        System.assertEquals('/apex/bingo', NewCard);
        String CardPDF = controller.showAsPDF().getUrl();
        System.assertEquals('/apex/bingo?p=p', CardPDF);  
        
        test.stoptest();
    }
    
     /**
     * TestMethod - inserts 0 users, has them each follow the running user, 
     * and renders the BINGO card as a PDF.
     */
    private static TestMethod void testShowAsPDF(){
        test.starttest();
        Test.setCurrentPage(Page.Bingo);
        ApexPages.currentPage().getParameters().put('p', 'p');
        BINGOController controller = new BINGOController();
        System.assertEquals('pdf', controller.getChooserender()); //We are making a PDF
        test.stoptest();
    }
    
    public Static Profile TheProfile;
    
    /**
     * Helper method to find a ModifyAllData user profile for each of the test users we create.
     * @return Profile
     */
    
    public Static Profile getSuperProfile(){
        if (TheProfile == null){
            for( Profile p : [ Select Id, PermissionsModifyAllData, Name from Profile limit 100 ] ){
                if( p.PermissionsModifyAllData ){
                    TheProfile = p;
                    return TheProfile;
                }
            }
        }
        return TheProfile;
    }
    
    
    // All code below adapted from ActionPlans, written by Matias Menafra
  
    /**
    * Creates a new User
    * @return testUser
    */
 
    public Static  User createTestUser( Profile p ) {

        //USER U = [ SELECT ID FROM USER WHERE ID = :USERINFO.GETUSERID()];
        //RETURN U;
    
        String namePrefix = createRandomWord();
    
        User testUser = new User();
        testUser.Email              = 'test@test.com';
        testUser.Username           = namePrefix + '@testuser.com';
        testUser.LastName           = 'test';
        testUser.Alias              = 'test';
        testUser.ProfileId          = p.Id;
        testUser.LanguageLocaleKey  = 'en_US';
        testUser.LocaleSidKey       = 'en_US';
        testUser.TimeZoneSidKey     = 'America/Chicago';
        testUser.EmailEncodingKey   = 'UTF-8';
        
        //insert testUser;
        
        return testUser;
    }
    /**
    * Random words are required for testing 
    * as you will likely run into any word I can insert
    * during a test class and produce false test results.
    */
    public Static  String createRandomWord() {
      
      String ret = 'schach' + math.rint(math.random() * 100000);
      
      return ret;
    }
}

/**********************************************************************************************

* @File Name : agentPortal_AgentController.cls

* @Description : To retrieve and populate the Agent Organization Hierarchy table

* @Author : IDC Offshore

* @Group : Salesforce Professional Services

/*********************************************************************************************/

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

rows Exception : N/A;

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

}*/

}
