/**
* Controller - ASRF_HCPFromController
*/
public class ASRF_HCPFormController {
    
    /**
* Property - showHCPForm variable
*/
    public boolean showHCPForm {get;set;}
    
    /**
* Property - showPrintAndFax variable
*/
    public boolean showPrintAndFax {get;set;}
    
    /**
* Property - showPatient variable
*/
    public boolean showPatient {get;set;}
    
    /**
* Property - patientDetails variable
*/
    public boolean patientDetails {get;set;}
    
    /**
* Property - patientError variable
*/
    public boolean patientError {get;set;}
    
    /**
* Property - showInsurance variable
*/
    public boolean showInsurance {get;set;}
    
    /**
* Property - showPhysician variable
*/
    public boolean showPhysician {get;set;}
    
    /**
* Property - showPrescription variable
*/
    public boolean showPrescription {get;set;}
    
    /**
* Property - showSummary variable
*/
    public boolean showSummary {get;set;}
    
    /**
* Property - showThankYou variable
*/
    public boolean showThankYou {get;set;}
    
    /**
* Property - showProgressBar variable
*/
    public boolean showProgressBar {get; set;}
    
    /**
* Property - showAlmostDone variable
*/
    public boolean showAlmostDone {get; set;}
    
    /**
* Property - showSignature variable
*/
    public boolean showSignature {get; set;}
    
    /**
* Property - strCheckboxState variable
*/
    public String strCheckboxState {get;set;}
    
    /**
* Property - showHCPFormNotes variable
*/
    public boolean showHCPFormNotes {get;set;}
    
    /**
* Property - selectedProduct variable
*/
    public String selectedProduct { get; set; }
    
    /**
* Property - hasFile variable
*/
    public boolean hasFile {get; set;}
    
    /**
* Property - pdfAttachmentId variable
*/
    public String pdfAttachmentId { get;set; }
    
    /**
* Property - selectedProductObj variable
*/
    public ASRF_Product__c selectedProductObj {get;set;}
    
    /**
* Property - physicianName variable
*/
    public String physicianName { get; set; }
    
    /**
* Property - currentId variable
*/
    public String currentId { get;set; }
    
    /**
* Property - allProducts variable
*/
    public List<ASRF_Product__c> allProducts { get; set; }
    
    /**
* Property - allProductsWithDownload variable
*/
    public List<ASRF_Product__c> allProductsWithDownload { get; set; }
    
    /**
* Property - contentText variable
*/
    public ASRF_Content_Text__c contentText { get; set; }
    
    /**
* Property - link1Text variable
*/
    public String link1Text {get;set;}
    
    /**
* Property - link1 variable
*/
    public String link1 {get;set;}
    
    /**
* Property - link2Text variable
*/
    public String link2Text {get;set;}
    
    /**
* Property - link2 variable
*/
    public String link2 { get;set; }
    
    /**
* Property - attachmentId variable
*/
    public String attachmentId { get;set; }
    
    /**
* Property - currentPatientList variable
*/
    public List<ASRF_Requester__c> currentPatientList {get;set;}
    
    /**
* Property - currentRequester variable
*/
    public ASRF_Requester__c currentRequester {get;set;}
    
    /**
* Property - controller variable
*/
    public ASRF_HCPFormController controller {get;set;}
    
    /**
* Property - allDosages variable
*/
    public List<SelectOption> allDosages {get;set;}
    
    /**
* Property - freeTrialLength variable
*/
    public Map<String,Decimal> freeTrialLength {get; set;}
    
    /**
* Property - availableForFreeTrial variable
*/
    public Map<String,Boolean> availableForFreeTrial {get; set;}
    
    /**
* Property - freeTrialContentText variable
*/
    public Map<String,string> freeTrialContentText {get; set;}
    
    /**
* Property - showFreeTrial variable
*/
    public Boolean showFreeTrial {get; set;}
    
    /**
* Property - freeTrialLenghtVal variable
*/
    public Decimal freeTrialLengthVal {get; set;}
    
    /**
* * Property - freeTrialcontent variable
*/
    public String freeTrialcontent {get; set;}
    
    /**
* Property - patientDOBIE variable
*/
    public Date patientDOBIE {get; set;}
    
    /**
* Property - policyHolderDOBIE variable
*/
    public Date policyHolderDOBIE {get; set;}
    
    /**
* * Property - VisitStartDate variable
*/
    public Date visitStartDate {get; set;}
    
    /**
* Property - projectedStartDateIE variable
*/
    public Date projectedStartDateIE {get; set;}
    
    /**
* Property - projectedRydaptStartDateIE variable
*/
    public Date projectedRydaptStartDateIE {get; set;}
    
    /**
* Property - otherBrandProductName variable
*/
    public String otherBrandProductName {get; set;}
    
    /** 
* Property - currentRecord variable
*/
    public ASRF_Requester__c currentRecord {get;set;}
    
    /** 
* Property - currentProduct variable
*/
    public ASRF_Product__c currentProduct {get;set;}
    
    /** 
* Property - signatureId variable
*/
    public ID signatureId {get;set;}
    
    /** 
* Property showPrescribingInformation - variable
*/
    public boolean showPrescribingInformaton {get;set;}
    
    /** 
*  * Property injectionAdministered - variable
*/
    
    public string injctnAdmn {get;set;}
    
    /** 
*  * Property enableField - variable
*/
    public Boolean enableField {get; set;}
    /** 
*  * Property injAdmOther - variable
* */
    private static string injAdmOther ='Other (please list street address)';
    /** 
*  *  * Property AdakveoDose - variable
* */
    private static string adakveoDose ='100 mg/10 mL (10 mg/mL) solution in a single-dose vial';
    /** 
*  * Property selProd1 - variable
* */
    public string selProd1 {get; set;}
    /** 
*  * Property selProd2 - variable
* */
    public string selProd2 {get; set;}
    /** 
*  * Property showpiqrayFT - variable
* */
    public Boolean showpiqrayFT {get; set;}
    /** 
*  * Property PrescrptnNextBtn - variable
* */
    public Boolean prescrptnNextBtn {get; set;}
    /** 
     * *  * Property currentDose - variable
* */
     public string currentDose {get; set;}
    /** 
     * 
* * Property - ipAddress variable
*/
    public String ipAddress { get;set; }
    /**
* * Property - freeTrialCheck variable
*/
    public Boolean freeTrialCheck { get;set; }
    /**
* Constructor
*/
    public ASRF_HCPFormController() {
        strCheckboxState = '';
        enableField = true;
        controller = this;
        PrescrptnNextBtn = true;
        currentRequester = new ASRF_Requester__c();
        ipAddress = ASRF_Utils.getUserIPAddress();
        currentRequester.Confirmation__c = apexpages.currentpage().getparameters().get('id');
        clearLinks();
        hideAllPanels();
        loadAllProducts();
        loadContentText();
        hideAllPanels();
        if(String.isBlank(currentRequester.Confirmation__c)) {  
            showHCPForm = true;
        } else {
            showPatient = true;
        }
        showHCPFormNotes = false;
        hasFile = false;
    }
     
    /**
* This method is used to load all products
*/
    public void loadAllProducts() {
        if(ASRF_Product__c.sObjectType.getDescribe().isAccessible() && ASRF_Product_Dosing__c.sObjectType.getDescribe().isAccessible() 
           && attachment.sObjectType.getDescribe().isAccessible()) {
               allProducts = [SELECT id, 
                              (SELECT id FROM attachments LIMIT 1),
                              (SELECT id, Dosage__c, Available_For_Free_Trial__c,Dosage_Strength__c, Free_Trial_Length__c,Free_Trial_Content_Text__c FROM ASRF_Product_Dosings__r ORDER BY Dosage_Strength__c),
                              Name__c,
                              active__c,
                              Drug_Form__c,
                              Full_Prescribing_Information_1_Link__c,
                              Full_Prescribing_Information_1_Name__c,
                              Full_Prescribing_Information_2_Link__c,
                              Full_Prescribing_Information_2_Name__c,
                              Available_OnLine_Form__c,
                              Show_Patient_Weight_Section__c,
                              Must_be_divisible_by__c,
                              Show_Primary_Diagnosis_Section__c,
                              Show_Transfer_Prescription_Section__c,
                              Show_Prior_Treatment_Section__c ,
                              Show_Dosage_Section__c,
                              KISQALI_Custom_Product__c,
                              KISQALI_FEMARA_Custom_Product__c,
                              RYDAPT_Custom_Product__c,
                              PIQRAY_Custom_Product__c,
                              TAFINLAR_MEKINIST_Custom_Product__c ,
                              Blank_Other_Brand_Custom_Form__c,
                              Sandostatin_Custom_Product__c,
                              ADAKVEO_Custom_Product__c
                              FROM
                              ASRF_Product__c
                              WHERE
                              active__c = true
                              ORDER BY Name__c];
           }
        
        final List<ASRF_Product__c> others = new List<ASRF_Product__c>();
        final List<ASRF_Product__c> allFinal = new List<ASRF_Product__c>();
        final List<ASRF_Product__c> allFinalDownload = new List<ASRF_Product__c>();
        final List<ASRF_Product__c> othersDownload = new List<ASRF_Product__c>();

        for(ASRF_Product__c prd : allProducts) {
            if(prd.Available_OnLine_Form__c) {
                if(prd.Name__c.startsWithIgnoreCase('Other')) {
                    others.add(prd);
                } else { 
                    allFinal.add(prd);
                }
            }
            if (prd.attachments!=null && prd.attachments.size()>0) {
                if (allProductsWithDownload==null) {
                    allProductsWithDownload = new List<ASRF_Product__c>();
                }
                if(prd.Name__c.startsWithIgnoreCase('Other')) {
                    othersDownload.add(prd);
                } else { 
                    allFinalDownload.add(prd);
                }
            }
        }
        allFinal.addAll(others);
        allProducts = allFinal;
        allFinalDownload.addAll(othersDownload);
        allProductsWithDownload= allFinalDownload;
    }
    
    /**
* This method is used to hide all panels
*/
    public void hideAllPanels() {
        showPrescribingInformaton = false;
        showHCPForm = false;
        showPrintAndFax=false;
        showPatient = false;
        patientDetails = false;
        patientError = false;
        showInsurance = false;
        showPhysician = false;
        showPrescription = false;
        showSummary = false;
        showpiqrayFT=false;
    }
    
    
    /**
* This method is used to show online patient form
*/
    public PageReference completeOnlineForm() {
        hideAllPanels();
        showPatient = true;
        return null;
    }
    
    /**
* This method is used to process a press of the Next button when Patient component is rendered
*/
    public PageReference patientNext() {
        hideAllPanels();
        patientDetails = true;
        verifyPatientID();
        PageReference pge=apexpages.currentpage();
        pge.getparameters().put('confId','');
        return pge;
    }
    
    /**
* This method returns a list of US states
*/
    public List<SelectOption> getUsStates() {
        return ASRF_Utils.generateUSStateList();
    }
    
    /**
* This method is used to process a press of the Next button when Patient Detail component is rendered
*/
    public PageReference patientDetailNext() {
        hideAllPanels();
        showInsurance = true;
        return null;
    }
/** 
    * This method is used to process a press of the Next button when Patient Detail component is rendered
*/
    public PageReference patientDetailBack() {
        hideAllPanels();
        showPatient = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Back button when the Patient component is rendered
*/
    public PageReference patientBack() {
        hideAllPanels();
        showHCPForm = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Back button when the Patient Error component is rendered
*/
    public PageReference patientErrorBack() {
        hideAllPanels();
        showPatient = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Next button when the Insurance component is rendered
*/
    public PageReference insuranceNext() {
        hideAllPanels();
        showPhysician = true;
        if(currentRequester.Policy_Holder_Date_of_Birth__c==null && policyHolderDOBIE!=null) {
            currentRequester.Policy_Holder_Date_of_Birth__c = policyHolderDOBIE;
        }
        return null;
    }
    
    /** 
* This method is used to process a press of the Back button when the Insurance component is rendered
*/
    public PageReference insuranceBack() {
        hideAllPanels();
        patientDetails = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Next button when the Physician component is rendered
*/
    public PageReference physicianNext() {
        hideAllPanels();
        showPrescription = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Back button when the Physician component is rendered
*/
    public PageReference physicianBack() {
        hideAllPanels();
        showInsurance = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Next button when the Prescription component is rendered
*/
    public PageReference prescriptionNext() {
        hideAllPanels();
        showSummary = true;
        if(currentRequester.Projected_Start_Date__c==null && projectedStartDateIE!=null) {
            currentRequester.Projected_Start_Date__c = projectedStartDateIE;
        }
        if(currentRequester.Projected_Rydapt_Start_Date__c==null && projectedRydaptStartDateIE!=null) {
            currentRequester.Projected_Rydapt_Start_Date__c = projectedRydaptStartDateIE;
        }
        if(currentRequester.Visits_Start_Date__c==null && visitStartDate!=null) {
            currentRequester.Visits_Start_Date__c = visitStartDate;
        }
        if(currentRequester.Product__c!=null && currentRequester.Product__c.containsIgnoreCase('ADAKVEO')) {
            currentRequester.Dosage__c = adakveoDose;
        }
        return null;
    }
    
    /** 
* This method is used to process a press of the Back button when the Prescription component is rendered
*/
    public PageReference prescriptionBack() {
        hideAllPanels();
        showPhysician = true;
        return null;
    }
    
    /** 
* This method is used to process a press of the Back button when the Summary component is rendered
*/
    public PageReference summaryBack() {
        hideAllPanels();
        showPrescription = true;
        return null;
    }
    
    /** 
* This method is used to make a submission
*/
    public PageReference submit() {
        hideAllPanels();
        final String confirmationId = apexpages.currentpage().getparameters().get('confId');
        if(String.isBlank(confirmationId)) {
            nextInsertHCPForm();
            loadContentText();
            if(currentRequester.Physician_Not_Available__c) {
                showAlmostDone=true;
            } else {
                showThankYou = true;
            }
            return null;
        } 
        PageReference pgRef= new PageReference('/autosrf/ASRF_PatientForm');
        pgRef.setRedirect(true);
        return pgRef;        
    }
    
    /** 
* This method returns a string containg the current year
*/
    public String getCurrentYear() {
        return '' + System.Today().year();
    }
    
    /** 
* This method returns a string containg the current time
*/
    public String getCurrentTime() {
        return '' + DateTime.now().format('MMMM dd, YYYY hh:mm:ss');
    }
    
    /** 
* This method is used to verify a patient ID
*/
    public void  verifyPatientID() {
        patientDetails = false;
        showPatient = false;
        patientError = true;
        if(String.isNotBlank(currentRequester.Confirmation__c)) {
            if(!ASRF_Requester__c.sObjectType.getDescribe().isAccessible()) {
                return ;
            }
            for(ASRF_Requester__c patientList  : [ Select Confirmation__c, First_Name__c,Last_Name__c ,Street_Address__c,Date_of_Birth__c, Patient_Date_of_Birth__c, Email__c, Primary_Phone__c,
                                                  City__c, State__c, ZIP__c from ASRF_Requester__c where Confirmation__c = :currentRequester.Confirmation__c and RecordType.Name = 'Patient' limit 1] ) {
                                                      Date compareDate;
                                                      if(currentRequester.Patient_Date_of_Birth__c!=null && patientDOBIE==null) {
                                                          compareDate = Date.ValueOf(currentRequester.Patient_Date_of_Birth__c);
                                                      } else {
                                                          compareDate = patientDOBIE;
                                                      }
                                                      if(compareDate != null && patientList.Patient_Date_of_Birth__c!=null && compareDate.format()==patientList.Patient_Date_of_Birth__c.format()) {
                                                          patientDetails = true;
                                                          patientError=false;
                                                          currentRequester.First_Name__c = patientList.First_Name__c;
                                                          currentRequester.Last_Name__c = patientList.Last_Name__c;
                                                          currentRequester.Patient_Date_of_Birth__c = patientList.Patient_Date_of_Birth__c;
                                                          currentRequester.Email__c = patientList.Email__c;
                                                          currentRequester.Primary_Phone__c = patientList.Primary_Phone__c;
                                                          currentRequester.Street_Address__c = patientList.Street_Address__c;
                                                          currentRequester.City__c = patientList.City__c;
                                                          currentRequester.State__c = patientList.State__c;
                                                          currentRequester.ZIP__c = patientList.ZIP__c;
                                                      } 
                                                  }
            
        }
    }
    
    /**
* This method is used when user changes dosage
*/  
    public void dosageChanged() {
        showFreeTrial = false;
        if(currentRequester.Dosage__c!=null) {
            freeTrialLengthVal = freeTrialLength.get(currentRequester.Dosage__c==null ? null : currentRequester.Dosage__c.escapeJava());
            showFreeTrial = availableForFreeTrial.get(currentRequester.Dosage__c==null ? null : currentRequester.Dosage__c.escapeJava());
            freeTrialcontent = freeTrialContentText.get(currentRequester.Dosage__c==null ? null : currentRequester.Dosage__c.escapeJava());
        }     
    }
    /**
* This method is used when user changes dosage of piqray
*/  
    public void piqrayDosageChanged() {
        showpiqrayFT = false;
        final List<String> dsgFT= new List<String>{'300 mg (Two 150 mg tablets) once daily','250 mg (One 200 mg tablet and one 50 mg tablet) once daily'};
            if(currentRequester.Dose_pack__c!=null) {
                for(String dsg: dsgFT) {
                    if(currentRequester.Dose_pack__c.equalsIgnoreCase(dsg)) {
                        showpiqrayFT=true;
                        break;
                    }
                }
            } 
    }
    /** 
* This method is used to load PDF data
*/
    
    public void loadPDFData() {
        currentId = apexpages.currentpage().getparameters().get('id');
        CurrentRecord=new ASRF_Requester__c();
        currentProduct = new ASRF_Product__c();
        currentProduct.Blank_Other_Brand_Custom_Form__c=true;
        if(String.isBlank(currentId) || !(ASRF_Product__c.sObjectType.getDescribe().isAccessible() && ASRF_Requester__c.sObjectType.getDescribe().isAccessible() 
                                          && attachment.sObjectType.getDescribe().isAccessible() && ASRF_Product_Dosing__c.sObjectType.getDescribe().isAccessible() )) {
                                              return;
                                          }
        for(ASRF_Requester__c requester:[select (select id from attachments where name='Signature.png' LIMIT 1),id,Confirmation__c,First_Name__c,Last_Name__c ,Street_Address__c, 
                                         Patient_Date_of_Birth__c,//Patient fields
                                         Email__c, Primary_Phone__c,City__c, State__c, ZIP__c, CreatedDate, //Patient fields
                                         //Insurance fields starts
                                         Prescription_Insurance_Name__c,Member_ID__c,RX_Group__c,RX_Bin__c,Dispense_Type__c, 
                                         Pharmacy_Service_Phone__c,Primary_Medical_Insurance_Name__c ,Primary_Policy_Holder_First_Name__c,Primary_Policy_Holder_Last_Name__c,
                                         Policy_Holder_Date_of_Birth__c,Policy_ID__c,Group_Number__c,Primary_Medical_Insurance_Phone__c,
                                         //Insurance fields ends
                                         //Physician fields starts
                                         Physician_First_Name__c,Physician_Last_Name__c,Practice_Institution_Name__c,Office_Contact_Name__c,
                                         Office_Contact_Number__c,Office_Fax_Number__c,Office_E_mail__c,Physician_Street_Address__c,
                                         Physician_City__c, Physician_State__c,Physician_Zip__c,Tax_ID_Number__c,NPI_Number__c,Medicaid_Provider_ID__c,
                                         //Physician fields ends
                                         Product__c,Dosage__c,How_many_capsules__c,How_many_time_per_day__c,Quantity__c,Days_Supplied__c,Current_Site_of_Care__c ,
                                         Other_Site_of_Care__c,
                                         Currently_Inpatient_moving_to_Outpatient__c,Projected_Rydapt_Start_Date__c,Projected_Start_Date__c,
                                         Refills_Authorized__c,Primary_Diagnosis__c,Secondary_Diagnosis__c,Is_patient_new_to_therapy__c,Is_patient_new_to_therapy2__c,
                                         Prior_Treatment__c,Prior_Treatment2__c,Free_Trial__c,Administer__c,
                                         Patient_Weight__c,Total_Daily_Dose__c ,Transfer_Prescription__c ,Preferred_Pharmacy__c ,Preferred_Pharmacy_City__c ,Preferred_Pharmacy_State__c ,
                                         Preferred_Pharmacy_Phone__c,Preferred_Pharmacy_Fax__c , Digital_Signature__c,
                                         Mobile_Administration_Program__c,Injection_Administered_At__c,How_Many_Visits__c,Visits_Start_Date__c,infusion_site_npi__c,Infusion_site_address__c,
                                         Infusion_site__c,Dose_pack__c,Other_Instructions__c, Physician_Not_Available__c,
                                         Dosage2__c,Days_Supplied2__c,How_Many_Capsules2__c,How_Many_Time_Per_Day2__c,Quantity2__c,Refills_Authorized2__c,Primary_Diagnosis2__c,
                                         Secondary_Diagnosis2__c,Patient_Does_Not_Have_Insurance__c
                                         from ASRF_Requester__c 
                                         where id =: currentId
                                         LIMIT 1]) {
                                             CurrentRecord = requester; 
                                             if(CurrentRecord.attachments!=null && CurrentRecord.attachments.size()==1) {
                                                 signatureId = CurrentRecord.attachments.get(0).id; //always get first attachment
                                             }
                                         }
        Final List<String> dosageLst;
        final Decimal dosage ;
        if(CurrentRecord.Dosage__c!=null) {
            dosageLst = CurrentRecord.Dosage__c.split(' ');
            if(!dosageLst.isempty()) {
                try {
                dosage= Decimal.valueOf(dosageLst[0]);
                } catch(TypeException te) {
                    System.debug('Known handled Exception for dosage '+te);
                }
            }
        }
        for(ASRF_Product__c product:[Select name__c ,Show_Dosage_Section__c,Show_Primary_Diagnosis_Section__c, Drug_Form__c, Show_Prior_Treatment_Section__c,
                                     (SELECT Free_Trial_Content_Text__c,Available_For_Free_Trial__c	 FROM ASRF_Product_Dosings__r where Dosage_Strength__c = :dosage ),
                                     Show_Patient_Weight_Section__c,Must_be_divisible_by__c,Blank_Other_Brand_Custom_Form__c, PIQRAY_Custom_Product__c,
                                     TAFINLAR_MEKINIST_Custom_Product__c, Show_Transfer_Prescription_Section__c, RYDAPT_Custom_Product__c,Sandostatin_Custom_Product__c,
                                     KISQALI_FEMARA_Custom_Product__c,KISQALI_Custom_Product__c,ADAKVEO_Custom_Product__c  from ASRF_Product__c
                                     where name__c=: CurrentRecord.Product__c
                                     LIMIT 1]) {
                                         currentProduct = product; 
                                         if(String.isNotBlank(currentProduct.Name__c) && (currentProduct.Name__c.contains('and') || currentProduct.Name__c.contains('/'))) {
                                             final List<String> pnmLst=currentProduct.Name__c.split('and|/');
                                             if(pnmLst.size()>=2) {
                                                 selProd1=pnmLst.get(0);
                                                 selProd2=pnmLst.get(1);
                                             }
                                         }
                                     }  
        for(ASRF_Product_Dosing__c dose : currentProduct.ASRF_Product_Dosings__r) {
            if (dose.Free_Trial_Content_Text__c != null) {
            currentDose = dose.Free_Trial_Content_Text__c.replaceAll('<[/a-zAZ0-9]*>',' ');
            }
            if (dose.Available_For_Free_Trial__c != null) {
            freeTrialCheck = dose.Available_For_Free_Trial__c;
            }
        }
    }
    
    /** 
* This method is used to load all dosages
*/
    public void loadAllDosages(List<ASRF_Product_Dosing__c> dosages) {
        final List<SelectOption> options = new List<SelectOption>();
        freeTrialLength = new Map<String, Decimal>();
        availableForFreeTrial = new Map<String, Boolean>();
        freeTrialContentText = new Map<String, string>();
        for(ASRF_Product_Dosing__c dose : dosages) {
            final String dosage;
            if(dose.Dosage_Strength__c != null ) { 
                dosage = dose.Dosage_Strength__c.stripTrailingZeros().toPlainString() +' '+dose.Dosage__c;
            } else {
                dosage = dose.Dosage__c;
            }
            options.add(new SelectOption(dosage, dosage));
            if(dose!=null && dose.id!=null && dose.Free_Trial_Length__c!=null) {   
                freeTrialLength.put(dosage, dose.Free_Trial_Length__c);
                availableForFreeTrial.put(dosage, dose.Available_For_Free_Trial__c);
                freeTrialContentText.put(dosage, dose.Free_Trial_Content_Text__c);
            }
        }
        allDosages = options;
        if(allDosages.size() == 1) {
            currentRequester.Dosage__c = allDosages[0].getValue();
            dosageChanged();
        }
    }
    
    
    /** 
* This method is used for a fake call
*/
    public PageReference fakeCall() {
        return null;
    }
    
    
    /** 
* This method is used to clear links
*/
    public void clearLinks() {
        link1Text = '';
        link1  = '';
        link2Text  = '';
        link2  = '';
        attachmentId = '';
    }
    
    /** 
* This method is used to clear prescription fields
*/
    public void clearPrescriptionFields() {
        final String nullStr = null; 
        final Decimal nullDec = null; 
        final Boolean nullbool = null; 
        final Date nullDate = null; 
        selectedProductObj = null;
        prescrptnNextBtn = true;
        currentRequester.Dosage__c = nullStr;
        currentRequester.Dose_pack__c = nullStr;
        currentRequester.Dosage2__c = nullStr;
        currentRequester.Primary_Diagnosis__c = nullStr;
        currentRequester.Primary_Diagnosis2__c = nullStr;
        currentRequester.How_many_capsules__c = nullStr;
        currentRequester.How_Many_Capsules2__c = nullStr;
        currentRequester.How_many_time_per_day__c = nullStr;
        currentRequester.How_Many_Time_Per_Day2__c = nullStr;
        currentRequester.Quantity__c = nullDec;
        currentRequester.Quantity2__c = nullDec;
        currentRequester.Days_Supplied__c = nullDec;
        currentRequester.Days_Supplied2__c = nullDec;
        currentRequester.Administer__c = nullDec;
        currentRequester.Other_Instructions__c = nullStr;
        currentRequester.Infusion_site__c = nullStr;
        currentRequester.Infusion_site_address__c = nullStr;
        currentRequester.infusion_site_npi__c = nullStr;
        currentRequester.Refills_Authorized__c = nullStr;
        currentRequester.Refills_Authorized2__c = nullStr;
        currentRequester.Secondary_Diagnosis__c = nullStr;
        currentRequester.Secondary_Diagnosis2__c = nullStr;
        currentRequester.Patient_Weight__c = nullDec;
        currentRequester.Total_Daily_Dose__c = nullStr;
        currentRequester.Is_patient_new_to_therapy__c = nullStr;
        currentRequester.Is_patient_new_to_therapy2__c = nullStr;
        currentRequester.Prior_Treatment__c = nullStr;
        currentRequester.Prior_Treatment2__c = nullStr;
        currentRequester.Transfer_Prescription__c = nullbool;
        currentRequester.No_Infusion_site_Information__c = nullbool;
        currentRequester.Preferred_Pharmacy__c = nullStr;
        currentRequester.Preferred_Pharmacy_Phone__c = nullStr;
        currentRequester.Preferred_Pharmacy_City__c = nullStr;
        currentRequester.Preferred_Pharmacy_State__c = nullStr;
        currentRequester.Preferred_Pharmacy_Fax__c = nullStr;
        currentRequester.Free_Trial__c = nullbool;
        otherBrandProductName = nullStr;
        currentRequester.Current_Site_of_Care__c = nullStr;
        currentRequester.Other_Site_of_Care__c = nullStr;
        currentRequester.Injection_Administered_At__c  = nullStr;
        currentRequester.Currently_Inpatient_moving_to_Outpatient__c = nullStr;
        currentRequester.Projected_Start_Date__c = nullDate;
        currentRequester.Projected_Rydapt_Start_Date__c = nullDate;
        currentRequester.Mobile_Administration_Program__c = nullStr;
        currentRequester.How_Many_Visits__c  = nullDec;
        currentRequester.Visits_Start_Date__c = nullDate;
        currentRequester.No_Infusion_Site_Information__c = nullBool;
        currentRequester.Infusion_Site__c = nullStr;
        currentRequester.Infusion_Site_Address__c = nullStr;
        currentRequester.Infusion_Site_npi__c = nullStr;
        currentRequester.Physician_Not_Available__c = nullBool;
    }
    
    /** 
* This method returns a list of products
*/
    public List<SelectOption> getItems() {
        final List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', 'Select Product'));
        for(ASRF_Product__c prd : allProducts) {
            options.add(new SelectOption(prd.id, prd.name__c));
        }
        return options;
    }
    
    /**
* This method returns a list of downloadable products
*/
    public List<SelectOption> getDownloadItems() {
        Final List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', 'Select Product'));
        for(ASRF_Product__c prd : allProductsWithDownload) {
            options.add(new SelectOption(prd.id, prd.name__c));
        }
        return options;
    }
    
    /** 
* This method is used to reload prescribing information
*/
    public void reloadPrescribingInformation() {
        clearLinks();
        clearPrescriptionFields();
        showFreeTrial = false;
        final List<ASRF_Product__c> allPrd = new List<ASRF_Product__c>();
        allPrd.addAll(allProducts);
        allPrd.addAll(allProductsWithDownload);
        for(ASRF_Product__c prd : allPrd) {
            if(prd.id == selectedProduct) {
                prescrptnNextBtn = false;
                currentRequester.Product__c = prd.Name__c;
                if(String.isNotBlank(prd.Name__c) && (prd.Name__c.contains('and') || prd.Name__c.contains('/'))) {
                    final List<String> pnmLst=prd.Name__c.split('and|/');
                    if(pnmLst.size()>=2) {
                        selProd1=pnmLst.get(0);
                        selProd2=pnmLst.get(1);
                    }
                }
                selectedProductObj = prd;
                loadAllDosages(prd.ASRF_Product_Dosings__r);
                link1Text = String.isEmpty(prd.Full_Prescribing_Information_1_Name__c) ? '' : prd.Full_Prescribing_Information_1_Name__c ;
                link1 = String.isEmpty(prd.Full_Prescribing_Information_1_Link__c) ? '' : prd.Full_Prescribing_Information_1_Link__c ;
                link2Text = String.isEmpty(prd.Full_Prescribing_Information_2_Name__c) ? '' : prd.Full_Prescribing_Information_2_Name__c ;
                link2 = String.isEmpty(prd.Full_Prescribing_Information_2_Link__c) ? '' : prd.Full_Prescribing_Information_2_Link__c ;
                try {
                    showPrescribingInformaton = true;
                    attachmentId = prd.attachments.get(0).id;
                } catch(Exception e) {
                    //NOTHING DO TO HERE - JUST TO CONTROL IF THE FILE EXIST
                    attachmentId = '';
                }
            }
        }
    }
    
    /**
* Load all content text managed on the ASRF_Content_Text__c object
*/
    public void loadContentText() {
        final ASRF_Utils util = new ASRF_Utils();
        contentText = util.loadContentText();
    }
    
    /**
* Rendering Print and fax form element
*/
    public PageReference loadPrintAndFax() {
        showPrintAndFax = true;
        return null;
    }
    
    /** 
* This method is used to insert next HCP form
*/
    public PageReference nextInsertHCPForm() {
        final ASRF_Requester__c requester = new ASRF_Requester__c();
        //Patient info starts
        requester.First_Name__c = currentRequester.First_Name__c==null?null:currentRequester.First_Name__c.escapeJava();
        requester.Last_Name__c = currentRequester.Last_Name__c==null?null:currentRequester.Last_Name__c.escapeJava();
        requester.Patient_Date_of_Birth__c = currentRequester.Patient_Date_of_Birth__c==null?null:Date.valueOf(currentRequester.Patient_Date_of_Birth__c);
        requester.Email__c = currentRequester.Email__c==null?null:currentRequester.Email__c.escapeJava();
        requester.Primary_Phone__c = currentRequester.Primary_Phone__c==null?null:currentRequester.Primary_Phone__c.escapeJava();
        requester.Street_Address__c = currentRequester.Street_Address__c==null?null:currentRequester.Street_Address__c.escapeJava();
        requester.City__c = currentRequester.City__c==null?null:currentRequester.City__c.escapeJava();
        requester.State__c = currentRequester.State__c==null?null:currentRequester.State__c.escapeJava();
        requester.ZIP__c = currentRequester.ZIP__c==null?null:currentRequester.ZIP__c.escapeJava();
        requester.IP_Address__c        = ipAddress==null?null:ipAddress.escapeJava();
        //Patient info ends
        //Insurance info starts
        requester.Patient_Does_Not_Have_Insurance__c = currentRequester.Patient_Does_Not_Have_Insurance__c==null?false:Boolean.valueOf(currentRequester.Patient_Does_Not_Have_Insurance__c);//conditional check for below Infomation
        if(!requester.Patient_Does_Not_Have_Insurance__c) {
            requester.Primary_Medical_Insurance_Name__c = currentRequester.Primary_Medical_Insurance_Name__c==null?null:currentRequester.Primary_Medical_Insurance_Name__c.escapeJava();
            requester.Primary_Medical_Insurance_Phone__c = currentRequester.Primary_Medical_Insurance_Phone__c==null?null:currentRequester.Primary_Medical_Insurance_Phone__c.escapeJava();
            requester.Policy_Holder_Date_of_Birth__c = currentRequester.Policy_Holder_Date_of_Birth__c==null?null:Date.valueOf(currentRequester.Policy_Holder_Date_of_Birth__c);
            requester.Policy_ID__c = currentRequester.Policy_ID__c==null?null:currentRequester.Policy_ID__c.escapeJava();
            requester.Group_Number__c = currentRequester.Group_Number__c==null?null:currentRequester.Group_Number__c.escapeJava();
            requester.Primary_Policy_Holder_First_Name__c = currentRequester.Primary_Policy_Holder_First_Name__c==null?null:currentRequester.Primary_Policy_Holder_First_Name__c.escapeJava();
            requester.Primary_Policy_Holder_Last_Name__c = currentRequester.Primary_Policy_Holder_Last_Name__c==null?null:currentRequester.Primary_Policy_Holder_Last_Name__c.escapeJava();
            requester.Prescription_Insurance_Name__c = currentRequester.Prescription_Insurance_Name__c==null?null:currentRequester.Prescription_Insurance_Name__c.escapeJava();
            requester.Member_ID__c = currentRequester.Member_ID__c==null?null:currentRequester.Member_ID__c.escapeJava();
            requester.RX_Group__c = currentRequester.RX_Group__c==null?null:currentRequester.RX_Group__c.escapeJava();
            requester.RX_Bin__c = currentRequester.RX_Bin__c==null?null:currentRequester.RX_Bin__c.escapeJava();
            requester.Pharmacy_Service_Phone__c = currentRequester.Pharmacy_Service_Phone__c==null?null:currentRequester.Pharmacy_Service_Phone__c.escapeJava();
        }
        //Insurance info ends
        //Physician Info Starts
        requester.Physician_First_Name__c = currentRequester.Physician_First_Name__c==null?null:currentRequester.Physician_First_Name__c.escapeJava();
        requester.Physician_Last_Name__c = currentRequester.Physician_Last_Name__c==null?null:currentRequester.Physician_Last_Name__c.escapeJava();
        requester.Practice_Institution_Name__c = currentRequester.Practice_Institution_Name__c==null?null:currentRequester.Practice_Institution_Name__c.escapeJava();
        requester.Physician_Street_Address__c = currentRequester.Physician_Street_Address__c==null?null:currentRequester.Physician_Street_Address__c.escapeJava();
        requester.Physician_City__c = currentRequester.Physician_City__c==null?null:currentRequester.Physician_City__c.escapeJava();
        requester.Physician_State__c = currentRequester.Physician_State__c==null?null:currentRequester.Physician_State__c.escapeJava();
        requester.Physician_Zip__c = currentRequester.Physician_Zip__c==null?null:currentRequester.Physician_Zip__c.escapeJava();
        requester.Office_Contact_Name__c = currentRequester.Office_Contact_Name__c==null?null:currentRequester.Office_Contact_Name__c.escapeJava();
        requester.Office_Contact_Number__c = currentRequester.Office_Contact_Number__c==null?null:currentRequester.Office_Contact_Number__c.escapeJava();
        requester.Office_Fax_Number__c = currentRequester.Office_Fax_Number__c==null?null:currentRequester.Office_Fax_Number__c.escapeJava();
        requester.Office_E_mail__c = currentRequester.Office_E_mail__c==null?null:currentRequester.Office_E_mail__c.escapeJava();
        requester.NPI_Number__c = currentRequester.NPI_Number__c==null?null:currentRequester.NPI_Number__c.escapeJava();
        requester.Tax_ID_Number__c = currentRequester.Tax_ID_Number__c==null?null:currentRequester.Tax_ID_Number__c.escapeJava();
        requester.Medicaid_Provider_ID__c = currentRequester.Medicaid_Provider_ID__c==null?null:currentRequester.Medicaid_Provider_ID__c.escapeJava();
        //Physician Info ends
        //Prescription info Starts
        if(currentRequester.Product__c == 'Other Brand') {
            requester.Product__c = otherBrandProductName;
        } else {
            requester.Product__c = currentRequester.Product__c==null?null:String.valueOf(currentRequester.Product__c.escapeCsv());
        }
        requester.Dosage__c = currentRequester.Dosage__c==null?null:currentRequester.Dosage__c.escapeJava();
        requester.How_many_capsules__c = currentRequester.How_many_capsules__c==null?null:currentRequester.How_many_capsules__c.escapeJava();
        requester.How_many_time_per_day__c = currentRequester.How_many_time_per_day__c==null?null:currentRequester.How_many_time_per_day__c.escapeJava();
        requester.Quantity__c = currentRequester.Quantity__c==null?null:Integer.valueOf(currentRequester.Quantity__c);
        requester.Days_Supplied__c = currentRequester.Days_Supplied__c==null?null:Integer.valueOf(currentRequester.Days_Supplied__c);
        requester.Refills_Authorized__c = currentRequester.Refills_Authorized__c==null?null:currentRequester.Refills_Authorized__c.escapeJava();
        requester.Primary_Diagnosis__c = currentRequester.Primary_Diagnosis__c==null?null:currentRequester.Primary_Diagnosis__c.escapeJava();
        requester.Secondary_Diagnosis__c = currentRequester.Secondary_Diagnosis__c==null?null:currentRequester.Secondary_Diagnosis__c.escapeJava(); 
        requester.Other_Instructions__c = currentRequester.Other_Instructions__c==null?null:currentRequester.Other_Instructions__c.escapeJava();
        requester.Dose_pack__c = currentRequester.Dose_pack__c==null?null:currentRequester.Dose_pack__c.escapeJava();
        if(String.isNotBlank(requester.Product__c) && requester.Product__c.containsIgnoreCase('TAFINLAR') && requester.Product__c.containsIgnoreCase('MEKINIST')) { 
            requester.Dosage2__c = currentRequester.Dosage2__c==null?null:currentRequester.Dosage2__c.escapeJava();
            requester.How_many_capsules2__c = currentRequester.How_many_capsules2__c==null?null:currentRequester.How_many_capsules2__c.escapeJava();
            requester.How_many_time_per_day2__c = currentRequester.How_many_time_per_day2__c==null?null:currentRequester.How_many_time_per_day2__c.escapeJava();
            requester.Quantity2__c = currentRequester.Quantity2__c==null?null:Integer.valueOf(currentRequester.Quantity2__c);
            requester.Days_Supplied2__c = currentRequester.Days_Supplied2__c==null?null:Integer.valueOf(currentRequester.Days_Supplied2__c);
            requester.Refills_Authorized2__c = currentRequester.Refills_Authorized2__c==null?null:currentRequester.Refills_Authorized2__c.escapeJava();
            requester.Primary_Diagnosis2__c = currentRequester.Primary_Diagnosis2__c==null?null:currentRequester.Primary_Diagnosis2__c.escapeJava();
            requester.Secondary_Diagnosis2__c = currentRequester.Secondary_Diagnosis2__c==null?null:currentRequester.Secondary_Diagnosis__c.escapeJava(); 
        }
        requester.Current_Site_of_Care__c = currentRequester.Current_Site_of_Care__c==null?null:currentRequester.Current_Site_of_Care__c.escapeJava();
        requester.Other_Site_of_Care__c = currentRequester.Other_Site_of_Care__c==null?null:currentRequester.Other_Site_of_Care__c.escapeJava();
        
        
        if(currentRequester.Injection_Administered_At__c == injAdmOther) {
            currentRequester.Injection_Administered_At__c = injctnAdmn;
            requester.Injection_Administered_At__c = currentRequester.Injection_Administered_At__c==null?null:currentRequester.Injection_Administered_At__c.escapeJava();
        } else {
            requester.Injection_Administered_At__c = currentRequester.Injection_Administered_At__c==null?null:currentRequester.Injection_Administered_At__c.escapeJava();
        }
        requester.Currently_Inpatient_moving_to_Outpatient__c = currentRequester.Currently_Inpatient_moving_to_Outpatient__c==null?null:currentRequester.Currently_Inpatient_moving_to_Outpatient__c.escapeJava();
        requester.Projected_Start_Date__c = currentRequester.Projected_Start_Date__c==null?null:Date.valueOf(currentRequester.Projected_Start_Date__c);
        requester.Projected_Rydapt_Start_Date__c = currentRequester.Projected_Rydapt_Start_Date__c==null?null:Date.valueOf(currentRequester.Projected_Rydapt_Start_Date__c);
        requester.Transfer_Prescription__c = Boolean.valueOf(currentRequester.Transfer_Prescription__c);
        requester.Preferred_Pharmacy__c = currentRequester.Preferred_Pharmacy__c==null?null:currentRequester.Preferred_Pharmacy__c.escapeJava();
        requester.Preferred_Pharmacy_Phone__c = currentRequester.Preferred_Pharmacy_Phone__c==null?null:currentRequester.Preferred_Pharmacy_Phone__c.escapeJava();
        requester.Preferred_Pharmacy_City__c = currentRequester.Preferred_Pharmacy_City__c==null?null:currentRequester.Preferred_Pharmacy_City__c.escapeJava();
        requester.Preferred_Pharmacy_State__c = currentRequester.Preferred_Pharmacy_State__c==null?null:currentRequester.Preferred_Pharmacy_State__c.escapeJava();
        requester.Preferred_Pharmacy_Fax__c = currentRequester.Preferred_Pharmacy_Fax__c==null?null:currentRequester.Preferred_Pharmacy_Fax__c.escapeJava();
        requester.Is_patient_new_to_therapy__c = currentRequester.Is_patient_new_to_therapy__c==null?null:currentRequester.Is_patient_new_to_therapy__c.escapeJava();
        requester.Is_patient_new_to_therapy2__c = currentRequester.Is_patient_new_to_therapy2__c==null?null:currentRequester.Is_patient_new_to_therapy2__c.escapeJava();
        requester.Prior_Treatment__c = currentRequester.Prior_Treatment__c==null?null:currentRequester.Prior_Treatment__c.escapeJava();   
        requester.Prior_Treatment2__c = currentRequester.Prior_Treatment2__c==null?null:currentRequester.Prior_Treatment2__c.escapeJava();       
        requester.Patient_Weight__c = currentRequester.Patient_Weight__c==null?null:Integer.valueOf(currentRequester.Patient_Weight__c);
        requester.Total_Daily_Dose__c  = currentRequester.Total_Daily_Dose__c==null?null:currentRequester.Total_Daily_Dose__c.escapeJava();
        requester.Mobile_Administration_Program__c  = currentRequester.Mobile_Administration_Program__c==null?null:currentRequester.Mobile_Administration_Program__c.escapeJava();
        requester.How_Many_Visits__c   = currentRequester.How_Many_Visits__c ==null?null:Integer.valueOf(currentRequester.How_Many_Visits__c);
        requester.Visits_Start_Date__c   = currentRequester.Visits_Start_Date__c ==null?null:Date.valueOf(currentRequester.Visits_Start_Date__c);
        requester.Free_Trial__c = Boolean.valueOf(currentRequester.Free_Trial__c);
        requester.Administer__c  = currentRequester.Administer__c==null?null:Integer.valueOf(currentRequester.Administer__c);
        
        if(String.isNotBlank(requester.Product__c) && requester.Product__c.containsIgnoreCase('ADAKVEO')) {
            requester.No_Infusion_Site_Information__c = Boolean.valueOf(currentRequester.No_Infusion_Site_Information__c);
            requester.Infusion_Site__c  = currentRequester.Infusion_Site__c==null?null:currentRequester.Infusion_Site__c.escapeJava();
            requester.Infusion_Site_Address__c  = currentRequester.Infusion_Site_Address__c==null?null:currentRequester.Infusion_Site_Address__c.escapeJava();
            requester.Infusion_Site_npi__c  = currentRequester.Infusion_Site_npi__c==null?null:currentRequester.Infusion_Site_npi__c.escapeJava();
            requester.Dosage__c  = adakveoDose==null?null:adakveoDose.escapeJava();
            
        }
        //prescription Info Ends
        requester.Confirmation__c = currentRequester.Confirmation__c==null?null:currentRequester.Confirmation__c.escapeJava();
        if(currentRequester.Physician_Not_Available__c) {
            requester.Physician_Not_Available__c = Boolean.valueOf(currentRequester.Physician_Not_Available__c);
        } else {
            requester.Digital_Signature__c = currentRequester.Digital_Signature__c==null?null:currentRequester.Digital_Signature__c.escapeJava();
            requester.Dispense_Type__c = currentRequester.Dispense_Type__c==null?null:currentRequester.Dispense_Type__c.escapeJava();
        }
        
        requester.Status__c = 'In Progress';
        final Id recordTypeId = Schema.SObjectType.ASRF_Requester__c.getRecordTypeInfosByName().get('HCP').getRecordTypeId();
        requester.RecordTypeId = recordTypeId;
        
        if(ASRF_Requester__c.sObjectType.getDescribe().isCreateable()) {
            try {
                insert requester;
                if(requester.Id!=null && requester.Digital_Signature__c!=null && Attachment.sObjectType.getDescribe().isCreateable()) {
                    final Attachment att = new Attachment();
                    att.ParentId = requester.Id;
                    att.Body = EncodingUtil.base64Decode(requester.Digital_Signature__c.split(',')[1]);
                    att.ContentType = 'image/png';
                    att.Name = 'Signature.png';
                    Database.insert(att);
                }
            } catch(DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
        currentId = requester.Id;
        
        return null;
    }
    
    
    /** 
* This method show hide other field in sustom product
*/
    
    public void hideField() {
        if(currentRequester.Injection_Administered_At__c == injAdmOther || currentRequester.Current_Site_of_Care__c == 'Other' ) {
            enableField = false;
        } else {
            enableField = true;
        }
        
    }
    /** 
* This method returns a returns a reference to the Patient form
*/
    public PageReference patientFormRedirect() {
        return new PageReference('/autosrf/ASRF_PatientForm');
    }
        /** 
* This method returns a returns a reference to the HCP form
*/
    public PageReference hcpFormRedirect() {
        return new PageReference('/autosrf/ASRF_HCPForm');
    }
    
    /** 
* This method is used to create an attachment
*/
    public void createAttachment() {
        final List<Attachment> deleteAttachments = new List<Attachment>();
        try {
            if(!hasFile && currentRequester!=null && pdfAttachmentId==null && String.isNotBlank(currentId) && attachment.sObjectType.getDescribe().isCreateable()) { 
                final String cId=String.valueOf(currentId.escapeCsv());
                final PageReference page = new PageReference('/ASRF_HCPPdfPage?isPDF=true&id='+cId);
                final Attachment att = new Attachment();
                if(!Test.isRunningTest()) {
                    att.Body = page.getContentAsPDF();
                } else {
                    att.Body = blob.valueOf('Unit.Test');  
                }
                att.ContentType ='pdf/PDF';
                att.Name = DateTime.now().getTime()+'.pdf';
                att.ParentId = cId;
                final Database.SaveResult saveResult = Database.insert(att);
                if(saveResult.isSuccess() && ASRF_Requester__c.sObjectType.getDescribe().isUpdateable()) {
                    hasFile = true;
                    pdfAttachmentId = att.id;
                    final ASRF_Requester__c requester = new ASRF_Requester__c();
                    requester.Status__c = 'Submitted';
                    requester.Id = cId;
                    requester.Submission_date_timestamp__c = System.now();
                    for(Attachment attDelete : [select id, Name, ContentType from Attachment Where ParentId=: currentId]) {
                        if(attDelete.Name == 'Signature.png' ) {
                            deleteAttachments.add(attDelete);
                        }
                    }
                    if(ASRF_Requester__c.sObjectType.getDescribe().isAccessible() && attachment.sObjectType.getDescribe().isDeletable() ) {
                        Delete deleteAttachments;  
                    }                             
                    update requester;
                }   
            } 
        } catch(DmlException e) {
            hasFile = false;
        }
        
    }   
}