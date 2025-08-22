/*
    Copyright (c) 2021, Salesforce.org
    All rights reserved.
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this List of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this List of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2021
 * @group
 * @group-content ../../ApexDocContent/Tests.htm
 * @description Test class for AutoEnrollmentMappingsVMapper class.
 */
@isTest
private with sharing class AutoEnrollmentMappingsVMapper_TEST {
    /**************************************************************************************************
     * @description Test method to verify that the getInstance method returns a new instance of the
     * AutoEnrollmentMappingsVMapper class when one does not already exist.
     **************************************************************************************************/
    @isTest
    private static void getInstanceNew() {
        Test.startTest();
        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();
        Test.stopTest();

        System.assertEquals(
            AutoEnrollmentMappingsVMapper.instance,
            autoEnrollmentMappingsVMapperInstance,
            'Instance of mapper class returned should match static instance variable.'
        );
        System.assertEquals(
            true,
            autoEnrollmentMappingsVMapperInstance != null,
            'Instance of mapper class should not be null.'
        );
    }

    /**************************************************************************************************
     * @description Test method to verify that the getInstance method returns the existing instance of the
     * AutoEnrollmentMappingsVMapper class when one already exists.
     **************************************************************************************************/
    @isTest
    private static void getInstanceExisting() {
        Test.startTest();
        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance1 = AutoEnrollmentMappingsVMapper.getInstance();
        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance2 = AutoEnrollmentMappingsVMapper.getInstance();
        Test.stopTest();

        System.assertEquals(
            AutoEnrollmentMappingsVMapper.instance,
            autoEnrollmentMappingsVMapperInstance1,
            'Instance of mapper class returned should match static instance variable.'
        );
        System.assertEquals(
            autoEnrollmentMappingsVMapperInstance1,
            autoEnrollmentMappingsVMapperInstance2,
            'Subsequent retrievals of mapper class instance should return existing instance.'
        );
        System.assertEquals(
            true,
            autoEnrollmentMappingsVMapperInstance1 != null,
            'Instance of mapper class should not be null.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify locateRecordTypeService() returns an instance of
     * the RecordTypeService class.
     ****************************************************************************************/
    @isTest
    private static void locateRecordTypeServiceValid() {
        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        RecordTypeService recordTypeServiceInstance = autoEnrollmentMappingsVMapperInstance.locateRecordTypeService();
        Test.stopTest();

        System.assertEquals(
            RecordTypeService.getInstance(),
            recordTypeServiceInstance,
            'Should return instance of RecordTypeService class.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify locateAffiliationMappingsService() returns an instance of
     * the AffiliationMappingsService class.
     ****************************************************************************************/
    @isTest
    private static void locateAffiliationMappingsServiceValid() {
        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AffiliationMappingsService affiliationMappingsServiceInstance = autoEnrollmentMappingsVMapperInstance.locateAffiliationMappingsService();
        Test.stopTest();

        System.assertEquals(
            AffiliationMappingsService.getInstance(),
            affiliationMappingsServiceInstance,
            'Should return instance of AffiliationMappingsService class.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify locatePicklistEntryService() returns an instance of
     * the PicklistEntryService class.
     ****************************************************************************************/
    @isTest
    private static void locatePicklistEntryServiceValid() {
        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        PicklistEntryService picklistEntryServiceInstance = autoEnrollmentMappingsVMapperInstance.locatePicklistEntryService();
        Test.stopTest();

        System.assertEquals(
            PicklistEntryService.getInstance(),
            picklistEntryServiceInstance,
            'Should return instance of PicklistEntryService class.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingVModel()
     * returns an instance of AutoEnrollmentMappingVModel with account record type
     * corresponding to the matching model properties when matching models exists.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingVModelValid() {
        RecordTypeService.instance = new STUB_RecordTypeServiceValid();

        AffiliationMappingsModel affiliationMappingsModel = new AffiliationMappingsModel(
            'Affliation Name',
            'Account Record Type',
            'Primary Affiliation Field',
            true,
            'autoProgramEnrollmentStatus',
            'autoProgramEnrollmentRole'
        );
        Map<String, RecordTypeModel> accountRecordTypeModelsByName = new Map<String, RecordTypeModel>{
            'Account_Record_Type' => new RecordTypeModel(
                '000000000000000009',
                'Account Record Type',
                'Account_Record_Type',
                true
            )
        };

        Map<String, RecordTypeModel> accountRecordTypeModelsByLabel = new Map<String, RecordTypeModel>{
            'Account Record Type' => new RecordTypeModel(
                '000000000000000009',
                'Account Record Type',
                'Account_Record_Type',
                true
            )
        };

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AutoEnrollmentMappingVModel autoEnrollmentMappingVModel = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingVModel(
            affiliationMappingsModel,
            accountRecordTypeModelsByName,
            accountRecordTypeModelsByLabel
        );
        Test.stopTest();

        System.assertEquals(
            'Affliation Name',
            autoEnrollmentMappingVModel.mappingName,
            'Mapping name should be Affliation Name.'
        );

        System.assertEquals(
            'Account_Record_Type',
            autoEnrollmentMappingVModel.accountRecordTypeName,
            'Account Record Type name should match developer name of Record Type model corresponding to record type specified for the affiliation mapping.'
        );

        System.assertEquals(
            'Account Record Type',
            autoEnrollmentMappingVModel.accountRecordTypeLabel,
            'Account Record Type label should match label of Record Type model corresponding to record type specified for the affiliation mapping.'
        );

        System.assertEquals(
            'autoProgramEnrollmentStatus',
            autoEnrollmentMappingVModel.autoProgramEnrollmentStatus,
            'Auto enrollment status should match the auto enrollment status of the affiliation mapping.'
        );

        System.assertEquals(
            'autoProgramEnrollmentRole',
            autoEnrollmentMappingVModel.autoProgramEnrollmentRole,
            'Auto enrollment role should match the auto enrollment role of the affiliation mapping.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingVModel()
     * returns an instance of AutoEnrollmentMappingVModel with valid values
     * when auto enrollment status and role are empty
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingVModelEmpty() {
        RecordTypeService.instance = new STUB_RecordTypeServiceValid();

        AffiliationMappingsModel affiliationMappingsModel = new AffiliationMappingsModel(
            'Affliation Name',
            'Account Record Type',
            'Primary Affiliation Field',
            true,
            '',
            ''
        );
        Map<String, RecordTypeModel> accountRecordTypeModelsByName = new Map<String, RecordTypeModel>{
            'Account_Record_Type' => new RecordTypeModel(
                '000000000000000009',
                'Account Record Type',
                'Account_Record_Type',
                true
            )
        };

        Map<String, RecordTypeModel> accountRecordTypeModelsByLabel = new Map<String, RecordTypeModel>{
            'Account Record Type' => new RecordTypeModel(
                '000000000000000009',
                'Account Record Type',
                'Account_Record_Type',
                true
            )
        };

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AutoEnrollmentMappingVModel autoEnrollmentMappingVModel = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingVModel(
            affiliationMappingsModel,
            accountRecordTypeModelsByName,
            accountRecordTypeModelsByLabel
        );
        Test.stopTest();

        System.assertEquals(
            'Affliation Name',
            autoEnrollmentMappingVModel.mappingName,
            'Mapping name should be Affliation Name.'
        );

        System.assertEquals(
            'Account_Record_Type',
            autoEnrollmentMappingVModel.accountRecordTypeName,
            'Account Record Type name should match developer name of Record Type model corresponding to record type specified for the affiliation mapping.'
        );

        System.assertEquals(
            'Account Record Type',
            autoEnrollmentMappingVModel.accountRecordTypeLabel,
            'Account Record Type label should match label of Record Type model corresponding to record type specified for the affiliation mapping.'
        );

        System.assertEquals(
            '',
            autoEnrollmentMappingVModel.autoProgramEnrollmentStatus,
            'Auto enrollment status should be empty.'
        );

        System.assertEquals(
            '',
            autoEnrollmentMappingVModel.autoProgramEnrollmentRole,
            'Auto enrollment role should be empty.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingVModel()
     * returns a AutoEnrollmentMappingVModel with account record type and lookup field names
     * and labels corresponding to the properties specified for the affiliation mapping
     * when matching models do not exist.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingVModelInValidRecordType() {
        RecordTypeService.instance = new STUB_RecordTypeServiceInvalid();

        AffiliationMappingsModel affiliationMappingsModel = new AffiliationMappingsModel(
            'Affliation Name',
            'Invalid Account Record Type',
            'Invalid Primary Affiliation Field',
            false,
            'autoProgramEnrollmentStatus',
            'autoProgramEnrollmentRole'
        );

        Map<String, RecordTypeModel> accountRecordTypeModelsByName = new Map<String, RecordTypeModel>{
            'Account_Record_Type' => new RecordTypeModel(
                '000000000000000009',
                'Account Record Type',
                'Account_Record_Type',
                true
            )
        };

        Map<String, RecordTypeModel> accountRecordTypeModelsByLabel = new Map<String, RecordTypeModel>{
            'Account Record Type' => new RecordTypeModel(
                '000000000000000009',
                'Account Record Type',
                'Account_Record_Type',
                true
            )
        };

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AutoEnrollmentMappingVModel autoEnrollmentMappingVModel = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingVModel(
            affiliationMappingsModel,
            accountRecordTypeModelsByName,
            accountRecordTypeModelsByLabel
        );
        Test.stopTest();

        System.assertEquals(
            'Affliation Name',
            autoEnrollmentMappingVModel.mappingName,
            'Mapping name should be Affliation Name.'
        );

        System.assertEquals(
            'Invalid Account Record Type',
            autoEnrollmentMappingVModel.accountRecordTypeName,
            'Account Record Type name should match value specified for the affiliation mapping.'
        );

        System.assertEquals(
            'Invalid Account Record Type',
            autoEnrollmentMappingVModel.accountRecordTypeLabel,
            'Account Record Type label should match value specified for the affiliation mapping.'
        );

        System.assertEquals(
            'autoProgramEnrollmentStatus',
            autoEnrollmentMappingVModel.autoProgramEnrollmentStatus,
            'Auto enrollment status should match the auto enrollment status of the affiliation mapping.'
        );

        System.assertEquals(
            'autoProgramEnrollmentRole',
            autoEnrollmentMappingVModel.autoProgramEnrollmentRole,
            'Auto enrollment role should match the auto enrollment role of the affiliation mapping.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingsVModel()
     * returns a AutoEnrollmentMappingsVModel with proper values
     * when active auto enrollment exists.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingsVModelActiveAutoEnrollmentExists() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsService();
        RecordTypeService.instance = new STUB_RecordTypeService();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AutoEnrollmentMappingsVModel autoEnrollmentMappingsVModel = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingsVModel();
        Test.stopTest();

        System.assertEquals(
            2,
            autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels.size(),
            'Should return 2 autoEnrollmentMappingVModels.'
        );

        for (Integer i = 0; i < autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels.size(); i++) {
            System.assertEquals(
                'Record_Type_' + (i + 1),
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].accountRecordTypeName,
                'Account record type name should match developer name of corresponding record type model.'
            );

            System.assertEquals(
                'Record Type ' + (i + 1),
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].accountRecordTypeLabel,
                'Account record type label should match label of corresponding record type model.'
            );

            System.assertEquals(
                'autoProgramEnrollmentStatus' + (i + 1),
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].autoProgramEnrollmentStatus,
                'Auto-Enrollment status should match.'
            );

            System.assertEquals(
                'autoProgramEnrollmentRole' + (i + 1),
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].autoProgramEnrollmentRole,
                'Auto-Enrollment role should match.'
            );
        }
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingsVModel()
     * returns a AutoEnrollmentMappingsVModel with proper values
     * when active auto enrollment exists but empty.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingsVModelActiveAutoEnrollmentEmpty() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsServiceEmptyAutoEnrollment();
        RecordTypeService.instance = new STUB_RecordTypeService();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AutoEnrollmentMappingsVModel autoEnrollmentMappingsVModel = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingsVModel();
        Test.stopTest();

        System.assertEquals(
            2,
            autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels.size(),
            'Should return 2 autoEnrollmentMappingVModels.'
        );

        for (Integer i = 0; i < autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels.size(); i++) {
            System.assertEquals(
                'Record_Type_' + (i + 1),
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].accountRecordTypeName,
                'Account record type name should match developer name of corresponding record type model.'
            );

            System.assertEquals(
                'Record Type ' + (i + 1),
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].accountRecordTypeLabel,
                'Account record type label should match label of corresponding record type model.'
            );

            System.assertEquals(
                '',
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].autoProgramEnrollmentStatus,
                'Auto-Enrollment status should be empty.'
            );

            System.assertEquals(
                '',
                autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels[i].autoProgramEnrollmentRole,
                'Auto-Enrollment role should be empty.'
            );
        }
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingsVModel()
     * returns a AutoEnrollmentMappingsVModel with proper values
     * when no active auto enrollment exists.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingsVModelActiveAutoEnrollmentNotExists() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsServiceInactiveAutoEnrollment();
        RecordTypeService.instance = new STUB_RecordTypeService();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        AutoEnrollmentMappingsVModel autoEnrollmentMappingsVModel = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingsVModel();
        Test.stopTest();

        System.assertEquals(
            0,
            autoEnrollmentMappingsVModel.autoEnrollmentMappingVModels.size(),
            'Should return 0 autoEnrollmentMappingVModels.'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingsVModel()
     * returns a AutoEnrollmentMappingsVModel with proper values when active auto enrollment exists.
     ****************************************************************************************/
    @isTest
    private static void unmappedRecordTypesExist() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsServiceInactiveAutoEnrollment();
        RecordTypeService.instance = new STUB_RecordTypeService();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        Boolean unmappedRecordTypesExistValue = autoEnrollmentMappingsVMapperInstance.unmappedRecordTypesExist();
        Test.stopTest();

        System.assertEquals(true, unmappedRecordTypesExistValue, 'Unmapped record types should exist');
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingsVModel()
     * returns a AutoEnrollmentMappingsVModel with proper values when no active auto enrollment exists.
     ****************************************************************************************/
    @isTest
    private static void unmappedRecordTypesExistFalse() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsService();
        RecordTypeService.instance = new STUB_RecordTypeService();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        Boolean unmappedRecordTypesExistValue = autoEnrollmentMappingsVMapperInstance.unmappedRecordTypesExist();
        Test.stopTest();

        System.assertEquals(false, unmappedRecordTypesExistValue, 'No unmapped record types should exist');
    }

    /****************************************************************************************
     * @description Test method to verify getAccountRecordTypeComboboxVModel()
     * returns a ComboBoxVModel with proper values
     * when no record type except the current one is mapped to active auto enrollment.
     ****************************************************************************************/
    @isTest
    private static void getAccountRecordTypeComboboxVModelUnmapped() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsServiceMixAutoEnrollment();
        RecordTypeService.instance = new STUB_RecordTypeServiceAccountRecordTypeCombobox(false);

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel accountRecordTypeComboboxVModel = autoEnrollmentMappingsVMapperInstance.getAccountRecordTypeComboboxVModel(
            'Record_Type_1'
        );
        Test.stopTest();

        System.assertEquals(
            'Record_Type_1',
            accountRecordTypeComboboxVModel.value,
            'The size of comboboxVModelOptionsForActiveAccountRecordTypes should be 2'
        );
        System.assertEquals(
            2,
            accountRecordTypeComboboxVModel.options.size(),
            'The size of accountRecordTypeComboboxVModel.options should be 2'
        );
        System.assertEquals(
            'Record Type 1',
            accountRecordTypeComboboxVModel.options[0].label,
            'The label of accountRecordTypeComboboxVModel.options[0] should be Record Type 1'
        );
        System.assertEquals(
            'Record_Type_1',
            accountRecordTypeComboboxVModel.options[0].value,
            'The value of accountRecordTypeComboboxVModel.options[0] should be Record_Type_1'
        );
        System.assertEquals(
            'Record Type 2',
            accountRecordTypeComboboxVModel.options[1].label,
            'The label of accountRecordTypeComboboxVModel.options[1] should be Record Type 2'
        );
        System.assertEquals(
            'Record_Type_2',
            accountRecordTypeComboboxVModel.options[1].value,
            'The value of accountRecordTypeComboboxVModel.options[1] should be Record_Type_2'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAccountRecordTypeComboboxVModel()
     * returns a ComboBoxVModel with proper values when the account record type is empty
     ****************************************************************************************/
    @isTest
    private static void getAccountRecordTypeComboboxVModelEmpty() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsServiceMixAutoEnrollment();
        RecordTypeService.instance = new STUB_RecordTypeServiceAccountRecordTypeCombobox(false);

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel accountRecordTypeComboboxVModel = autoEnrollmentMappingsVMapperInstance.getAccountRecordTypeComboboxVModel(
            null
        );
        Test.stopTest();

        System.assertEquals(null, accountRecordTypeComboboxVModel.value, 'The account record type should be null');
        System.assertEquals(
            1,
            accountRecordTypeComboboxVModel.options.size(),
            'The size of accountRecordTypeComboboxVModel.options should be 1'
        );
        System.assertEquals(
            'Record Type 2',
            accountRecordTypeComboboxVModel.options[0].label,
            'The label of accountRecordTypeComboboxVModel.options[0] should be Record Type 2'
        );
        System.assertEquals(
            'Record_Type_2',
            accountRecordTypeComboboxVModel.options[0].value,
            'The value of accountRecordTypeComboboxVModel.options[0] should be Record_Type_2'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAccountRecordTypeComboboxVModel()
     * returns a ComboBoxVModel with proper values
     * when all record types are mapped to active auto enrollment.
     ****************************************************************************************/
    @isTest
    private static void getAccountRecordTypeComboboxVModelMapped() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsService();
        RecordTypeService.instance = new STUB_RecordTypeServiceAccountRecordTypeCombobox(false);

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel accountRecordTypeComboboxVModel = autoEnrollmentMappingsVMapperInstance.getAccountRecordTypeComboboxVModel(
            'Record_Type_1'
        );
        Test.stopTest();

        System.assertEquals(
            'Record_Type_1',
            accountRecordTypeComboboxVModel.value,
            'The value of comboboxVModelOptionsForActiveAccountRecordTypes should be Record_Type_1'
        );
        System.assertEquals(
            1,
            accountRecordTypeComboboxVModel.options.size(),
            'The size of accountRecordTypeComboboxVModel.options should be 1'
        );
        System.assertEquals(
            'Record Type 1',
            accountRecordTypeComboboxVModel.options[0].label,
            'The label of accountRecordTypeComboboxVModel.options[0] should be Record Type 1'
        );
        System.assertEquals(
            'Record_Type_1',
            accountRecordTypeComboboxVModel.options[0].value,
            'The value of accountRecordTypeComboboxVModel.options[0] should be Record_Type_1'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAccountRecordTypeComboboxVModel() returns a
     * ComboBoxVModel with proper values when the record type does not exist
     ****************************************************************************************/
    @isTest
    private static void getAccountRecordTypeComboboxVModelMappedNull() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsService();
        RecordTypeService.instance = new STUB_RecordTypeServiceAccountRecordTypeCombobox(true);

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel accountRecordTypeComboboxVModel = autoEnrollmentMappingsVMapperInstance.getAccountRecordTypeComboboxVModel(
            'Invalid'
        );
        Test.stopTest();

        System.assertEquals(
            'Invalid',
            accountRecordTypeComboboxVModel.value,
            'The value of comboboxVModelOptionsForActiveAccountRecordTypes should be Invalid'
        );
        System.assertEquals(
            1,
            accountRecordTypeComboboxVModel.options.size(),
            'The size of accountRecordTypeComboboxVModel.options should be 1'
        );
        System.assertEquals(
            'Invalid',
            accountRecordTypeComboboxVModel.options[0].label,
            'The label of accountRecordTypeComboboxVModel.options[0] should be Invalid'
        );
        System.assertEquals(
            'Invalid',
            accountRecordTypeComboboxVModel.options[0].value,
            'The value of accountRecordTypeComboboxVModel.options[0] should be Invalid'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getComboboxVModelOptionsForActiveAccountRecordTypes()
     * returns a list of ComboboxValueVModel with proper values
     * when no record type is mapped to active auto enrollment.
     ****************************************************************************************/
    @isTest
    private static void getComboboxVModelOptionsForActiveAccountRecordTypesAllUnmapped() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsServiceInactiveAutoEnrollment();
        List<RecordTypeModel> activeAccountRecordTypeModelsList = new List<RecordTypeModel>{
            new RecordTypeModel('000000000000000001', 'Record Type 1', 'Record_Type_1', true),
            new RecordTypeModel('000000000000000002', 'Record Type 2', 'Record_Type_2', true)
        };

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        List<ComboboxValueVModel> comboboxVModelOptionsForActiveAccountRecordTypes = autoEnrollmentMappingsVMapperInstance.getComboboxVModelOptionsForActiveAccountRecordTypes(
            activeAccountRecordTypeModelsList,
            'Record_Type_1'
        );
        Test.stopTest();

        System.assertEquals(
            2,
            comboboxVModelOptionsForActiveAccountRecordTypes.size(),
            'The size of comboboxVModelOptionsForActiveAccountRecordTypes should be 2'
        );
        System.assertEquals(
            'Record Type 1',
            comboboxVModelOptionsForActiveAccountRecordTypes[0].label,
            'The label of comboboxVModelOptionsForActiveAccountRecordTypes[0] should be Record Type 1'
        );
        System.assertEquals(
            'Record_Type_1',
            comboboxVModelOptionsForActiveAccountRecordTypes[0].value,
            'The value of comboboxVModelOptionsForActiveAccountRecordTypes[0] should be Record_Type_1'
        );
        System.assertEquals(
            'Record Type 2',
            comboboxVModelOptionsForActiveAccountRecordTypes[1].label,
            'The label of comboboxVModelOptionsForActiveAccountRecordTypes[1] should be Record Type 2'
        );
        System.assertEquals(
            'Record_Type_2',
            comboboxVModelOptionsForActiveAccountRecordTypes[1].value,
            'The value of comboboxVModelOptionsForActiveAccountRecordTypes[1] should be Record_Type_2'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getComboboxVModelOptionsForActiveAccountRecordTypes()
     * returns a empty list of ComboboxValueVModel with proper values
     * when all record types are mapped to active auto enrollment.
     ****************************************************************************************/
    @isTest
    private static void getComboboxVModelOptionsForActiveAccountRecordTypesAllMapped() {
        AffiliationMappingsService.instance = new STUB_AffiliationMappingsService();
        List<RecordTypeModel> activeAccountRecordTypeModelsList = new List<RecordTypeModel>{
            new RecordTypeModel('000000000000000001', 'Record Type 1', 'Record_Type_1', true),
            new RecordTypeModel('000000000000000002', 'Record Type 2', 'Record_Type_2', true)
        };

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        List<ComboboxValueVModel> comboboxVModelOptionsForActiveAccountRecordTypes = autoEnrollmentMappingsVMapperInstance.getComboboxVModelOptionsForActiveAccountRecordTypes(
            activeAccountRecordTypeModelsList,
            'Record_Type_1'
        );
        Test.stopTest();

        System.assertEquals(
            1,
            comboboxVModelOptionsForActiveAccountRecordTypes.size(),
            'The size of comboboxVModelOptionsForActiveAccountRecordTypes should be 0'
        );
        System.assertEquals(
            'Record Type 1',
            comboboxVModelOptionsForActiveAccountRecordTypes[0].label,
            'The label of comboboxVModelOptionsForActiveAccountRecordTypes[0] should be Record Type 1'
        );
        System.assertEquals(
            'Record_Type_1',
            comboboxVModelOptionsForActiveAccountRecordTypes[0].value,
            'The value of comboboxVModelOptionsForActiveAccountRecordTypes[0] should be Record_Type_1'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingStatusComboboxVModel()
     * returns a ComboBoxVModel with proper values of picklist entries.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingStatusComboboxVModelValid() {
        PicklistEntryService.instance = new STUB_StatusPicklistEntryServiceValid();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel autoEnrollmentMappingStatusCombobox = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingStatusComboboxVModel(
            'Status'
        );
        Test.stopTest();

        System.assertEquals(
            'Status',
            autoEnrollmentMappingStatusCombobox.value,
            'The value of autoEnrollmentMappingStatusCombobox should be Status'
        );
        System.assertEquals(
            'Test Status',
            autoEnrollmentMappingStatusCombobox.options[0].label,
            'The label of autoEnrollmentMappingStatusCombobox.options[0] should be Test Status'
        );
        System.assertEquals(
            'Test_Status',
            autoEnrollmentMappingStatusCombobox.options[0].value,
            'The value of autoEnrollmentMappingStatusCombobox.options[0] should be Test_Status'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingStatusComboboxVModel()
     * returns a ComboBoxVModel with no options when no valid picklist value entry is found.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingStatusComboboxVModelInvalid() {
        PicklistEntryService.instance = new STUB_StatusPicklistEntryServiceInvalid();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel autoEnrollmentMappingStatusCombobox = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingStatusComboboxVModel(
            'Status'
        );
        Test.stopTest();

        System.assertEquals(
            'Status',
            autoEnrollmentMappingStatusCombobox.value,
            'The value of autoEnrollmentMappingStatusCombobox should be Status'
        );
        System.assertEquals(
            0,
            autoEnrollmentMappingStatusCombobox.options.size(),
            'The size of autoEnrollmentMappingStatusCombobox.options should be 0'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingRoleComboboxVModel()
     * returns a ComboBoxVModel with proper values of picklist entries.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingRoleComboboxVModelValid() {
        PicklistEntryService.instance = new STUB_RolePicklistEntryServiceValid();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel autoEnrollmentMappingRoleCombobox = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingRoleComboboxVModel(
            'Role'
        );
        Test.stopTest();

        System.assertEquals(
            'Role',
            autoEnrollmentMappingRoleCombobox.value,
            'The value of autoEnrollmentMappingRoleCombobox should be Role'
        );
        System.assertEquals(
            'Test Role',
            autoEnrollmentMappingRoleCombobox.options[0].label,
            'The label of autoEnrollmentMappingRoleCombobox.options[0] should be Test Role'
        );
        System.assertEquals(
            'Test_Role',
            autoEnrollmentMappingRoleCombobox.options[0].value,
            'The value of autoEnrollmentMappingRoleCombobox.options[0] should be Test_Role'
        );
    }

    /****************************************************************************************
     * @description Test method to verify getAutoEnrollmentMappingRoleComboboxVModel()
     * returns a ComboBoxVModel with no options when no valid picklist value entry is found.
     ****************************************************************************************/
    @isTest
    private static void getAutoEnrollmentMappingRoleComboboxVModelInvalid() {
        PicklistEntryService.instance = new STUB_RolePicklistEntryServiceInvalid();

        AutoEnrollmentMappingsVMapper autoEnrollmentMappingsVMapperInstance = AutoEnrollmentMappingsVMapper.getInstance();

        Test.startTest();
        ComboBoxVModel autoEnrollmentMappingRoleCombobox = autoEnrollmentMappingsVMapperInstance.getAutoEnrollmentMappingRoleComboboxVModel(
            'Role'
        );
        Test.stopTest();

        System.assertEquals(
            'Role',
            autoEnrollmentMappingRoleCombobox.value,
            'The value of autoEnrollmentMappingRoleCombobox should be Role'
        );
        System.assertEquals(
            0,
            autoEnrollmentMappingRoleCombobox.options.size(),
            'The size of autoEnrollmentMappingRoleCombobox.options should be 0'
        );
    }

    /***********************************************************************************************************************************
     ****************************************************** STUBS ***********************************************************************
     ***********************************************************************************************************************************/

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from AffiliationMappingsService
     **************************************************************************************************************************************/
    private class STUB_AffiliationMappingsService extends AffiliationMappingsService {
        public override List<AffiliationMappingsModel> getAffiliationMappingsModels() {
            return new List<AffiliationMappingsModel>{
                new AffiliationMappingsModel(
                    'Affiliation Name 1',
                    'Record_Type_1',
                    'Contact_Account_Lookup_1',
                    true,
                    'autoProgramEnrollmentStatus1',
                    'autoProgramEnrollmentRole1'
                ),
                new AffiliationMappingsModel(
                    'Affiliation Name 2',
                    'Record_Type_2',
                    'Contact_Account_Lookup_2',
                    true,
                    'autoProgramEnrollmentStatus2',
                    'autoProgramEnrollmentRole2'
                )
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from AffiliationMappingsService with inactive auto enrollment
     **************************************************************************************************************************************/
    private class STUB_AffiliationMappingsServiceInactiveAutoEnrollment extends AffiliationMappingsService {
        public override List<AffiliationMappingsModel> getAffiliationMappingsModels() {
            return new List<AffiliationMappingsModel>{
                new AffiliationMappingsModel(
                    'Affiliation Name 1',
                    'Record_Type_1',
                    'Contact_Account_Lookup_1',
                    false,
                    'autoProgramEnrollmentStatus1',
                    'autoProgramEnrollmentRole1'
                ),
                new AffiliationMappingsModel(
                    'Affiliation Name 2',
                    'Record_Type_2',
                    'Contact_Account_Lookup_2',
                    false,
                    'autoProgramEnrollmentStatus2',
                    'autoProgramEnrollmentRole2'
                )
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from AffiliationMappingsService with inactive auto enrollment
     **************************************************************************************************************************************/
    private class STUB_AffiliationMappingsServiceMixAutoEnrollment extends AffiliationMappingsService {
        public override List<AffiliationMappingsModel> getAffiliationMappingsModels() {
            return new List<AffiliationMappingsModel>{
                new AffiliationMappingsModel(
                    'Affiliation Name 1',
                    'Record_Type_1',
                    'Contact_Account_Lookup_1',
                    true,
                    'autoProgramEnrollmentStatus1',
                    'autoProgramEnrollmentRole1'
                ),
                new AffiliationMappingsModel(
                    'Affiliation Name 2',
                    'Record_Type_2',
                    'Contact_Account_Lookup_2',
                    false,
                    'autoProgramEnrollmentStatus2',
                    'autoProgramEnrollmentRole2'
                )
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from AffiliationMappingsService with empty auto enrollment
     **************************************************************************************************************************************/
    private class STUB_AffiliationMappingsServiceEmptyAutoEnrollment extends AffiliationMappingsService {
        public override List<AffiliationMappingsModel> getAffiliationMappingsModels() {
            return new List<AffiliationMappingsModel>{
                new AffiliationMappingsModel(
                    'Affiliation Name 1',
                    'Record_Type_1',
                    'Contact Account Lookup Label 1',
                    true,
                    '',
                    ''
                ),
                new AffiliationMappingsModel(
                    'Affiliation Name 2',
                    'Record_Type_2',
                    'Contact Account Lookup Label 2',
                    true,
                    '',
                    ''
                )
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from RecordTypeService
     **************************************************************************************************************************************/
    private class STUB_RecordTypeService extends RecordTypeService {
        public override Map<Id, RecordTypeModel> getModelByIdMapForSObjectType(Schema.SObjectType sObjectType) {
            return new Map<Id, RecordTypeModel>{
                '000000000000000001' => new RecordTypeModel(
                    '000000000000000001',
                    'Record Type 1',
                    'Record_Type_1',
                    true
                ),
                '000000000000000002' => new RecordTypeModel(
                    '000000000000000002',
                    'Record Type 2',
                    'Record_Type_2',
                    true
                ),
                '000000000000000003' => new RecordTypeModel(
                    '000000000000000003',
                    'Record Type 3',
                    'Record_Type_3',
                    false
                )
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from RecordTypeService
     **************************************************************************************************************************************/
    private class STUB_RecordTypeServiceValid extends RecordTypeService {
        public override RecordTypeModel getRecordTypeModelFromNameAndLabelMaps(
            String recordTypeNameOrLabel,
            Map<String, RecordTypeModel> recordTypeModelByName,
            Map<String, RecordTypeModel> recordTypeModelByLabel
        ) {
            return new RecordTypeModel('000000000000000009', 'Account Record Type', 'Account_Record_Type', true);
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate invalid responses from RecordTypeService
     **************************************************************************************************************************************/
    private class STUB_RecordTypeServiceInvalid extends RecordTypeService {
        public override RecordTypeModel getRecordTypeModelFromNameAndLabelMaps(
            String recordTypeNameOrLabel,
            Map<String, RecordTypeModel> recordTypeModelByName,
            Map<String, RecordTypeModel> recordTypeModelByLabel
        ) {
            return null;
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses for account record type combobox
     **************************************************************************************************************************************/
    private class STUB_RecordTypeServiceAccountRecordTypeCombobox extends RecordTypeService {
        private Boolean neverFindRecordType = false;

        public STUB_RecordTypeServiceAccountRecordTypeCombobox(Boolean neverFindRecordType) {
            this.neverFindRecordType = neverFindRecordType;
        }

        public override Map<Id, RecordTypeModel> getModelByIdMapForSObjectType(Schema.SObjectType sObjectType) {
            return new Map<Id, RecordTypeModel>{
                '000000000000000001' => new RecordTypeModel(
                    '000000000000000001',
                    'Record Type 1',
                    'Record_Type_1',
                    true
                ),
                '000000000000000002' => new RecordTypeModel(
                    '000000000000000002',
                    'Record Type 2',
                    'Record_Type_2',
                    true
                )
            };
        }

        public override RecordTypeModel getRecordTypeModelFromNameAndLabelMaps(
            String recordTypeNameOrLabel,
            Map<String, RecordTypeModel> recordTypeModelByName,
            Map<String, RecordTypeModel> recordTypeModelByLabel
        ) {
            if (this.neverFindRecordType) {
                return null;
            }

            return new RecordTypeModel('000000000000000001', 'Record Type 1', 'Record_Type_1', true);
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from PicklistEntryService
     **************************************************************************************************************************************/
    private class STUB_StatusPicklistEntryServiceValid extends PicklistEntryService {
        public override Map<String, PicklistEntryModel> getModelsByNameForSObjectField(
            SObjectType sObjectTypeName,
            SObjectField SObjectFieldName
        ) {
            return new Map<String, PicklistEntryModel>{
                'Status' => new PicklistEntryModel('Test_Status', 'Test Status', true)
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate invalid responses from PicklistEntryService
     **************************************************************************************************************************************/
    private class STUB_StatusPicklistEntryServiceInvalid extends PicklistEntryService {
        public override Map<String, PicklistEntryModel> getModelsByNameForSObjectField(
            SObjectType sObjectTypeName,
            SObjectField SObjectFieldName
        ) {
            return new Map<String, PicklistEntryModel>{
                'Status' => new PicklistEntryModel('Test_Status', 'Test Status', false)
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate valid responses from PicklistEntryService
     **************************************************************************************************************************************/
    private class STUB_RolePicklistEntryServiceValid extends PicklistEntryService {
        public override Map<String, PicklistEntryModel> getModelsByNameForSObjectField(
            SObjectType sObjectTypeName,
            SObjectField SObjectFieldName
        ) {
            return new Map<String, PicklistEntryModel>{
                'Role' => new PicklistEntryModel('Test_Role', 'Test Role', true)
            };
        }
    }

    /**************************************************************************************************************************************
     * @description Stub class to simulate invalid responses from PicklistEntryService
     **************************************************************************************************************************************/
    private class STUB_RolePicklistEntryServiceInvalid extends PicklistEntryService {
        public override Map<String, PicklistEntryModel> getModelsByNameForSObjectField(
            SObjectType sObjectTypeName,
            SObjectField SObjectFieldName
        ) {
            return new Map<String, PicklistEntryModel>{
                'Role' => new PicklistEntryModel('Test_Role', 'Test Role', false)
            };
        }
    }
}
/*
    Copyright (c) 2014, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2015
 * @group Course Offering
 * @group-content ../../ApexDocContent/CourseOfferings.htm
 * @description Keeps Course Offering and Affiliation records for a Contact in sync.
 */
public class COFF_Affiliation_TDTM extends TDTM_Runnable {
    /*******************************************************************************************************
    * @description Handles Affiliation management for Course Offering.
                   Populates Start and End Date from Term, if fields are empty.
    * @param listNew the list of Course Offerings from trigger new.
    * @param listOld the list of Course Offerings from trigger old.
    * @param triggerAction which trigger event (BeforeInsert, AfterInsert, etc.).
    * @param objResult the describe for Course Offering.
    * @return dmlWrapper.
    ********************************************************************************************************/
    public override DmlWrapper run(
        List<SObject> newlist,
        List<SObject> oldlist,
        TDTM_Runnable.Action triggerAction,
        Schema.DescribeSObjectResult objResult
    ) {
        DmlWrapper dmlWrapper = new DmlWrapper();
        // prevent recursion
        if (!TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM)) {
            List<Course_Offering__c> offsWithNewFaculty = new List<Course_Offering__c>();
            Set<Id> offsWithChangedFaculty = new Set<Id>();
            Set<Id> offsWithRemovedFaculty = new Set<Id>();
            Set<Id> oldCourseOfferingFacultyIDs = new Set<Id>();
            Set<Id> newCourseOfferingFacultyIDs = new Set<Id>();

            List<ID> newFacultyIDs = new List<ID>();
            List<ID> updatedFacultyIDs = new List<ID>();
            List<ID> outdatedFacultyIDs = new List<ID>();
            List<ID> removedFacultyIDs = new List<ID>();
            List<ID> facultyCleanupIDs = new List<ID>();

            List<SObject> objectsToInsert = new List<SObject>();
            List<SObject> objectsToUpdate = new List<SObject>();
            List<SObject> objectsToDelete = new List<SObject>();

            List<Course_Enrollment__c> courseEnrllsToInsert = new List<Course_Enrollment__c>();

            Map<Id, Course_Offering__c> mapNewFacultyIdToNewCourseOffering = new Map<Id, Course_Offering__c>();

            if (newlist != null) {
                if (
                    triggerAction == TDTM_Runnable.Action.AfterInsert ||
                    triggerAction == TDTM_Runnable.Action.AfterUpdate
                ) {
                    //Query fields not available in the trigger
                    newList = [
                        SELECT
                            Course__c,
                            Faculty__c,
                            Start_Date__c,
                            End_Date__c,
                            Course__r.Account__c,
                            Term__r.Start_Date__c,
                            Term__r.End_Date__c
                        FROM Course_Offering__c
                        WHERE ID IN :newlist
                    ];
                }

                for (Integer i = 0; i < newlist.size(); i++) {
                    Course_Offering__c newOff = (Course_Offering__c) newlist[i];

                    if (triggerAction == TDTM_Runnable.Action.AfterInsert) {
                        //Course Offering with Faculty has been created
                        //   --> create Affl if no other Affl to Dpt exists
                        //   --> create Course Enrollment
                        if (newOff.Faculty__c != null) {
                            UTIL_Debug.debug('****Course Offering with Faculty has been created');
                            newFacultyIDs.add(newOff.Faculty__c);
                            offsWithNewFaculty.add(newOff);
                            Course_Enrollment__c newEnroll = new Course_Enrollment__c(
                                Contact__c = newOff.Faculty__c,
                                Account__c = newOff.Course__r.Account__c,
                                Course_Offering__c = newOff.Id
                            );
                            if (UTIL_CustomSettingsFacade.courseConnectionsEnabled()) {
                                // Course Connections is enabled, set RecordType and Primary__c
                                newEnroll.put('RecordTypeId', UTIL_Describe.getFacultyConnectionRecType());
                                newEnroll.Primary__c = true;
                            }
                            courseEnrllsToInsert.add(newEnroll);
                        }

                        Boolean dateCopied = false;
                        //Copy Start Date from parent Term, if no value entered
                        if (
                            String.isBlank(String.valueOf(newOff.Start_Date__c)) &&
                            !String.isBlank(String.valueOf(newOff.Term__r.Start_Date__c))
                        ) {
                            UTIL_Debug.debug(
                                '****Copying term start date to course offering: ' + newOff.Term__r.Start_Date__c
                            );
                            newOff.Start_Date__c = newOff.Term__r.Start_Date__c;
                            dateCopied = true;
                        }
                        //Copy End Date from parent Term, if no value entered
                        if (
                            String.isBlank(String.valueOf(newOff.End_Date__c)) &&
                            !String.isBlank(String.valueOf(newOff.Term__r.End_Date__c))
                        ) {
                            UTIL_Debug.debug(
                                '****Copying term start date to course offering: ' + newOff.Term__r.Start_Date__c
                            );
                            newOff.End_Date__c = newOff.Term__r.End_Date__c;
                            dateCopied = true;
                        }

                        //Nowhere else in this class are Course Offerings added to dmlWrapper.objectsToUpdate. If they were, we
                        //should put all those changes together to avoid adding those records to dmlWrapper.objectsToUpdate more
                        //than once.
                        if (dateCopied) {
                            dmlWrapper.objectsToUpdate.add(newOff);
                        }
                    } else if (triggerAction == TDTM_Runnable.Action.AfterUpdate) {
                        Course_Offering__c oldOff = (Course_Offering__c) oldlist[i];

                        //Faculty member has been added to existing Course Offering
                        //   --> create Affl if no other Affl to Dpt exists
                        //   --> create Course Enrollment
                        //     --> Create without recordtype if course connections disabled
                        //     --> Create with recordtype and as primary if course connections enabled
                        if (oldOff.Faculty__c == null && newOff.Faculty__c != null) {
                            UTIL_Debug.debug('****Faculty member has been added to existing Course Offering');
                            newFacultyIDs.add(newOff.Faculty__c);
                            offsWithNewFaculty.add(newOff);
                            // Do not perform adding new Course Enrollments if Course Connections is enabled.
                            // Logic for if Course Connections is enabled is handled below.
                            if (!UTIL_CustomSettingsFacade.courseConnectionsEnabled()) {
                                Course_Enrollment__c enroll = new Course_Enrollment__c(
                                    Contact__c = newOff.Faculty__c,
                                    Account__c = newOff.Course__r.Account__c,
                                    Course_Offering__c = newOff.Id
                                );
                                courseEnrllsToInsert.add(enroll);
                            }

                            //Faculty member has been changed
                            //   --> update Affiliation to Dpt to point it to the new Faculty
                        } else if (
                            oldOff.Faculty__c != null &&
                            newOff.Faculty__c != null &&
                            oldOff.Faculty__c != newOff.Faculty__c
                        ) {
                            UTIL_Debug.debug('****Faculty member has been changed');
                            offsWithChangedFaculty.add(newOff.Id);
                            outdatedFacultyIDs.add(oldOff.Faculty__c);
                            updatedFacultyIDs.add(newOff.Faculty__c);
                            mapNewFacultyIdToNewCourseOffering.put(newOff.Faculty__c, newOff);
                            oldCourseOfferingFacultyIDs.add(oldOff.Faculty__c);
                            newCourseOfferingFacultyIDs.add(newOff.Faculty__c);
                            //Faculty member has been removed from existing Course Offering
                            //   --> delete related Affiliation
                            //   --> delete Course Enrollment
                        } else if (oldOff.Faculty__c != null && newOff.Faculty__c == null) {
                            UTIL_Debug.debug('****Faculty member has been removed from existing Course Offering');
                            removedFacultyIDs.add(oldOff.Faculty__c);
                            offsWithRemovedFaculty.add(newOff.Id);
                        }
                    }
                }
            }

            if (oldlist != null) {
                for (Integer i = 0; i < oldlist.size(); i++) {
                    Course_Offering__c oldOff = (Course_Offering__c) oldlist[i];

                    if (triggerAction == TDTM_Runnable.Action.BeforeDelete) {
                        //Course Offering has been deleted
                        //     --> delete related Affiliation, if the faculty field had a value
                        //     --> delete the Course Enrollment, if the faculty field had a value
                        if (oldOff.Faculty__c != null) {
                            UTIL_Debug.debug('****Course Offering with faculty has been deleted');
                            facultyCleanupIDs.add(oldOff.Faculty__c);
                            offsWithRemovedFaculty.add(oldOff.Id);
                        }
                    }
                }
            }
            // If new faculty added to existing Course Offering
            if (offsWithNewFaculty.size() > 0) {
                if (UTIL_CustomSettingsFacade.courseConnectionsEnabled()) {
                    updateConnectionsOnFacultyAdd(offsWithNewFaculty, objectsToInsert, objectsToUpdate);
                } else {
                    createOrLinkAffls(offsWithNewFaculty, newFacultyIDs, courseEnrllsToInsert);
                }
                dmlWrapper.objectsToInsert.addAll((List<SObject>) courseEnrllsToInsert);
            }

            if (updatedFacultyIDs.size() > 0) {
                if (UTIL_CustomSettingsFacade.courseConnectionsEnabled()) {
                    // Course connections is enabled. Handle updating of objects
                    updateConnectionsOnFacultyChange(
                        offsWithChangedFaculty,
                        oldCourseOfferingFacultyIDs,
                        newCourseOfferingFacultyIDs,
                        objectsToInsert,
                        objectsToUpdate
                    );
                } else {
                    List<Affiliation__c> newAffls = getAfflsToUpdate(
                        outdatedFacultyIDs,
                        updatedFacultyIDs,
                        mapNewFacultyIdToNewCourseOffering
                    );
                    for (Affiliation__c newAffl : newAffls) {
                        if (newAffl.Id != null) {
                            dmlWrapper.objectsToUpdate.add(newAffl);
                        } else {
                            dmlWrapper.objectsToInsert.add(newAffl);
                        }
                    }
                    // Course connections is not enabled. Handle deletion and creation of course enrollments
                    updateEnrollments(outdatedFacultyIDs, updatedFacultyIDs, offsWithChangedFaculty, dmlWrapper); //Passing dmlWrapper because there's more than one DML to perform
                }
            }

            if (removedFacultyIDs.size() > 0) {
                if (UTIL_CustomSettingsFacade.courseConnectionsEnabled()) {
                    updateConnectionsOnFacultyRemove(removedFacultyIDs, offsWithRemovedFaculty, objectsToUpdate);
                } else {
                    deleteAfflsEnrolls(removedFacultyIDs, offsWithRemovedFaculty, dmlWrapper); //Passing dmlWrapper because there's more than one DML to perform
                }
            }

            if (facultyCleanupIDs.size() > 0) {
                deleteAfflsEnrolls(facultyCleanupIDs, offsWithRemovedFaculty, dmlWrapper); //Passing dmlWrapper because there's more than one DML to perform
            }

            TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, true);

            dmlWrapper.objectsToUpdate.addAll(objectsToUpdate);
            dmlWrapper.objectsToInsert.addAll(objectsToInsert);
            dmlWrapper.objectsToDelete.addAll(objectsToDelete);
        }

        TDTM_TriggerHandler.processDML(dmlWrapper, true);
        dmlWrapper = null;
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        return dmlWrapper;
    }

    /*******************************************************************************************************
     * @description Creates Affiliation records for Faculty members assigned to Course Offerings, if no Affiliation
     * existed for the department the Course Offering belongs to. Also, it links the automatically created Course
     * Enrollments to the automatically created Affiliations.
     ********************************************************************************************************/
    private void createOrLinkAffls(
        List<Course_Offering__c> offsWithNewFaculty,
        List<Id> newFacultyIDs,
        List<Course_Enrollment__c> courseEnrllsToInsert
    ) {
        //Find all Affls for all Faculty members in the trigger.
        Map<Id, List<Affiliation__c>> facultyIDtoAffls = getAfflsForContact(newFacultyIDs);
        //Automatically create an Affiliation record if a Course Offering record with a value in the Faculty field has been created,
        //and no Affl to the parent Department exists.
        Map<String, Affiliation__c> affiliationsToInsertByContactAccountString = new Map<String, Affiliation__c>();
        List<Affiliation__c> afflsTemp = new List<Affiliation__c>();
        for (Integer i = 0; i < offsWithNewFaculty.size(); i++) {
            Course_Offering__c offering = offsWithNewFaculty[i];
            Affiliation__c afflToDpt = affiliationToAccount(offering, facultyIDtoAffls);

            if (afflToDpt == null) {
                UTIL_Debug.debug('****Affl to Dpt does not exist');
                Affiliation__c afflToInsert;

                String contactAccountKey = offering.Faculty__c + '' + offering.Course__r.Account__c;
                // Is the Affiliation already being inserted? If so, do not insert a duplicate.
                if (affiliationsToInsertByContactAccountString.containsKey(contactAccountKey)) {
                    afflToInsert = affiliationsToInsertByContactAccountString.get(contactAccountKey);
                } else {
                    afflToInsert = createAffiliationFromCourseOffering(offering);
                    affiliationsToInsertByContactAccountString.put(contactAccountKey, afflToInsert);
                }
                afflsTemp.add(afflToInsert);
            } else {
                UTIL_Debug.debug('****Affl to Dpt exists: ' + afflToDpt.Id);
                afflsTemp.add(afflToDpt); // Add existing affl to link to Course Enrollment
            }
        }
        insert affiliationsToInsertByContactAccountString.values();

        //Link Course Enrollments to Affiliations
        for (Integer i = 0; i < afflsTemp.size(); i++) {
            if (afflsTemp[i] != null) {
                courseEnrllsToInsert[i].Affiliation__c = afflsTemp[i].Id;
            }
        }
    }

    /*******************************************************************************************************
     * @description Sets each Affiliation pointing to the new Faculty member that is teaching the Course Offering.
     ********************************************************************************************************/
    private List<SObject> getAfflsToUpdate(
        List<ID> outdatedFacultyIDs,
        List<ID> updatedFacultyIDs,
        Map<Id, Course_Offering__c> mapNewFacultyIdToNewCourseOffering
    ) {
        List<Affiliation__c> afflsWithContact = [
            SELECT Contact__c
            FROM Affiliation__c
            WHERE Contact__c IN :outdatedFacultyIDs AND Role__c = 'Faculty'
        ];
        Map<String, Affiliation__c> affiliationsToInsertByContactAccountString = new Map<String, Affiliation__c>();

        Map<ID, Affiliation__c> oldFacultyToAfflMap = new Map<ID, Affiliation__c>();
        for (Affiliation__c affl : afflsWithContact) {
            oldFacultyToAfflMap.put(affl.Contact__c, affl);
        }

        //We have to make sure we are updating the correct Affiliations.
        for (Integer i = 0; i < outdatedFacultyIDs.size(); i++) {
            Id outdatedFacultyID = outdatedFacultyIDs[i];
            Id updatedFacultyID = updatedFacultyIDs[i];
            if (oldFacultyToAfflMap.keySet().contains(outdatedFacultyID)) {
                Affiliation__c oldAffl = oldFacultyToAfflMap.get(outdatedFacultyID);
                oldAffl.Contact__c = updatedFacultyID;
            } else {
                if (
                    mapNewFacultyIdToNewCourseOffering.keySet().contains(updatedFacultyID) &&
                    mapNewFacultyIdToNewCourseOffering.get(updatedFacultyID) != null
                ) {
                    Course_Offering__c offering = mapNewFacultyIdToNewCourseOffering.get(updatedFacultyID);
                    String contactAccountKey = offering.Faculty__c + '' + offering.Course__r.Account__c;
                    // Is the Affiliation already being inserted? If so, do not insert a duplicate.
                    if (affiliationsToInsertByContactAccountString.containsKey(contactAccountKey)) {
                        continue;
                    }

                    Affiliation__c newAffl = createAffiliationFromCourseOffering(offering);
                    affiliationsToInsertByContactAccountString.put(contactAccountKey, newAffl);
                }
            }
        }

        afflsWithContact.addAll(affiliationsToInsertByContactAccountString.values());
        return afflsWithContact;
    }

    /*******************************************************************************************************
     * @description Creates and returns a new Faculty Affiliation record from the given Course Offering.
     * @return Affiliation__c The new Faculty Affiliation record.
     ********************************************************************************************************/
    private Affiliation__c createAffiliationFromCourseOffering(Course_Offering__c offering) {
        return new Affiliation__c(
            Contact__c = offering.Faculty__c,
            Account__c = offering.Course__r.Account__c,
            Role__c = 'Faculty',
            StartDate__c = offering.Term__r.Start_Date__c,
            EndDate__c = offering.Term__r.End_Date__c
        );
    }

    /*******************************************************************************************************
     * @description Updates each Course Enrollment from the old Faculty member to the new Faculty member. A Faculty
     * member should not be at the same time teaching and attending a course if the course connection is disabled.
     * However, it still allows users to replace the course enrollment with the new faculty member.
     ********************************************************************************************************/
    private void updateEnrollments(
        List<ID> outdatedFacultyIDs,
        List<ID> updatedFacultyIDs,
        Set<Id> offsWithChangedFaculty,
        DmlWrapper dmlWrapper
    ) {
        List<Course_Enrollment__c> newEnrolls = new List<Course_Enrollment__c>();
        List<Course_Enrollment__c> oldEnrolls = [
            SELECT Affiliation__c, Account__c, Course_Offering__c, Course_Offering__r.Faculty__c
            FROM Course_Enrollment__c
            WHERE Contact__c IN :outdatedFacultyIDs AND Course_Offering__c IN :offsWithChangedFaculty
        ];
        for (Course_Enrollment__c enroll : oldEnrolls) {
            newEnrolls.add(
                new Course_Enrollment__c(
                    Contact__c = enroll.Course_Offering__r.Faculty__c,
                    Account__c = enroll.Account__c,
                    Course_Offering__c = enroll.Course_Offering__c,
                    Affiliation__c = enroll.Affiliation__c
                )
            );
        }

        dmlWrapper.objectsToDelete.addAll((List<SObject>) oldEnrolls);
        dmlWrapper.objectsToInsert.addAll((List<SObject>) newEnrolls);
    }

    /*******************************************************************************************************
     * @description Updates each Course Connection to mark old as not Primary and new as Primary. A Faculty
     * member may already have a Course Connection that may need to be marked primary or may need to be created
     * if a connection for the Faculty member does not exist.
     ********************************************************************************************************/
    @testVisible
    private void updateConnectionsOnFacultyChange(
        Set<Id> offsWithChangedFaculty,
        Set<Id> outdatedFacultyIDs,
        Set<Id> updatedFacultyIDs,
        List<SObject> objectsToInsert,
        List<SObject> objectsToUpdate
    ) {
        Id facultyRecordTypeId = UTIL_Describe.getFacultyConnectionRecType();
        Map<Id, Course_Enrollment__c> updatedCouserEnrollmentBycourseOfferingId = new Map<Id, Course_Enrollment__c>();
        String subQueryString = ', (SELECT Id, Contact__c, Affiliation__c, Account__c, Course_Offering__c, Primary__c';
        subQueryString += ' FROM Course_Enrollment__r';
        subQueryString += ' WHERE (Contact__c IN :outdatedFacultyIDs OR Contact__c IN :updatedFacultyIDs)';
        subQueryString += ' AND Course_Offering__c IN :offsWithChangedFaculty';

        //Record type of course enrollment not in the package
        if (
            UTIL_Describe.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId') &&
            facultyRecordTypeId != null
        ) {
            subQueryString += ' AND RecordTypeId = :facultyRecordTypeId';
        }
        subQueryString += ')';
        String queryString = 'SELECT Id, Faculty__c';
        queryString += subQueryString;
        queryString += ' FROM Course_Offering__c WHERE Id IN :offsWithChangedFaculty';

        List<Course_Offering__c> updatedCourseOfferings = Database.query(queryString);

        for (Course_Offering__c updatedCourseOffering : updatedCourseOfferings) {
            Boolean hasExistingCourseConnection = false;

            if (updatedCourseOffering.Faculty__c == null) {
                continue;
            }

            if (updatedCourseOffering.Course_Enrollment__r.size() == 0) {
                continue;
            }

            for (Course_Enrollment__c childCourseConnection : updatedCourseOffering.Course_Enrollment__r) {
                if (updatedCourseOffering.Faculty__c == childCourseConnection.Contact__c) {
                    if (childCourseConnection.Primary__c == false) {
                        childCourseConnection.Primary__c = true;
                        objectsToUpdate.add(childCourseConnection);
                    }
                    hasExistingCourseConnection = true;
                    continue;
                }

                if (childCourseConnection.Primary__c == false) {
                    continue;
                }

                childCourseConnection.Primary__c = false;
                objectsToUpdate.add(childCourseConnection);

                if (updatedCouserEnrollmentBycourseOfferingId.keySet().contains(updatedCourseOffering.Id) == false) {
                    updatedCouserEnrollmentBycourseOfferingId.put(updatedCourseOffering.Id, childCourseConnection);
                }
            }

            if (hasExistingCourseConnection == true) {
                continue;
            }

            Course_Enrollment__c newCourseConnection = new Course_Enrollment__c(
                Contact__c = updatedCourseOffering.Faculty__c,
                Primary__c = true
            );

            if (
                updatedCouserEnrollmentBycourseOfferingId.keySet().contains(updatedCourseOffering.Id) &&
                updatedCouserEnrollmentBycourseOfferingId.get(updatedCourseOffering.Id) != null
            ) {
                newCourseConnection.Account__c = updatedCouserEnrollmentBycourseOfferingId.get(updatedCourseOffering.Id)
                    .Account__c;
                newCourseConnection.Course_Offering__c = updatedCouserEnrollmentBycourseOfferingId.get(
                        updatedCourseOffering.Id
                    )
                    .Course_Offering__c;
                newCourseConnection.Affiliation__c = updatedCouserEnrollmentBycourseOfferingId.get(
                        updatedCourseOffering.Id
                    )
                    .Affiliation__c;
                if (
                    UTIL_Describe.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId')
                ) {
                    newCourseConnection.put('RecordTypeId', facultyRecordTypeId);
                }
            }
            objectsToInsert.add(newCourseConnection);
        }
    }

    /*******************************************************************************************************
     * @description Updates or adds a Course Connection for each added to a Course Offering. A Faculty
     * member may already have a Course Connection that may need to be marked primary or may need to be created
     * if a Course Connection for the Faculty member does not exist.
     ********************************************************************************************************/
    @testVisible
    private void updateConnectionsOnFacultyAdd(
        List<Course_Offering__c> courseOfferings,
        List<SObject> objectsToInsert,
        List<SObject> objectsToUpdate
    ) {
        Id facultyRecordTypeId = UTIL_Describe.getFacultyConnectionRecType();

        Set<Id> offIds = (new Map<Id, Course_Offering__c>(courseOfferings)).keySet();

        Map<Id, Map<Id, Course_Enrollment__c>> offeringFacultyConnIds = getOfferingIdFacultyIdConnection(
            offIds,
            facultyRecordTypeId
        );

        for (Course_Offering__c offering : courseOfferings) {
            if (
                offeringFacultyConnIds.containsKey(offering.Id) &&
                offeringFacultyConnIds.get(offering.Id).containsKey(offering.Faculty__c)
            ) {
                Course_Enrollment__c existingConn = offeringFacultyConnIds.get(offering.Id).get(offering.Faculty__c);
                if (!existingConn.Primary__c) {
                    // Current Course Connection exists on Course Offering with Contact, mark as Primary
                    objectsToUpdate.add(new Course_Enrollment__c(Id = existingConn.Id, Primary__c = true));
                }
            } else {
                // No current Course Connection exists on Course Offering with Contact, create a new one
                Course_Enrollment__c conn = new Course_Enrollment__c(
                    Contact__c = offering.Faculty__c,
                    Account__c = offering.Course__r.Account__c,
                    Course_Offering__c = offering.Id,
                    Primary__c = true
                );
                if (
                    UTIL_Describe.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId')
                ) {
                    conn.put('RecordTypeId', facultyRecordTypeId);
                }
                objectsToInsert.add(conn);
            }
        }
    }

    /*******************************************************************************************************
     * @description Updates each Course Connection as not Primary for all Course Connections tied to Faculty
     * that are no longer the Primary Faculty for the given Course Offerings.
     ********************************************************************************************************/
    @testVisible
    private void updateConnectionsOnFacultyRemove(
        List<ID> removedFacultyIDs,
        Set<Id> offsWithRemovedFaculty,
        List<SObject> objectsToUpdate
    ) {
        List<Course_Enrollment__c> oldConns = [
            SELECT Id, Course_Offering__c, Primary__c
            FROM Course_Enrollment__c
            WHERE Contact__c IN :removedFacultyIDs AND Course_Offering__c IN :offsWithRemovedFaculty
        ];

        for (Course_Enrollment__c conn : oldConns) {
            if (conn.Primary__c && offsWithRemovedFaculty.contains(conn.Course_Offering__c)) {
                conn.Primary__c = false;
                objectsToUpdate.add(conn);
            }
        }
    }

    /*******************************************************************************************************
     * @description Deletes the Affiliations that had been automatically created from the Course Enrollments with
     * assigned Faculty members but only if those Affiliations would no longer have any Course Enrollments
     * linked to them. Also deletes the Course Enrollments themselves.
     ********************************************************************************************************/
    private void deleteAfflsEnrolls(List<ID> removedFacultyIds, Set<Id> offsWithRemovedFaculty, DmlWrapper dmlWrapper) {
        Set<Id> afflIds = new Set<Id>();
        Set<Id> afflsToDeleteIds = new Set<Id>();

        List<Course_Enrollment__c> oldEnrolls = [
            SELECT Id, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__c IN :removedFacultyIds AND Course_Offering__c IN :offsWithRemovedFaculty
        ];

        for (Course_Enrollment__c enroll : oldEnrolls) {
            afflIds.add(enroll.Affiliation__c);
        }

        Map<Id, Affiliation__c> affls = new Map<Id, Affiliation__c>(
            [
                SELECT Id, (SELECT Id FROM Course_Enrollment__r WHERE Course_Offering__c NOT IN :offsWithRemovedFaculty)
                FROM Affiliation__c
                WHERE Id IN :afflIds
            ]
        );

        for (Course_Enrollment__c enroll : oldEnrolls) {
            if (affls.get(enroll.Affiliation__c) != null) {
                if (affls.get(enroll.Affiliation__c).Course_Enrollment__r.size() == 0) {
                    afflsToDeleteIds.add(enroll.Affiliation__c);
                }
            }
        }

        if (afflsToDeleteIds.size() > 0) {
            dmlWrapper.objectsToDelete.addAll(
                (List<SObject>) [SELECT Id FROM Affiliation__c WHERE Id IN :afflsToDeleteIds]
            );
        }
        dmlWrapper.objectsToDelete.addAll((List<SObject>) oldEnrolls);
    }

    /*******************************************************************************************************
     * @description Returns a map with the Contact ID of each faculty member as the key, and all its Affiliations
     * as the values.
     ********************************************************************************************************/
    @testVisible
    private Map<ID, List<Affiliation__c>> getAfflsForContact(List<ID> newFacultyIDs) {
        UTIL_Debug.debug('****Number of newly assigned faculty: ' + newFacultyIDs.size());
        //Find all Affls for all Faculty members in the trigger.
        Map<ID, List<Affiliation__c>> facultyIDtoAffls = new Map<ID, List<Affiliation__c>>();
        List<Affiliation__c> affls = [
            SELECT Id, Account__c, Contact__c
            FROM Affiliation__c
            WHERE Contact__c IN :newFacultyIDs
            ORDER BY Contact__c
        ];
        UTIL_Debug.debug('****Number of affls for existing faculty: ' + affls.size());

        if (affls.size() > 0) {
            //Set initial values, to compare against
            Affiliation__c affl = affls[0];
            ID contactID = affls[0].Contact__c;
            List<Affiliation__c> facultyAffls = new List<Affiliation__c>{ affl };
            facultyIDtoAffls.put(contactID, facultyAffls);

            //Iterate through the rest of the affiliations
            for (Integer i = 1; i < affls.size(); i++) {
                if (affls[i].Contact__c == contactID) {
                    facultyAffls.add(affls[i]);
                } else {
                    contactID = affls[i].Contact__c;
                    facultyAffls = new List<Affiliation__c>();
                    facultyAffls.add(affls[i]);
                    facultyIDtoAffls.put(contactID, facultyAffls);
                }
            }
        }
        return facultyIDtoAffls;
    }

    /*******************************************************************************************************
     * @description Returns a map with Course Offering Id as key and a value as a Map of Contact Id as
     * key with the corresponding Course Connection as value.
     ********************************************************************************************************/
    private Map<Id, Map<Id, Course_Enrollment__c>> getOfferingIdFacultyIdConnection(
        Set<Id> offeringIds,
        Id facultyRecordTypeId
    ) {
        // Map with Course Offering Id as key and a value as a Map of Contact Id as key with the corresponding Course Connection as value
        Map<Id, Map<Id, Course_Enrollment__c>> connToOfferingIdMap = new Map<Id, Map<Id, Course_Enrollment__c>>();
        String queryString = 'SELECT Id, Course_Offering__c, Contact__c, Primary__c FROM Course_Enrollment__c WHERE Course_Offering__c IN :offeringIds';
        if (
            UTIL_Describe.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId') &&
            facultyRecordTypeId != null
        ) {
            queryString += ' AND RecordTypeId = :facultyRecordTypeId';
        }
        List<Course_Enrollment__c> conns = Database.query(queryString);
        UTIL_Debug.debug('****Number of Faculty Course Connections for Course Offerings: ' + conns.size());

        for (Course_Enrollment__c conn : conns) {
            if (!connToOfferingIdMap.containsKey(conn.Course_Offering__c)) {
                connToOfferingIdMap.put(conn.Course_Offering__c, new Map<Id, Course_Enrollment__c>());
            }
            connToOfferingIdMap.get(conn.Course_Offering__c).put(conn.Contact__c, conn);
        }

        return connToOfferingIdMap;
    }

    /*******************************************************************************************************
     * @description Determines whether an Affiliation to the Account the Course Offering belongs to already
     * exists for each faculty member. Will return null if no Affiliation exists.
     * @return Affiliation__c Affiliation to the Account or null
     ********************************************************************************************************/
    @testVisible
    private Affiliation__c affiliationToAccount(
        Course_Offering__c offering,
        Map<ID, List<Affiliation__c>> facultyIDtoAffls
    ) {
        List<Affiliation__c> facultyMemberAffls = facultyIDtoAffls.get(offering.Faculty__c);
        if (facultyMemberAffls != null && facultyMemberAffls.size() > 0) {
            for (Affiliation__c affl : facultyMemberAffls) {
                if (affl.Account__c == offering.Course__r.Account__c) {
                    return affl;
                }
            }
        }

        return null;
    }
}

/*
    Copyright (c) 2015, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2015
 * @group Course Offering
 * @group-content ../../ApexDocContent/CourseOfferings.htm
 * @description Tests specific to Course Offering.
 */
@isTest
public with sharing class COFF_Affiliation_TEST {
    private static Account university;
    private static Account dpt;
    private static Course__c course;
    private static Term__c term;
    private static Contact faculty;

    private static void setup() {
        STG_InstallScript.insertMappings();
        // Create university
        university = new Account(Name = 'Advanced University', RecordTypeId = UTIL_Describe.getAcademicAccRecTypeID());
        insert university;

        // Create department
        dpt = new Account(
            Name = 'Biology Department',
            Parent = university,
            RecordTypeId = UTIL_Describe.getDepAccRecTypeID()
        );
        insert dpt;

        //Create Course
        course = new Course__c(
            Course_ID__c = 'Biology 101',
            Account__c = dpt.Id,
            Credit_Hours__c = 40,
            Description__c = 'Intro to Biology'
        );
        insert course;

        //Create Term
        term = new Term__c(
            Account__c = university.Id,
            Start_Date__c = System.today() + 5,
            End_Date__c = System.today() + 90
        );
        insert term;

        //Create faculty member
        faculty = new Contact(FirstName = 'Test', LastName = 'Testerson');
        insert faculty;
    }

    private static void enableCourseConnections() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Enable_Course_Connections__c = true,
                Faculty_RecType__c = UTIL_Describe_API.getFacultyConnectionRecType()
            )
        );
    }

    private static Boolean recordTypesExist() {
        return (UTIL_Describe_API.isValidField(
            UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'),
            'RecordTypeId'
        ) && UTIL_Describe_API.getFacultyConnectionRecType() != null);
    }

    /*********************************************************************************************************
     * @description Verifies that an Affiliation to the Department is automatically created when a Course Offering
     * with a value in the Faculty field is created and that Contact did not already have an Affiliation to that
     * Department.
     */
    @isTest
    public static void newCourseOffering() {
        setup();

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        Test.startTest();
        insert offering;
        Test.stopTest();

        //Since no previous Affl to the Dpt existed, an Affl should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__r.Id = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());
        System.assertEquals('Faculty', affls[0].Role__c);
        System.assertEquals(term.Start_Date__c, affls[0].StartDate__c);
        System.assertEquals(term.End_Date__c, affls[0].EndDate__c);

        //A Course Enrollment should have been automatically created
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(1, enrolls.size());
        //The Course Enrollment should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].ID, enrolls[0].Affiliation__c);

        //If a new Course Offering is created under the same Department and is taught by the same Faculty member, no additional
        //Affiliation should be created.
        Course_Offering__c offering2 = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Summer 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering2;
        affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__r.Id = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());
    }

    /*********************************************************************************************************
     * @description Verifies that a single Affiliation to the Department is automatically created when multiple
     * Course Offerings with a value in the Faculty field are created and that Contact did not already have an
     * Affiliation to that Department.
     */
    @isTest
    public static void multipleNewCourseOfferingsWithSameDepartmentAndFaculty() {
        setup();

        //Create Course Offerings with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        Course_Offering__c offering2 = new Course_Offering__c(
            Section_ID__c = 'BIO-102 Summer 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );

        Test.startTest();
        insert new List<Course_Offering__c>{ offering, offering2 };
        Test.stopTest();

        //Since no previous Affl to the Dpt existed, an Affl should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__c = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());
        System.assertEquals('Faculty', affls[0].Role__c);
        System.assertEquals(term.Start_Date__c, affls[0].StartDate__c);
        System.assertEquals(term.End_Date__c, affls[0].EndDate__c);

        //A Course Enrollment should have been automatically created for each Course Offering
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__c = :faculty.Id
        ];
        System.assertEquals(2, enrolls.size());
        //The Course Enrollments should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].ID, enrolls[0].Affiliation__c);
        System.assertEquals(affls[0].ID, enrolls[1].Affiliation__c);
    }

    /*********************************************************************************************************
     * @description Verifies that a single Affiliation to the Department is automatically created when multiple
     * Course Offerings with a value in the Faculty field are updated and that Contact did not already have an
     * Affiliation to that Department.
     */
    @isTest
    public static void addFacultyToMultipleCourseOfferingsNoPrevAffl() {
        setup();

        //Create Course Offerings without Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Term__c = term.Id,
            Capacity__c = 200
        );
        Course_Offering__c offering2 = new Course_Offering__c(
            Section_ID__c = 'BIO-102 Spring 16',
            Course__c = course.ID,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert new List<Course_Offering__c>{ offering, offering2 };

        //No affiliation should have been created
        List<Affiliation__c> affls = [SELECT ID FROM Affiliation__c];
        System.assertEquals(0, affls.size());

        //Add faculty to offerings
        offering.Faculty__c = faculty.Id;
        offering2.Faculty__c = faculty.Id;
        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update new List<Course_Offering__c>{ offering, offering2 };
        Test.stopTest();

        //An Affiliation should have been automatically created for the faculty member, if no Affiliation to that Department
        //already existed.
        affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__c = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());
        System.assertEquals('Faculty', affls[0].Role__c);
        System.assertEquals(term.Start_Date__c, affls[0].StartDate__c);
        System.assertEquals(term.End_Date__c, affls[0].EndDate__c);

        //A Course Enrollment should have been automatically created for each Course Offering
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__c = :faculty.Id
        ];
        System.assertEquals(2, enrolls.size());
        //The Course Enrollments should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].ID, enrolls[0].Affiliation__c);
        System.assertEquals(affls[0].ID, enrolls[1].Affiliation__c);
    }

    @isTest
    public static void addFacultyToOfferingPrevAffl() {
        setup();

        //Create affiliation from faculty member to dpt
        Affiliation__c affl = new Affiliation__c(Account__c = dpt.ID, Contact__c = faculty.ID);
        insert affl;

        List<Affiliation__c> affls = [SELECT Id FROM Affiliation__c];
        Integer afflsSize1 = affls.size();

        //Create Course Offering without Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //No new affiliations should have been created
        affls = [SELECT Id FROM Affiliation__c];
        System.assertEquals(afflsSize1, affls.size());

        //Add faculty to offering
        offering.Faculty__c = faculty.Id;
        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update offering;
        Test.stopTest();

        //Still no new affiliations should have been created
        affls = [SELECT Id FROM Affiliation__c];
        System.assertEquals(afflsSize1, affls.size());

        //A Course Enrollment should have been automatically created
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(1, enrolls.size());
        //The Course Enrollment should be linked to the existing Affiliation that already existed (and wasn't automatically created)
        System.assertEquals(affls[0].Id, enrolls[0].Affiliation__c);
    }

    /*********************************************************************************************************
     * @description Verifies that changing the Faculty on multiple Course Offerings for the same Departmenet does
     * not create duplicate Affiliation records and the existing Affiliation record is updated.
     */
    @isTest
    public static void changeFacultyWithMultipleCourseOfferings() {
        setup();

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        Course_Offering__c offering2 = new Course_Offering__c(
            Section_ID__c = 'BIO-102 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert new List<Course_Offering__c>{ offering, offering2 };

        //Since no previous Affl to the Dpt existed, an Affl should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__c = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());

        //A Course Enrollment should have been automatically created for each Course Offering
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__c = :faculty.Id
        ];
        System.assertEquals(2, enrolls.size());

        //Create second faculty member
        Contact faculty2 = new Contact(FirstName = 'Test', LastName = 'Testerson');
        insert faculty2;

        //Update Offerings & create new course offerings
        offering.Faculty__c = faculty2.Id;
        offering2.Faculty__c = faculty2.Id;
        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update new List<Course_Offering__c>{ offering, offering2 };
        Test.stopTest();

        //The affiliation should have been updated to point to the second faculty member
        affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__c = :faculty2.Id AND Role__c = 'Faculty' AND ID = :affls[0].ID
        ];
        System.assertEquals(1, affls.size());
        System.assertEquals('Faculty', affls[0].Role__c);
        System.assertEquals(term.Start_Date__c, affls[0].StartDate__c);
        System.assertEquals(term.End_Date__c, affls[0].EndDate__c);

        //The Course Enrollments of the old Faculty member should have been deleted
        enrolls = [SELECT ID FROM Course_Enrollment__c WHERE Contact__c = :faculty.Id];
        System.assertEquals(0, enrolls.size());

        //A Course Enrollment should have been automatically created for the new Faculty for each Course Offering
        List<Course_Enrollment__c> newEnrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__c = :faculty2.Id
        ];
        System.assertEquals(2, newEnrolls.size());
        //The Course Enrollment should have been linked to the Affiliation that was updated
        System.assertEquals(affls[0].ID, newEnrolls[0].Affiliation__c);
        System.assertEquals(affls[0].ID, newEnrolls[1].Affiliation__c);
    }

    @isTest
    public static void changeFacultyWithCourseConnEnabled() {
        if (recordTypesExist()) {
            enableCourseConnections();
            setup();

            //Create Course Offering with Faculty member
            Course_Offering__c offering = new Course_Offering__c(
                Section_ID__c = 'BIO-101 Spring 16',
                Course__c = course.ID,
                Faculty__c = faculty.Id,
                Term__c = term.Id,
                Capacity__c = 200
            );
            insert offering;

            //A Course Enrollment should have been automatically created
            List<Course_Enrollment__c> enrolls = [
                SELECT Contact__c, Course_Offering__c, Affiliation__c
                FROM Course_Enrollment__c
                WHERE Contact__r.Id = :faculty.Id
            ];
            System.assertEquals(1, enrolls.size());

            //Since no previous Affl to the Dpt existed, an Affl should have been automatically created for the faculty member
            List<Affiliation__c> affls = [
                SELECT Contact__c, Account__c, Role__c
                FROM Affiliation__c
                WHERE Contact__c = :faculty.Id AND Role__c = 'Faculty'
            ];
            System.assertEquals(1, affls.size());

            //Create second faculty member
            Contact faculty2 = new Contact(FirstName = 'Test', LastName = 'Testerson');
            insert faculty2;

            //Update Offering
            offering.Faculty__c = faculty2.Id;
            Test.startTest();
            TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
            update offering;
            Test.stopTest();

            //A new affiliation should have been created for the new Faculty
            affls = [
                SELECT Contact__c, Account__c, Role__c, (SELECT Id FROM Course_Enrollment__r)
                FROM Affiliation__c
                WHERE Contact__c = :faculty2.Id AND Role__c = 'Faculty'
            ];
            System.assertEquals(1, affls.size());
            System.assertEquals('Faculty', affls[0].Role__c);
            System.assertEquals(1, affls[0].Course_Enrollment__r.size());

            //The Course Enrollment of the old Faculty member should not have been deleted and should not be primary
            enrolls = [SELECT Id, Primary__c FROM Course_Enrollment__c WHERE Contact__r.Id = :faculty.Id];
            System.assertEquals(1, enrolls.size());
            System.assertEquals(false, enrolls[0].Primary__c);

            //A Course Enrollment should have been automatically created for the new Faculty
            List<Course_Enrollment__c> newEnrolls = [
                SELECT Contact__c, Course_Offering__c, Affiliation__c, Primary__c
                FROM Course_Enrollment__c
                WHERE Contact__r.Id = :faculty2.Id
            ];
            System.assertEquals(1, newEnrolls.size());
            System.assertEquals(true, newEnrolls[0].Primary__c);
            //The Course Enrollment should have been linked to the new Affiliation that was automatically created
            System.assertEquals(affls[0].Id, newEnrolls[0].Affiliation__c);
        }
    }

    @isTest
    public static void setFacultyToExistingConnWithCourseConnEnabled() {
        if (recordTypesExist()) {
            enableCourseConnections();
            setup();

            //Create Course Offering with Faculty member
            Course_Offering__c offering = new Course_Offering__c(
                Section_ID__c = 'BIO-101 Spring 16',
                Course__c = course.ID,
                Term__c = term.Id,
                Capacity__c = 200
            );
            insert offering;

            Course_Enrollment__c enroll = new Course_Enrollment__c(
                Contact__c = faculty.Id,
                Account__c = dpt.Id,
                Course_Offering__c = offering.Id,
                Primary__c = false
            );
            enroll.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
            insert enroll;

            //Update Offering
            offering.Faculty__c = faculty.Id;
            Test.startTest();
            TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
            update offering;
            Test.stopTest();

            //The Course Enrollment of the Faculty member should not have been created but marked primary
            List<Course_Enrollment__c> enrolls = [
                SELECT Id, Primary__c
                FROM Course_Enrollment__c
                WHERE Contact__r.Id = :faculty.Id
            ];
            System.assertEquals(1, enrolls.size());
            System.assertEquals(true, enrolls[0].Primary__c);
        }
    }

    @isTest
    public static void changeFacultyToExistingConnWithCourseConnEnabled() {
        if (recordTypesExist()) {
            enableCourseConnections();
            setup();

            //Create Course Offering with Faculty member
            Course_Offering__c offering = new Course_Offering__c(
                Section_ID__c = 'BIO-101 Spring 16',
                Course__c = course.ID,
                Faculty__c = faculty.Id,
                Term__c = term.Id,
                Capacity__c = 200
            );
            insert offering;

            //Create second faculty member
            Contact faculty2 = new Contact(FirstName = 'Test', LastName = 'Testerson');
            insert faculty2;

            //Create second Course Enrollment
            Course_Enrollment__c enroll = new Course_Enrollment__c(
                Contact__c = faculty2.Id,
                Account__c = dpt.Id,
                Course_Offering__c = offering.Id,
                Primary__c = false
            );
            enroll.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
            insert enroll;

            //Update Offering
            offering.Faculty__c = faculty2.Id;
            Test.startTest();
            TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
            update offering;
            Test.stopTest();

            //The Course Enrollment of the Faculty member should not have been created but marked primary
            List<Course_Enrollment__c> enrolls = [
                SELECT Id, Primary__c
                FROM Course_Enrollment__c
                WHERE Contact__r.Id = :faculty2.Id
            ];
            System.assertEquals(1, enrolls.size());
            System.assertEquals(true, enrolls[0].Primary__c);
        }
    }

    @isTest
    public static void facultyMadeNull() {
        setup();

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //An Affiliation should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__r.Id = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());

        //A Course Enrollment should have been automatically created
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(1, enrolls.size());
        //The Course Enrollment should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].ID, enrolls[0].Affiliation__c);

        //Update Offering
        offering.Faculty__c = null;
        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update offering;
        Test.stopTest();

        //The affiliation should have been deleted
        affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE ID = :affls[0].ID
        ];
        System.assertEquals(0, affls.size());

        //The Course Enrollment should have been deleted
        enrolls = [SELECT ID FROM Course_Enrollment__c WHERE Contact__r.Id = :faculty.Id];
        System.assertEquals(0, enrolls.size());
    }

    @isTest
    public static void facultyMadeNullWhenOtherEnrollmentsExist() {
        setup();

        // Create first Course Offering with Faculty member
        Course_Offering__c firstOffering = new Course_Offering__c(
            Section_Id__c = 'BIO-101 Spring 16 - 1',
            Course__c = course.Id,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert firstOffering;

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        //Create second Course Offering with Faculty member
        Course_Offering__c secondOffering = new Course_Offering__c(
            Section_Id__c = 'BIO-101 Spring 16 - 2',
            Course__c = course.Id,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert secondOffering;

        //An Affiliation should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Id, (SELECT Id FROM Course_Enrollment__r)
            FROM Affiliation__c
            WHERE Contact__r.Id = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());

        // The affiliation should have two Course Enrollments
        System.assertEquals(2, affls[0].Course_Enrollment__r.size());

        // Two Course Enrollments should have been automatically created
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(2, enrolls.size());
        //The Course Enrollments should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].Id, enrolls[0].Affiliation__c);
        System.assertEquals(affls[0].Id, enrolls[1].Affiliation__c);

        // Update first Offering
        firstOffering.Faculty__c = null;
        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update firstOffering;
        Test.stopTest();

        // The affiliation should not have been deleted
        affls = [SELECT Id, (SELECT Id FROM Course_Enrollment__r) FROM Affiliation__c WHERE Id = :affls[0].Id];
        System.assertEquals(1, affls.size());

        // The affiliation should have one Course Enrollment
        System.assertEquals(1, affls[0].Course_Enrollment__r.size());

        // One Course Enrollment should have been deleted
        enrolls = [SELECT Id FROM Course_Enrollment__c WHERE Contact__r.Id = :faculty.Id];
        System.assertEquals(1, enrolls.size());
    }

    @isTest
    public static void deleteMultipleCourseOfferingsWithFaculty() {
        setup();

        // Create first Course Offering with Faculty member
        Course_Offering__c firstOffering = new Course_Offering__c(
            Section_Id__c = 'BIO-101 Spring 16 - 1',
            Course__c = course.Id,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert firstOffering;

        //Create second Course Offering with Faculty member
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        Course_Offering__c secondOffering = new Course_Offering__c(
            Section_Id__c = 'BIO-101 Spring 16 - 2',
            Course__c = course.Id,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert secondOffering;

        //An Affiliation should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Id, (SELECT Id FROM Course_Enrollment__r)
            FROM Affiliation__c
            WHERE Contact__r.Id = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());

        // The affiliation should have two Course Enrollments
        System.assertEquals(2, affls[0].Course_Enrollment__r.size());

        // Two Course Enrollments should have been automatically created
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(2, enrolls.size());
        //The Course Enrollments should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].Id, enrolls[0].Affiliation__c);
        System.assertEquals(affls[0].Id, enrolls[1].Affiliation__c);

        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        delete new List<Course_Offering__c>{ firstOffering, secondOffering };
        Test.stopTest();

        // The two Course Enrollments should have been deleted
        enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(0, enrolls.size());

        // The affiliation should have been deleted
        affls = [SELECT Id, (SELECT Id FROM Course_Enrollment__r) FROM Affiliation__c WHERE Id = :affls[0].Id];
        System.assertEquals(0, affls.size());
    }

    @isTest
    public static void facultyMadeNullWithCourseConnEnabled() {
        if (recordTypesExist()) {
            enableCourseConnections();
            setup();

            //Create Course Offering with Faculty member
            Course_Offering__c offering = new Course_Offering__c(
                Section_ID__c = 'BIO-101 Spring 16',
                Course__c = course.Id,
                Faculty__c = faculty.Id,
                Term__c = term.Id,
                Capacity__c = 200
            );
            insert offering;

            //A Course Enrollment should have been automatically created
            List<Course_Enrollment__c> enrolls = [
                SELECT Contact__c, Course_Offering__c, Primary__c, Affiliation__c
                FROM Course_Enrollment__c
                WHERE Contact__r.Id = :faculty.Id
            ];
            System.assertEquals(1, enrolls.size());
            System.assertEquals(true, enrolls[0].Primary__c);
            //The Course Enrollment should have been linked to the Affiliation that was automatically created

            //An Affiliation should have been automatically created for the faculty member
            List<Affiliation__c> affls = [
                SELECT Contact__c, Account__c, Role__c
                FROM Affiliation__c
                WHERE Contact__c = :faculty.Id AND Role__c = 'Faculty'
            ];
            System.assertEquals(1, affls.size());

            System.assertEquals(affls[0].ID, enrolls[0].Affiliation__c);

            //Update Offering
            offering.Faculty__c = null;
            Test.startTest();
            TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
            update offering;
            Test.stopTest();

            //The affiliation should still exist
            affls = [
                SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
                FROM Affiliation__c
                WHERE Id = :affls[0].Id
            ];
            System.assertEquals(1, affls.size());

            //The Course Enrollment should have been marked as not Primary
            enrolls = [SELECT Id, Primary__c FROM Course_Enrollment__c WHERE Id = :enrolls[0].Id];
            System.assertEquals(false, enrolls[0].Primary__c);
        }
    }

    @isTest
    public static void deleteCourseOffering() {
        setup();

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.Id,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //An Affiliation should have been automatically created for the faculty member
        List<Affiliation__c> affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Contact__r.Id = :faculty.Id AND Role__c = 'Faculty'
        ];
        System.assertEquals(1, affls.size());

        //A Course Enrollment should have been automatically created
        List<Course_Enrollment__c> enrolls = [
            SELECT Contact__c, Course_Offering__c, Affiliation__c
            FROM Course_Enrollment__c
            WHERE Contact__r.Id = :faculty.Id
        ];
        System.assertEquals(1, enrolls.size());
        //The Course Enrollment should have been linked to the Affiliation that was automatically created
        System.assertEquals(affls[0].Id, enrolls[0].Affiliation__c);

        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        delete offering;
        Test.stopTest();

        //The affiliation should have been deleted
        affls = [
            SELECT Contact__c, Account__c, Role__c, StartDate__c, EndDate__c
            FROM Affiliation__c
            WHERE Id = :affls[0].Id
        ];
        System.assertEquals(0, affls.size());

        //The Course Enrollment should have been deleted
        enrolls = [SELECT Id FROM Course_Enrollment__c WHERE Contact__r.Id = :faculty.Id];
        System.assertEquals(0, enrolls.size());
    }

    @isTest
    public static void testGetAfflsForContact() {
        setup();

        Contact faculty1 = new Contact(FirstName = 'Test', LastName = 'Testerson1');
        Contact faculty2 = new Contact(FirstName = 'Test', LastName = 'Testerson2');
        Contact faculty3 = new Contact(FirstName = 'Test', LastName = 'Testerson3');
        Contact faculty4 = new Contact(FirstName = 'Test', LastName = 'Testerson4');
        insert new List<Contact>{ faculty1, faculty2, faculty3, faculty4 };

        Account dpt1 = new Account(
            Name = 'English Department',
            Parent = university,
            RecordTypeId = UTIL_Describe.getDepAccRecTypeID()
        );
        Account dpt2 = new Account(
            Name = 'CS Department',
            Parent = university,
            RecordTypeId = UTIL_Describe.getDepAccRecTypeID()
        );
        Account dpt3 = new Account(
            Name = 'Math Department',
            Parent = university,
            RecordTypeId = UTIL_Describe.getDepAccRecTypeID()
        );
        Account dpt4 = new Account(
            Name = 'Law Department',
            Parent = university,
            RecordTypeId = UTIL_Describe.getDepAccRecTypeID()
        );
        insert new List<Account>{ dpt1, dpt2, dpt3, dpt4 };

        Affiliation__c aff1 = new Affiliation__c(Contact__c = faculty1.ID, Account__c = dpt1.ID);
        Affiliation__c aff2 = new Affiliation__c(Contact__c = faculty4.ID, Account__c = dpt1.ID);
        Affiliation__c aff3 = new Affiliation__c(Contact__c = faculty2.ID, Account__c = dpt2.ID);
        Affiliation__c aff4 = new Affiliation__c(Contact__c = faculty4.ID, Account__c = dpt3.ID);
        Affiliation__c aff5 = new Affiliation__c(Contact__c = faculty1.ID, Account__c = dpt2.ID);
        Affiliation__c aff6 = new Affiliation__c(Contact__c = faculty3.ID, Account__c = dpt1.ID);
        Affiliation__c aff7 = new Affiliation__c(Contact__c = faculty1.ID, Account__c = dpt4.ID);
        Affiliation__c aff8 = new Affiliation__c(Contact__c = faculty2.ID, Account__c = dpt3.ID);
        insert new List<Affiliation__c>{ aff1, aff2, aff3, aff4, aff5, aff6, aff7, aff8 };

        COFF_Affiliation_TDTM tdtm = new COFF_Affiliation_TDTM();
        Map<ID, List<Affiliation__c>> facultyIDtoAffls = tdtm.getAfflsForContact(
            new List<ID>{ faculty1.ID, faculty2.ID, faculty3.ID, faculty4.ID }
        );

        Set<Affiliation__c> faculty1Affls = new Set<Affiliation__c>(facultyIDtoAffls.get(faculty1.ID));
        Set<Affiliation__c> faculty2Affls = new Set<Affiliation__c>(facultyIDtoAffls.get(faculty2.ID));
        Set<Affiliation__c> faculty3Affls = new Set<Affiliation__c>(facultyIDtoAffls.get(faculty3.ID));
        Set<Affiliation__c> faculty4Affls = new Set<Affiliation__c>(facultyIDtoAffls.get(faculty4.ID));
        System.assertEquals(true, faculty1Affls.contains(aff1));
        System.assertEquals(true, faculty1Affls.contains(aff5));
        System.assertEquals(true, faculty1Affls.contains(aff7));
        System.assertEquals(true, faculty2Affls.contains(aff3));
        System.assertEquals(true, faculty2Affls.contains(aff8));
        System.assertEquals(true, faculty3Affls.contains(aff6));
        System.assertEquals(true, faculty4Affls.contains(aff2));
        System.assertEquals(true, faculty4Affls.contains(aff4));
    }

    @isTest
    public static void testAfflToDptExists() {
        setup();

        //dpt is the parent Account of course
        insert new Affiliation__c(Contact__c = faculty.ID, Account__c = dpt.ID);

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //An Affiliation from the faculty member to the Department should already exist
        offering = [SELECT Faculty__c, Course__r.Account__c FROM Course_Offering__c WHERE ID = :offering.ID];
        COFF_Affiliation_TDTM tdtm = new COFF_Affiliation_TDTM();
        Map<ID, List<Affiliation__c>> facultyIDtoAffls = tdtm.getAfflsForContact(new List<ID>{ faculty.ID });
        Affiliation__c afflToDpt = tdtm.affiliationToAccount(offering, facultyIDtoAffls);
        System.assertNotEquals(null, afflToDpt.Id);
    }

    @isTest
    public static void newCourseOfferingNoDates() {
        setup();

        //Create Course Offering
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        Test.startTest();
        insert offering;
        Test.stopTest();

        //Since no dates were entered for the Course Offering, the dates from the parent term should have been copied
        offering = [SELECT Start_Date__c, End_Date__c FROM Course_Offering__c WHERE ID = :offering.ID];
        System.assertEquals(System.today() + 5, offering.Start_Date__c);
        System.assertEquals(System.today() + 90, offering.End_Date__c);
    }

    @isTest
    public static void newCourseOfferingWithDates() {
        setup();

        //Create Course Offering
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200,
            Start_Date__c = System.today() + 10,
            End_Date__c = System.today() + 100
        );
        Test.startTest();
        insert offering;
        Test.stopTest();

        //The dates entered when creating the Course Offering should not have been overridden
        offering = [SELECT Start_Date__c, End_Date__c FROM Course_Offering__c WHERE ID = :offering.ID];
        System.assertEquals(System.today() + 10, offering.Start_Date__c);
        System.assertEquals(System.today() + 100, offering.End_Date__c);
    }

    @isTest
    public static void testUpdateConnectionsOnFacultyChangeUpdateExisting() {
        setup();
        enableCourseConnections();

        Boolean courseConnectionsHasRecordTypeIdField = UTIL_Describe_API.isValidField(
            UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'),
            'RecordTypeId'
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, true);

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //Create Primary Course Connection for the Faculty member
        Course_Enrollment__c conn = new Course_Enrollment__c(
            Contact__c = faculty.Id,
            Course_Offering__c = offering.Id,
            Primary__c = true
        );
        if (UTIL_Describe_API.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId')) {
            conn.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
        }
        insert conn;

        Contact faculty2 = new Contact(FirstName = 'Test', LastName = 'Testerson2');
        insert faculty2;

        //Create Non-Primary Course Connection for the Faculty member
        Course_Enrollment__c conn2 = new Course_Enrollment__c(
            Contact__c = faculty2.Id,
            Course_Offering__c = offering.Id
        );
        if (UTIL_Describe_API.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId')) {
            conn2.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
        }
        insert conn2;

        Test.startTest();
        offering.Faculty__c = faculty2.Id;
        update offering;
        Test.stopTest();

        List<Course_Enrollment__c> courseConnections = [SELECT Id, Primary__c, Contact__c FROM Course_Enrollment__c];

        System.assertEquals(2, courseConnections.size());

        for (Course_Enrollment__c courseConnection : courseConnections) {
            if (!courseConnectionsHasRecordTypeIdField) {
                System.assertEquals(false, courseConnection.Primary__c);
            } else if (courseConnection.Contact__c == faculty.Id) {
                System.assertEquals(false, courseConnection.Primary__c);
            } else {
                System.assertEquals(true, courseConnection.Primary__c);
            }
        }
    }

    @isTest
    public static void testUpdateConnectionsOnFacultyChangeInsertNew() {
        setup();
        enableCourseConnections();

        Boolean courseConnectionsHasRecordTypeIdField = UTIL_Describe_API.isValidField(
            UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'),
            'RecordTypeId'
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, true);

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //Create Primary Course Connection for the Faculty member
        Course_Enrollment__c conn = new Course_Enrollment__c(
            Contact__c = faculty.Id,
            Course_Offering__c = offering.Id,
            Primary__c = true
        );

        if (courseConnectionsHasRecordTypeIdField) {
            conn.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
        }
        insert conn;

        Contact faculty2 = new Contact(FirstName = 'Test', LastName = 'Testerson2');
        insert faculty2;

        Test.startTest();
        offering.Faculty__c = faculty2.Id;
        update offering;
        Test.stopTest();

        List<Course_Enrollment__c> courseConnections = [SELECT Id, Primary__c, Contact__c FROM Course_Enrollment__c];

        //This is necessary to account for record type existence as the test changes behavior based on the existence of a record type id field
        if (courseConnectionsHasRecordTypeIdField) {
            System.assertEquals(2, courseConnections.size());
        } else {
            System.assertEquals(1, courseConnections.size());
        }

        for (Course_Enrollment__c courseConnection : courseConnections) {
            if (!courseConnectionsHasRecordTypeIdField) {
                System.assertEquals(false, courseConnection.Primary__c);
            } else if (courseConnection.Contact__c == faculty.Id) {
                System.assertEquals(false, courseConnection.Primary__c);
            } else {
                System.assertEquals(true, courseConnection.Primary__c);
            }
        }
    }

    @isTest
    public static void testUpdateConnectionsOnFacultyRemove() {
        setup();

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, true);

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        //Create Primary Course Connection for the Faculty member
        Course_Enrollment__c conn = new Course_Enrollment__c(
            Contact__c = faculty.Id,
            Course_Offering__c = offering.Id,
            Primary__c = true
        );
        if (UTIL_Describe_API.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId')) {
            conn.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
        }
        insert conn;

        List<Id> removedFacultyIds = new List<Id>{ faculty.Id };
        Set<Id> offsWithRemovedFaculty = new Set<Id>{ offering.Id };

        List<SObject> objectsToUpdate = new List<SObject>();

        COFF_Affiliation_TDTM cls = new COFF_Affiliation_TDTM();

        Test.startTest();
        cls.updateConnectionsOnFacultyRemove(removedFacultyIds, offsWithRemovedFaculty, objectsToUpdate);
        Test.stopTest();

        System.assertEquals(1, objectsToUpdate.size());
        System.assertEquals(objectsToUpdate[0].get('Primary__c'), false);
    }

    @isTest
    public static void testUpdateConnectionsOnFacultyAddInsertNew() {
        setup();

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, true);

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        List<Course_Offering__c> offerings = new List<Course_Offering__c>{ offering };

        List<SObject> objectsToInsert = new List<SObject>();
        List<SObject> objectsToUpdate = new List<SObject>();

        COFF_Affiliation_TDTM cls = new COFF_Affiliation_TDTM();

        Test.startTest();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        cls.updateConnectionsOnFacultyAdd(offerings, objectsToInsert, objectsToUpdate);
        Test.stopTest();

        System.assertEquals(0, objectsToUpdate.size());
        System.assertEquals(1, objectsToInsert.size());
        System.assertEquals(objectsToInsert[0].get('Primary__c'), true);
    }

    @isTest
    public static void testUpdateConnectionsOnFacultyAddUpdateExisting() {
        setup();

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, true);

        //Create Course Offering with Faculty member
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        insert offering;

        Course_Enrollment__c conn = new Course_Enrollment__c(Contact__c = faculty.Id, Course_Offering__c = offering.Id);
        if (UTIL_Describe_API.isValidField(UTIL_Namespace.StrTokenNSPrefix('Course_Enrollment__c'), 'RecordTypeId')) {
            conn.put('RecordTypeId', UTIL_Describe_API.getFacultyConnectionRecType());
        }
        insert conn;

        List<Course_Offering__c> offerings = new List<Course_Offering__c>{ offering };

        List<SObject> objectsToInsert = new List<SObject>();
        List<SObject> objectsToUpdate = new List<SObject>();

        COFF_Affiliation_TDTM cls = new COFF_Affiliation_TDTM();

        Test.startTest();
        cls.updateConnectionsOnFacultyAdd(offerings, objectsToInsert, objectsToUpdate);
        Test.stopTest();

        System.assertEquals(1, objectsToUpdate.size());
        System.assertEquals(0, objectsToInsert.size());
        System.assertEquals(objectsToUpdate[0].get('Primary__c'), true);
    }

    @isTest
    public static void testUpdateMultipleConnectionsOnFacultyAddUpdateExisting() {
        setup();

        //Create Course Offerings with same Faculty member
        List<Course_Offering__c> offerings = new List<Course_Offering__c>();
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        Course_Offering__c offering2 = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        offerings.add(offering);
        offerings.add(offering2);
        insert offerings;

        Contact newFaculty = new Contact(FirstName = 'Test2', LastName = 'Test2');
        insert newFaculty;

        Course_Enrollment__c conn = [
            SELECT Id, Contact__c
            FROM Course_Enrollment__c
            WHERE Course_Offering__c = :offering2.Id
            LIMIT 1
        ];

        Test.startTest();
        offering2.Faculty__c = newFaculty.Id;
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update offering2;
        Test.stopTest();

        //assert
        List<Course_Enrollment__c> resultConns = [
            SELECT Id, Contact__c
            FROM Course_Enrollment__c
            WHERE Course_Offering__c = :offering2.Id
        ];
        //course offering still has only one course connection
        system.assertEquals(1, resultConns.size());
        //the faculty of course offering is changed to new faculty
        system.assertEquals(newFaculty.Id, resultConns[0].Contact__c);
        //course offering has a different course connection
        system.assertNotEquals(conn.Id, resultConns[0].Id);
    }

    @isTest
    public static void testUpdateCourseOfferingWithPrimaryFacultyIfAfflMissing() {
        setup();

        //Create Course Offerings with same Faculty member
        List<Course_Offering__c> offerings = new List<Course_Offering__c>();
        Course_Offering__c offering = new Course_Offering__c(
            Section_ID__c = 'BIO-101 Spring 16',
            Course__c = course.ID,
            Faculty__c = faculty.Id,
            Term__c = term.Id,
            Capacity__c = 200
        );
        offerings.add(offering);
        insert offerings;

        Contact newFaculty = UTIL_UnitTestData_TEST.getContact();
        insert newFaculty;

        Affiliation__c oldAffl = [SELECT Id FROM Affiliation__c WHERE Contact__c = :faculty.Id];
        delete oldAffl;

        Test.startTest();
        offering.Faculty__c = newFaculty.Id;
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.COFF_Affiliation_TDTM, false);
        update offering;
        Test.stopTest();

        //assert
        List<Affiliation__c> affls = [SELECT Contact__c FROM Affiliation__c];
        //There should be only one affliation
        system.assertEquals(1, affls.size());
        //The contact of affiliation should be new faculty
        system.assertEquals(newFaculty.Id, affls[0].Contact__c);
    }
}
/*
    Copyright (c) 2020, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORSå
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2020
 * @group Course Offering
 * @group-content ../../ApexDocContent/CourseOfferings.htm
 * @description Tests for COFF_CannotDelete_TDTM.
 */
@isTest
private with sharing class COFF_CannotDelete_TEST {
    /*********************************************************************************************************
     * @description Test method to test the following:
     * (1) If Prevent_Course_Offering_Deletion__c is enabled in Hierarchy Settings, and a Course Offering
     * has child records, it cannot be deleted.
     * (2) If Prevent_Course_Offering_Deletion__c is enabled in Hierarchy Settings, and a Course Offering
     * does not have any child records, it can be deleted.
     */
    @isTest
    private static void testPreventCourseOfferingDeletion() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Course_Offering_Deletion__c = true
            )
        );

        Contact[] contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(6);
        insert contacts;

        List<Course_Offering__c> courseOfferings = new List<Course_Offering__c>();
        Course_Offering__c courseOffering1 = UTIL_UnitTestData_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering2 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering3 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering4 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering5 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering6 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering7 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        courseOfferings.add(courseOffering1);
        courseOfferings.add(courseOffering2);
        courseOfferings.add(courseOffering3);
        courseOfferings.add(courseOffering4);
        courseOfferings.add(courseOffering5);
        courseOfferings.add(courseOffering6);
        courseOfferings.add(courseOffering7);

        List<Course_Enrollment__c> courseConnections = new List<Course_Enrollment__c>();
        Course_Enrollment__c courseConnection1 = UTIL_UnitTestdata_TEST.getCourseConnection(
            contacts[0].Id,
            courseOfferings[0].Id
        );
        Course_Enrollment__c courseConnection2 = UTIL_UnitTestdata_TEST.getCourseConnection(
            contacts[1].Id,
            courseOfferings[1].Id
        );
        Course_Enrollment__c courseConnection3 = UTIL_UnitTestdata_TEST.getCourseConnection(
            contacts[3].Id,
            courseOfferings[3].Id
        );
        courseConnections.add(courseConnection1);
        courseConnections.add(courseConnection2);
        courseConnections.add(courseConnection3);
        insert courseConnections;

        List<Course_Offering_Schedule__c> courseOfferingSchedules = new List<Course_Offering_Schedule__c>();
        Course_Offering_Schedule__c courseOfferingSchedule1 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[0].Id
        );
        Course_Offering_Schedule__c courseOfferingSchedule2 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[1].Id
        );
        Course_Offering_Schedule__c courseOfferingSchedule3 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[2].Id
        );
        Course_Offering_Schedule__c courseOfferingSchedule4 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[5].Id
        );
        courseOfferingSchedules.add(courseOfferingSchedule1);
        courseOfferingSchedules.add(courseOfferingSchedule2);
        courseOfferingSchedules.add(courseOfferingSchedule3);
        courseOfferingSchedules.add(courseOfferingSchedule4);
        insert courseOfferingSchedules;

        List<Term_Grade__c> termGrades = new List<Term_Grade__c>();
        Term_Grade__c termGrade1 = UTIL_UnitTestData_TEST.getTermGrade(null, null, courseConnections[0].Id);
        Term_Grade__c termGrade2 = UTIL_UnitTestData_TEST.getTermGrade(null, null, courseConnections[1].Id);
        Term_Grade__c termGrade3 = UTIL_UnitTestData_TEST.getTermGrade(null, null, courseConnections[2].Id);
        termGrades.add(termGrade1);
        termGrades.add(termGrade2);
        termGrades.add(termGrade3);
        insert termGrades;

        Test.startTest();
        Database.DeleteResult[] results = Database.delete(courseOfferings, false);
        Test.stopTest();

        //Verifies only 1 Course Offering was deleted
        List<Course_Offering__c> returnCourseOfferings = [
            SELECT Id
            FROM Course_Offering__c
            WHERE Id IN :courseOfferings
        ];
        System.assertEquals(5, returnCourseOfferings.size());

        //Verifies Course Offering with Course Connection was not deleted
        System.assertEquals(false, results[3].success);
        System.assertEquals(Label.CannotDelete, results[3].errors[0].message);

        //Verifies Course Offering with Course Offering Schedule was not deleted
        System.assertEquals(false, results[5].success);
        System.assertEquals(Label.CannotDelete, results[5].errors[0].message);

        //Verifies Course Offering with Term Grade and Course Connection was not deleted
        System.assertEquals(false, results[0].success);
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);

        //Verifies Course Offering with Term Grade and Course Offering Schedule was not deleted
        System.assertEquals(false, results[2].success);
        System.assertEquals(Label.CannotDelete, results[2].errors[0].message);

        //Verifies Course Offering with Term Grade, Course Connection, and Course Offering Schedule was not deleted
        System.assertEquals(false, results[1].success);
        System.assertEquals(Label.CannotDelete, results[1].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test the following:
     * (1) If Prevent_Course_Offering_Deletion__c is disabled in Hierarchy Settings, and a Course Offering
     * has child records, it can be deleted.
     * (2) If Prevent_Course_Offering_Deletion__c is disabled in Hierarchy Settings, and a Course Offering
     * does not have any child records, it can be deleted.
     */
    @isTest
    private static void testAllowCourseOfferingDeletion() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Course_Offering_Deletion__c = false
            )
        );

        Contact[] contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(6);
        insert contacts;

        List<Course_Offering__c> courseOfferings = new List<Course_Offering__c>();
        Course_Offering__c courseOffering1 = UTIL_UnitTestData_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering2 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering3 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering4 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering5 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering6 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        Course_Offering__c courseOffering7 = UTIL_UnitTestdata_TEST.createCourseOffering(null, null);
        courseOfferings.add(courseOffering1);
        courseOfferings.add(courseOffering2);
        courseOfferings.add(courseOffering3);
        courseOfferings.add(courseOffering4);
        courseOfferings.add(courseOffering5);
        courseOfferings.add(courseOffering6);
        courseOfferings.add(courseOffering7);

        List<Course_Enrollment__c> courseConnections = new List<Course_Enrollment__c>();
        Course_Enrollment__c courseConnection1 = UTIL_UnitTestdata_TEST.getCourseConnection(
            contacts[0].Id,
            courseOfferings[0].Id
        );
        Course_Enrollment__c courseConnection2 = UTIL_UnitTestdata_TEST.getCourseConnection(
            contacts[1].Id,
            courseOfferings[1].Id
        );
        Course_Enrollment__c courseConnection3 = UTIL_UnitTestdata_TEST.getCourseConnection(
            contacts[3].Id,
            courseOfferings[3].Id
        );
        courseConnections.add(courseConnection1);
        courseConnections.add(courseConnection2);
        courseConnections.add(courseConnection3);
        insert courseConnections;

        List<Course_Offering_Schedule__c> courseOfferingSchedules = new List<Course_Offering_Schedule__c>();
        Course_Offering_Schedule__c courseOfferingSchedule1 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[0].Id
        );
        Course_Offering_Schedule__c courseOfferingSchedule2 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[1].Id
        );
        Course_Offering_Schedule__c courseOfferingSchedule3 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[2].Id
        );
        Course_Offering_Schedule__c courseOfferingSchedule4 = UTIL_UnitTestdata_TEST.createCourseOfferingSchedule(
            courseOfferings[5].Id
        );
        courseOfferingSchedules.add(courseOfferingSchedule1);
        courseOfferingSchedules.add(courseOfferingSchedule2);
        courseOfferingSchedules.add(courseOfferingSchedule3);
        courseOfferingSchedules.add(courseOfferingSchedule4);
        insert courseOfferingSchedules;

        List<Term_Grade__c> termGrades = new List<Term_Grade__c>();
        Term_Grade__c termGrade1 = UTIL_UnitTestData_TEST.getTermGrade(null, null, courseConnections[0].Id);
        Term_Grade__c termGrade2 = UTIL_UnitTestData_TEST.getTermGrade(null, null, courseConnections[1].Id);
        Term_Grade__c termGrade3 = UTIL_UnitTestData_TEST.getTermGrade(null, null, courseConnections[2].Id);
        termGrades.add(termGrade1);
        termGrades.add(termGrade2);
        termGrades.add(termGrade3);
        insert termGrades;

        Test.startTest();
        Database.DeleteResult[] results = Database.delete(courseOfferings, false);
        Test.stopTest();

        //Verifies all Course Offerings were deleted
        List<Course_Offering__c> returnCourseOfferings = [
            SELECT Id
            FROM Course_Offering__c
            WHERE Id IN :courseOfferings
        ];
        System.assertEquals(0, returnCourseOfferings.size());
    }
}

/*
    Copyright (c) 2016, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2016
 * @group Contacts
 * @group-content ../../ApexDocContent/Contacts.htm
 * @description Tests for CON_CannotDelete_TDTM.
 */
@isTest
private with sharing class CON_CannotDelete_TEST {
    /**************************************************************************************************************************
     ****************************************************** FUNCTIONAL TESTS ***************************************************
     **************************************************************************************************************************/

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Address record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithAddress() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        UTIL_UnitTestData_TEST.ContactsWithAddrs consAccsAddrs = UTIL_UnitTestData_TEST.createTestContactsAddrs(2);

        List<Contact> returnNewContacts = consAccsAddrs.contacts;

        List<Contact> queryContacts = [SELECT Id FROM Contact WHERE Id IN :returnNewContacts];

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(queryContacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :queryContacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Affiliation record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithAffiliation() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Affiliation__c affiliation1 = UTIL_UnitTestData_TEST.getAffiliation(contacts[0].Id, acc.Id, false);
        Affiliation__c affiliation2 = UTIL_UnitTestData_TEST.getAffiliation(contacts[1].Id, acc.Id, false);

        insert new List<Affiliation__c>{ affiliation1, affiliation2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnedContactsList = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnedContactsList.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Applicant Application record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithApplicant() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Spring 2020');

        Application__c application1 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[0].Id, term.Id);
        Application__c application2 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);

        insert new List<Application__c>{ application1, application2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Preparer Application record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithAppPreparer() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Spring 2020');

        Application__c application1 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[0].Id, term.Id);
        application1.Preparer__c = contacts[1].Id;
        Application__c application2 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);
        application2.Preparer__c = contacts[0].Id;

        insert new List<Application__c>{ application1, application2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Attendance record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithAttendance() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Attendance_Event__c attendanceEvent1 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent1.Date__c = System.today();
        attendanceEvent1.Contact__c = contacts[0].Id;

        Attendance_Event__c attendanceEvent2 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent2.Date__c = System.today();
        attendanceEvent2.Contact__c = contacts[1].Id;

        insert new List<Attendance_Event__c>{ attendanceEvent1, attendanceEvent2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Credential Attribute record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithAttributeCredentials() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Id credentialRecTypeId = UTIL_Describe_API.getCredentialAttributeRecType();

        Attribute__c attribute1 = UTIL_UnitTestData_TEST.getAttribute('TestCred1', contacts[0].Id, credentialRecTypeId);
        Attribute__c attribute2 = UTIL_UnitTestData_TEST.getAttribute('TestCred2', contacts[1].Id, credentialRecTypeId);

        insert new List<Attribute__c>{ attribute1, attribute2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Student Attribute record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithAttributeStudent() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Id studentCharRecTypeId = UTIL_Describe_API.getStudentCharacteristicAttributeRecType();

        Attribute__c attribute1 = UTIL_UnitTestData_TEST.getAttribute(
            'TestCred1',
            contacts[0].Id,
            studentCharRecTypeId
        );
        Attribute__c attribute2 = UTIL_UnitTestData_TEST.getAttribute(
            'TestCred2',
            contacts[1].Id,
            studentCharRecTypeId
        );

        insert new List<Attribute__c>{ attribute1, attribute2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Behavior Involvement record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithBehaviorInvolvement() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Case case1 = UTIL_UnitTestData_TEST.getCase(null, 'School Code of Conduct', 'Current');
        case1.AccountId = acc.Id;
        Case case2 = UTIL_UnitTestData_TEST.getCase(null, 'School Code of Conduct', 'Current');
        case2.AccountId = acc.Id;

        insert new List<case>{ case1, case2 };

        Behavior_Involvement__c behaviorInvolvement1 = UTIL_UnitTestData_TEST.getBehaviorInvolvementRecord(
            contacts[0].Id,
            case1.Id,
            'Reporter'
        );
        Behavior_Involvement__c behaviorInvolvement2 = UTIL_UnitTestData_TEST.getBehaviorInvolvementRecord(
            contacts[1].Id,
            case2.Id,
            'Reporter'
        );

        insert new List<Behavior_Involvement__c>{ behaviorInvolvement1, behaviorInvolvement2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Contact Language record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithConLanguage() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Language__c language = UTIL_UnitTestData_TEST.createLanguage('Italian');

        Contact_Language__c contactLanguage1 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[0].Id,
            false
        );
        Contact_Language__c contactLanguage2 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[1].Id,
            false
        );

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Course Offering record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithCourseOffering() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOfferings1 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOfferings1.Faculty__c = contacts[0].Id;

        Course_Offering__c courseOfferings2 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOfferings2.Faculty__c = contacts[1].Id;

        update new List<Course_Offering__c>{ courseOfferings1, courseOfferings2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Student Course Connection record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithStudentCourseCxn() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);

        Id studentCourseCxnRecTypeId = UTIL_Describe_API.getStudentConnectionRecType();

        Course_Enrollment__c studentCourseCxn1 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[0].Id,
            courseOffering.Id
        );
        studentCourseCxn1.Status__c = 'Current';

        Course_Enrollment__c studentCourseCxn2 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[1].Id,
            courseOffering.Id
        );
        studentCourseCxn2.Status__c = 'Current';

        insert new List<Course_Enrollment__c>{ studentCourseCxn1, studentCourseCxn2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Education History record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithEduHistory() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Education_History__c eduHis = UTIL_UnitTestData_Test.getEduHistory(null, contacts[0].Id);
        insert eduHis;

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that only one of the Contact records was deleted
        System.assertEquals(1, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Faculty Course Connection record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithFacultyCourseCxn() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);

        Id studentCourseCxnRecTypeId = UTIL_Describe_API.getFacultyConnectionRecType();

        Course_Enrollment__c studentCourseCxn1 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[0].Id,
            courseOffering.Id
        );
        studentCourseCxn1.Status__c = 'Current';

        Course_Enrollment__c studentCourseCxn2 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[1].Id,
            courseOffering.Id
        );
        studentCourseCxn2.Status__c = 'Current';

        insert new List<Course_Enrollment__c>{ studentCourseCxn1, studentCourseCxn2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Program Enrollment record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithProgramEnrollment() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Program_Enrollment__c programEnrollment1 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment1.Contact__c = contacts[0].Id;

        Program_Enrollment__c programEnrollment2 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment2.Contact__c = contacts[1].Id;

        insert new List<Program_Enrollment__c>{ programEnrollment1, programEnrollment2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Term Grade record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithTermGrade() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering1 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        Course_Offering__c courseOffering2 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);

        courseOffering1.Faculty__c = contacts[0].Id;
        courseOffering2.Faculty__c = contacts[1].Id;

        List<Course_Offering__c> courseOfferings = new List<Course_Offering__c>();
        courseOfferings.add(courseOffering1);
        courseOfferings.add(courseOffering2);
        update courseOfferings;

        Term_Grade__c termGrade1 = UTIL_UnitTestData_TEST.getTermGrade(contacts[0].Id, courseOfferings[0].Id, null);
        Term_Grade__c termGrade2 = UTIL_UnitTestData_TEST.getTermGrade(contacts[1].Id, courseOfferings[1].Id, null);

        insert new List<Term_Grade__c>{ termGrade1, termGrade2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has a Test record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCannotDeleteWithTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Test__c testRecord1 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[0].Id);
        Test__c testRecord2 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[1].Id);

        insert new List<Test__c>{ testRecord1, testRecord2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that none of the Contact records were deleted
        System.assertEquals(2, returnContacts.size());
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has an Address record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithAddress() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        UTIL_UnitTestData_TEST.ContactsWithAddrs consAccsAddrs = UTIL_UnitTestData_TEST.createTestContactsAddrs(2);

        List<Contact> returnNewContacts = consAccsAddrs.contacts;

        List<Contact> queryContacts = [SELECT Id FROM Contact WHERE Id IN :returnNewContacts];

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(queryContacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :queryContacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has an Affiliation record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithAffiliation() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Affiliation__c affiliation1 = UTIL_UnitTestData_TEST.getAffiliation(contacts[0].Id, acc.Id, false);
        Affiliation__c affiliation2 = UTIL_UnitTestData_TEST.getAffiliation(contacts[1].Id, acc.Id, false);

        insert new List<Affiliation__c>{ affiliation1, affiliation2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact the records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has an Applicant Application record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithApplicant() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Application__c applicant1 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[0].Id, term.Id);
        Application__c applicant2 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);

        insert new List<Application__c>{ applicant1, applicant2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has an Preparer Application record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithAppPreparer() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Application__c applicant1 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[0].Id, term.Id);
        applicant1.Preparer__c = contacts[1].Id;
        Application__c applicant2 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);
        applicant2.Preparer__c = contacts[0].Id;

        insert new List<Application__c>{ applicant1, applicant2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and
     * Contact has an Attendance record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCanDeleteWithAttendance() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Attendance_Event__c attendanceEvent1 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent1.Date__c = System.today();
        attendanceEvent1.Contact__c = contacts[0].Id;

        Attendance_Event__c attendanceEvent2 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent2.Date__c = System.today();
        attendanceEvent2.Contact__c = contacts[1].Id;

        insert new List<Attendance_Event__c>{ attendanceEvent1, attendanceEvent2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Credential Attribute record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithAttributeCredentials() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Id credentialRecTypeId = UTIL_Describe_API.getCredentialAttributeRecType();
        Attribute__c credentialAttribute1 = UTIL_UnitTestData_TEST.getAttribute(
            'TestCred1',
            contacts[0].Id,
            credentialRecTypeId
        );
        Attribute__c credentialAttribute2 = UTIL_UnitTestData_TEST.getAttribute(
            'TestCred2',
            contacts[1].Id,
            credentialRecTypeId
        );

        insert new List<Attribute__c>{ credentialAttribute1, credentialAttribute2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Behavior Involvement record associated to it, that it cannot be deleted.
     */
    @isTest
    private static void conCanDeleteWithBehaviorInvolvement() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Case case1 = UTIL_UnitTestData_TEST.getCase(null, 'School Code of Conduct', 'Current');
        case1.AccountId = acc.Id;
        Case case2 = UTIL_UnitTestData_TEST.getCase(null, 'School Code of Conduct', 'Current');
        case2.AccountId = acc.Id;

        insert new List<case>{ case1, case2 };

        Behavior_Involvement__c behaviorInvolvement1 = UTIL_UnitTestData_TEST.getBehaviorInvolvementRecord(
            contacts[0].Id,
            case1.Id,
            'Reporter'
        );
        Behavior_Involvement__c behaviorInvolvement2 = UTIL_UnitTestData_TEST.getBehaviorInvolvementRecord(
            contacts[1].Id,
            case2.Id,
            'Reporter'
        );

        insert new List<Behavior_Involvement__c>{ behaviorInvolvement1, behaviorInvolvement2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Contact Language record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithConLanguage() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Language__c language = UTIL_UnitTestData_TEST.createLanguage('Spanish');
        Contact_Language__c contactLanguage1 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[0].Id,
            false
        );
        Contact_Language__c contactLanguage2 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[1].Id,
            false
        );

        update new List<Contact_Language__c>{ contactLanguage1, contactLanguage2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Course Offering record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithCourseOffering() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering1 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOffering1.Faculty__c = contacts[0].Id;
        update courseOffering1;

        Course_Offering__c courseOffering2 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOffering2.Faculty__c = contacts[1].Id;
        update courseOffering2;

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Student Course Connection record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithStudentCourseCxn() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);

        Id studentCourseCxnRecTypeId = UTIL_Describe_API.getStudentConnectionRecType();

        Course_Enrollment__c studentCourseCxn1 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[0].Id,
            courseOffering.Id
        );
        studentCourseCxn1.Status__c = 'Current';

        Course_Enrollment__c studentCourseCxn2 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[1].Id,
            courseOffering.Id
        );
        studentCourseCxn2.Status__c = 'Current';

        insert new List<Course_Enrollment__c>{ studentCourseCxn1, studentCourseCxn2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Faculty Course Connection record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithFacultyCourseCxn() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);

        Id studentCourseCxnRecTypeId = UTIL_Describe_API.getFacultyConnectionRecType();
        Course_Enrollment__c studentCourseCxn1 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[0].Id,
            courseOffering.Id
        );
        studentCourseCxn1.Status__c = 'Current';

        Course_Enrollment__c studentCourseCxn2 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[1].Id,
            courseOffering.Id
        );
        studentCourseCxn2.Status__c = 'Current';

        insert new List<Course_Enrollment__c>{ studentCourseCxn1, studentCourseCxn2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Program Enrollment record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithProgramEnrollment() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Program_Enrollment__c programEnrollment1 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment1.Contact__c = contacts[0].Id;

        Program_Enrollment__c programEnrollment2 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment2.Contact__c = contacts[1].Id;

        insert new List<Program_Enrollment__c>{ programEnrollment1, programEnrollment2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Term Grade record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithTermGrade() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Course_Offering__c courseOffering1 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOffering1.Faculty__c = contacts[0].Id;

        Course_Offering__c courseOffering2 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOffering2.Faculty__c = contacts[1].Id;

        List<Course_Offering__c> courseOfferings = new List<Course_Offering__c>();
        courseOfferings.add(courseOffering1);
        courseOfferings.add(courseOffering2);

        update courseOfferings;

        Term_Grade__c termGrade1 = UTIL_UnitTestData_TEST.getTermGrade(contacts[0].Id, courseOfferings[0].Id, null);
        Term_Grade__c termGrade2 = UTIL_UnitTestData_TEST.getTermGrade(contacts[1].Id, courseOfferings[1].Id, null);

        insert new List<Term_Grade__c>{ termGrade1, termGrade2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and
     * Contact has a Test record associated to it, that it can be deleted.
     */
    @isTest
    private static void conCanDeleteWithTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Test__c testRecord1 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[0].Id);
        Test__c testRecord2 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[1].Id);

        insert new List<Test__c>{ testRecord1, testRecord2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        //Verify that all of Contact records were deleted
        System.assertEquals(0, returnContacts.size());
    }

    /**************************************************************************************************************************
     * @description Test if contacts can be merged when prevent deletion is enabled
     */
    @isTest
    static void conCanMerge() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));

        Contact contactWithChildRecords = UTIL_UnitTestData_TEST.createTestContactWithMultipleRelations();
        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts[1]; //Use the second contact as master to avoid duplicate error

        Test.startTest();
        merge contacts[1] contactWithChildRecords;
        Test.stopTest();

        // Ensure loser contact is deleted
        List<Contact> mergeLoserContacts = [
            SELECT Id, MasterRecordId, IsDeleted
            FROM Contact
            WHERE Id = :contactWithChildRecords.Id
            ALL ROWS
        ];
        System.assertEquals(1, mergeLoserContacts.size(), 'There should be 1 merge loser contact');
        System.assertEquals(true, mergeLoserContacts[0].IsDeleted, 'The merge loser contact should be deleted');
        System.assertEquals(
            contacts[1].Id,
            mergeLoserContacts[0].MasterRecordId,
            'MasterRecordId should contain winner contact id'
        );

        Contact mergeWinnerContact = [
            SELECT
                ID,
                (SELECT ID FROM Addresses__r LIMIT 1),
                (SELECT ID FROM Applications_Applicant__r LIMIT 1),
                (SELECT ID FROM Applications_Preparer__r LIMIT 1),
                (SELECT ID FROM Attendance_Events__r LIMIT 1),
                (SELECT ID FROM Attributes__r LIMIT 1),
                (SELECT ID FROM Contact_Languages__r LIMIT 1),
                (SELECT ID FROM Education_History__r LIMIT 1),
                (SELECT ID FROM Program_Enrollments__r LIMIT 1),
                (SELECT ID FROM Term_Grades__r LIMIT 1),
                (SELECT ID FROM Tests__r LIMIT 1)
            FROM Contact
            WHERE ID = :contacts[1].Id
        ];
        System.assertEquals(1, mergeWinnerContact.Addresses__r.size(), 'There should be 1 merged address');
        System.assertEquals(
            1,
            mergeWinnerContact.Applications_Applicant__r.size(),
            'There should be 1 merged applicant'
        );
        System.assertEquals(1, mergeWinnerContact.Applications_Preparer__r.size(), 'There should be 1 merged preparer');
        System.assertEquals(1, mergeWinnerContact.Attendance_Events__r.size(), 'There should be 1 merged attendance');
        System.assertEquals(1, mergeWinnerContact.Attributes__r.size(), 'There should be 1 merged attribute');
        System.assertEquals(1, mergeWinnerContact.Contact_Languages__r.size(), 'There should be 1 merged language');
        System.assertEquals(
            1,
            mergeWinnerContact.Education_History__r.size(),
            'There should be 1 merged education history'
        );
        System.assertEquals(1, mergeWinnerContact.Program_Enrollments__r.size(), 'There should be 1 merged enrollment');
        System.assertEquals(1, mergeWinnerContact.Term_Grades__r.size(), 'There should be 1 merged term grades');
        System.assertEquals(1, mergeWinnerContact.Tests__r.size(), 'There should be 1 merged test');
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is enabled in Hierarchy Settings,and the
     * Contact record has different child records associated to it,then it cannot be deleted.
     */
    @isTest
    private static void cannotDelete() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Affiliation__c affiliation1 = UTIL_UnitTestData_TEST.getAffiliation(contacts[0].Id, acc.Id, false);
        Affiliation__c affiliation2 = UTIL_UnitTestData_TEST.getAffiliation(contacts[1].Id, acc.Id, false);

        insert new List<Affiliation__c>{ affiliation1, affiliation2 };

        Application__c application1 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[0].Id, term.Id);
        Application__c application2 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);

        insert new List<Application__c>{ application1, application2 };

        Attendance_Event__c attendanceEvent1 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent1.Date__c = System.today();
        attendanceEvent1.Contact__c = contacts[0].Id;

        Attendance_Event__c attendanceEvent2 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent2.Date__c = System.today();
        attendanceEvent2.Contact__c = contacts[1].Id;

        insert new List<Attendance_Event__c>{ attendanceEvent1, attendanceEvent2 };

        Id credentialRecTypeId = UTIL_Describe_API.getCredentialAttributeRecType();

        Attribute__c attribute1 = UTIL_UnitTestData_TEST.getAttribute('TestCred1', contacts[0].Id, credentialRecTypeId);
        Attribute__c attribute2 = UTIL_UnitTestData_TEST.getAttribute('TestCred2', contacts[1].Id, credentialRecTypeId);

        insert new List<Attribute__c>{ attribute1, attribute2 };

        Language__c language = UTIL_UnitTestData_TEST.createLanguage('Spanish');

        Contact_Language__c contactLanguage1 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[0].Id,
            false
        );
        Contact_Language__c contactLanguage2 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[1].Id,
            false
        );

        Course_Offering__c courseOfferings1 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOfferings1.Faculty__c = contacts[0].Id;

        Course_Offering__c courseOfferings2 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOfferings2.Faculty__c = contacts[1].Id;

        update new List<Course_Offering__c>{ courseOfferings1, courseOfferings2 };

        Education_History__c eduHis1 = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[0].Id);
        Education_History__c eduHis2 = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[1].Id);
        insert new List<Education_History__c>{ eduHis1, eduHis2 };

        Term_Grade__c termGrade1 = UTIL_UnitTestData_TEST.getTermGrade(contacts[0].Id, courseOfferings1.Id, null);
        Term_Grade__c termGrade2 = UTIL_UnitTestData_TEST.getTermGrade(contacts[1].Id, courseOfferings2.Id, null);

        insert new List<Term_Grade__c>{ termGrade1, termGrade2 };

        Course_Enrollment__c studentCourseCxn1 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[0].Id,
            courseOfferings1.Id
        );
        studentCourseCxn1.Status__c = 'Current';

        Course_Enrollment__c studentCourseCxn2 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[1].Id,
            courseOfferings2.Id
        );
        studentCourseCxn2.Status__c = 'Current';

        insert new List<Course_Enrollment__c>{ studentCourseCxn1, studentCourseCxn2 };

        Program_Enrollment__c programEnrollment1 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment1.Contact__c = contacts[0].Id;

        Program_Enrollment__c programEnrollment2 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment2.Contact__c = contacts[1].Id;

        insert new List<Program_Enrollment__c>{ programEnrollment1, programEnrollment2 };

        Test__c testRecord1 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[0].Id);
        Test__c testRecord2 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[1].Id);

        insert new List<Test__c>{ testRecord1, testRecord2 };

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        //Verify that none of the Contact records were deleted
        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];
        System.assertEquals(2, contacts.size());
        System.assertEquals(false, results[0].success);
        System.assertEquals(Label.CannotDelete, results[0].errors[0].message);
        System.assertEquals(false, results[1].success);
        System.assertEquals(Label.CannotDelete, results[1].errors[0].message);
    }

    /******************************************************************************************************************
     * @description Test method to test when Prevent_Contact_Deletion__c is enabled in Hierarchy Settings, and if
     * one of the Contact records has child records associated to it, then it should not be deleted. The Contact records
     * that do not have any child related records should be deleted.
     */
    @isTest
    private static void cannotDeleteSomeContacts() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = true
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Affiliation__c affiliation = UTIL_UnitTestData_TEST.getAffiliation(contacts[1].Id, acc.Id, false);
        insert affiliation;

        Application__c applicant = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);
        insert applicant;

        Attendance_Event__c attendance = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendance.Date__c = System.today();
        insert attendance;

        Id credentialRecTypeId = UTIL_Describe_API.getCredentialAttributeRecType();

        Attribute__c attribute1 = UTIL_UnitTestData_TEST.getAttribute('TestCred2', contacts[1].Id, credentialRecTypeId);

        Language__c language = UTIL_UnitTestData_TEST.createLanguage('Spanish');

        Contact_Language__c contactLanguage = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[1].Id,
            false
        );

        Course_Offering__c courseOffering = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOffering.Faculty__c = contacts[1].Id;
        update courseOffering;

        Education_History__c eduHis = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[1].Id);
        insert eduHis;

        Term_Grade__c termGrade = UTIL_UnitTestData_TEST.getTermGrade(contacts[1].Id, courseOffering.Id, null);
        insert termGrade;

        Course_Enrollment__c courseCxn = UTIL_UnitTestData_TEST.getCourseConnection(contacts[1].Id, courseOffering.Id);
        courseCxn.Status__c = 'Current';
        insert courseCxn;

        Program_Enrollment__c programEnrollment = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment.Contact__c = contacts[1].Id;

        Test__c testRecord = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[1].Id);
        insert testRecord;

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        //Verify that 1 of the Contact records was deleted
        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];
        System.assertEquals(true, results[0].success);
        System.assertEquals(false, results[1].success);
        System.assertEquals(Label.CannotDelete, results[1].errors[0].message);
    }

    /**********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings,and the
     * Contact record has different child records associated to it, then it can be deleted.
     */
    @isTest
    private static void canDelete() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Affiliation__c affiliation1 = UTIL_UnitTestData_TEST.getAffiliation(contacts[0].Id, acc.Id, false);
        Affiliation__c affiliation2 = UTIL_UnitTestData_TEST.getAffiliation(contacts[1].Id, acc.Id, false);

        insert new List<Affiliation__c>{ affiliation1, affiliation2 };

        Application__c application1 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[0].Id, term.Id);
        Application__c application2 = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);

        insert new List<Application__c>{ application1, application2 };

        Attendance_Event__c attendanceEvent1 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent1.Date__c = System.today();
        attendanceEvent1.Contact__c = contacts[0].Id;

        Attendance_Event__c attendanceEvent2 = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendanceEvent2.Date__c = System.today();
        attendanceEvent2.Contact__c = contacts[1].Id;

        insert new List<Attendance_Event__c>{ attendanceEvent1, attendanceEvent2 };

        Id credentialRecTypeId = UTIL_Describe_API.getCredentialAttributeRecType();

        Attribute__c attribute1 = UTIL_UnitTestData_TEST.getAttribute('TestCred1', contacts[0].Id, credentialRecTypeId);
        Attribute__c attribute2 = UTIL_UnitTestData_TEST.getAttribute('TestCred2', contacts[1].Id, credentialRecTypeId);

        insert new List<Attribute__c>{ attribute1, attribute2 };

        Case case1 = UTIL_UnitTestData_TEST.getCase(null, 'School Code of Conduct', 'Current');
        case1.AccountId = acc.Id;
        Case case2 = UTIL_UnitTestData_TEST.getCase(null, 'School Code of Conduct', 'Current');
        case2.AccountId = acc.Id;

        insert new List<case>{ case1, case2 };
        Behavior_Involvement__c beh1 = UTIL_UnitTestData_TEST.getBehaviorInvolvementRecord(
            contacts[0].Id,
            case1.Id,
            'Reporter'
        );
        Behavior_Involvement__c beh2 = UTIL_UnitTestData_TEST.getBehaviorInvolvementRecord(
            contacts[1].Id,
            case2.Id,
            'Reporter'
        );

        insert new List<Behavior_Involvement__c>{ beh1, beh2 };

        Language__c language = UTIL_UnitTestData_TEST.createLanguage('Spanish');

        Contact_Language__c contactLanguage1 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[0].Id,
            false
        );
        Contact_Language__c contactLanguage2 = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[1].Id,
            false
        );
        Course_Offering__c courseOfferings1 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOfferings1.Faculty__c = contacts[0].Id;

        Course_Offering__c courseOfferings2 = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOfferings2.Faculty__c = contacts[1].Id;

        update new List<Course_Offering__c>{ courseOfferings1, courseOfferings2 };

        Education_History__c eduHis1 = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[0].Id);
        Education_History__c eduHis2 = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[1].Id);
        insert new List<Education_History__c>{ eduHis1, eduHis2 };

        Term_Grade__c termGrade1 = UTIL_UnitTestData_TEST.getTermGrade(contacts[0].Id, courseOfferings1.Id, null);
        Term_Grade__c termGrade2 = UTIL_UnitTestData_TEST.getTermGrade(contacts[1].Id, courseOfferings2.Id, null);

        insert new List<Term_Grade__c>{ termGrade1, termGrade2 };

        Id studentCourseCxnRecTypeId = UTIL_Describe_API.getStudentConnectionRecType();

        Course_Enrollment__c studentCourseCxn1 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[0].Id,
            courseOfferings1.Id
        );
        studentCourseCxn1.Status__c = 'Current';

        Course_Enrollment__c studentCourseCxn2 = UTIL_UnitTestData_TEST.getCourseConnection(
            contacts[1].Id,
            courseOfferings2.Id
        );
        studentCourseCxn2.Status__c = 'Current';

        insert new List<Course_Enrollment__c>{ studentCourseCxn1, studentCourseCxn2 };

        Program_Enrollment__c programEnrollment1 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment1.Contact__c = contacts[0].Id;

        Program_Enrollment__c programEnrollment2 = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment2.Contact__c = contacts[1].Id;

        insert new List<Program_Enrollment__c>{ programEnrollment1, programEnrollment2 };

        Test__c testRecord1 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[0].Id);
        Test__c testRecord2 = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[1].Id);

        insert new List<Test__c>{ testRecord1, testRecord2 };
        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        //Verify that all Contact records were deleted
        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];

        System.assertEquals(0, returnContacts.size());
    }

    /*********************************************************************************************************
     * @description Test method to test if Prevent_Contact_Deletion__c is disabled in Hierarchy Settings, and if
     * one of the Contact record has child records associated to it, then it should be deleted. The Contact record
     * that do not have any child related records should be deleted.
     */
    @isTest
    private static void canDeleteAllContacts() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Account_Processor__c = UTIL_Describe.getHhAccRecTypeID(),
                Prevent_Contact_Deletion__c = false
            )
        );

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        insert contacts;

        Term__c term = UTIL_UnitTestData_TEST.getTerm(acc.Id, 'Fall');
        insert term;

        Course__c course = UTIL_UnitTestData_TEST.getCourse('Biology', acc.Id);
        insert course;

        Affiliation__c affiliation = UTIL_UnitTestData_TEST.getAffiliation(contacts[1].Id, acc.Id, false);
        insert affiliation;

        Application__c applicant = UTIL_UnitTestData_TEST.getApplication(acc.Id, contacts[1].Id, term.Id);
        insert applicant;

        Attendance_Event__c attendance = UTIL_UnitTestData_TEST.getAttendanceEvent();
        attendance.Date__c = System.today();
        attendance.Contact__c = contacts[0].Id;
        insert attendance;

        Id credentialRecTypeId = UTIL_Describe_API.getCredentialAttributeRecType();
        Attribute__c credentialAttribute = UTIL_UnitTestData_TEST.getAttribute(
            'TestCred2',
            contacts[1].Id,
            credentialRecTypeId
        );
        insert credentialAttribute;

        Language__c language = UTIL_UnitTestData_TEST.createLanguage('Spanish');

        Contact_Language__c contactLanguage = UTIL_UnitTestData_TEST.createContactLanguage(
            language.Id,
            contacts[1].Id,
            false
        );

        Course_Offering__c courseOffering = UTIL_UnitTestData_TEST.createCourseOffering(course.Id, term.Id);
        courseOffering.Faculty__c = contacts[1].Id;
        update courseOffering;

        Education_History__c eduHis = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[1].Id);
        insert eduHis;

        Term_Grade__c termGrade = UTIL_UnitTestData_TEST.getTermGrade(contacts[1].Id, courseOffering.Id, null);
        insert termGrade;

        Course_Enrollment__c courseCxn = UTIL_UnitTestData_TEST.getCourseConnection(contacts[1].Id, courseOffering.Id);
        courseCxn.Status__c = 'Current';
        insert courseCxn;

        Program_Enrollment__c programEnrollment = UTIL_UnitTestData_TEST.getProgramEnrollment(acc.Id);
        programEnrollment.Contact__c = contacts[1].Id;
        insert programEnrollment;

        Test__c testRecord = UTIL_UnitTestData_TEST.getTest('SAT', System.today(), contacts[1].Id);
        insert testRecord;

        Test.startTest();
        List<Database.DeleteResult> results = Database.delete(contacts, false);
        Test.stopTest();

        //Verify that all of the Contact records was deleted
        List<Contact> returnContacts = [SELECT Id FROM Contact WHERE Id IN :contacts];
        System.assertEquals(0, returnContacts.size());
        System.assertEquals(true, results[0].success);
        System.assertEquals(true, results[1].success);
    }

    /**************************************************************************************************************************
     ****************************************************** UNIT TESTS *********************************************************
     **************************************************************************************************************************/

    /*************************************************************************************************************
     * @description NULL test for run method to verify new DmlWrapper(); is returned when oldList is null
     */
    @isTest
    private static void runMethodNULLTest() {
        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.BeforeDelete;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        CON_CannotDelete_TDTM ConCannotDeleteTDTM = new CON_CannotDelete_TDTM();
        TDTM_Runnable.DmlWrapper dmlWrapperReturned = ConCannotDeleteTDTM.run(null, null, testAction, objResult);

        System.assertEquals(0, dmlWrapperReturned.objectsToDelete.size());
    }

    /****************************************************************************************************************
     * @description Positive test for run method to verify contactPreventedFromDeletionList has the records prevented
     * from Deletion when Prevent Contact Deletion Custom Settings is enabled
     */
    @isTest
    private static void runMethodPositiveTest() {
        SRVC_Contact_PreventDeletion.instance = new STUB_deletionPreventionContactList();

        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));

        TDTM_Runnable.Action testBeforeAction = TDTM_Runnable.Action.BeforeDelete;
        TDTM_Runnable.Action testAfterAction = TDTM_Runnable.Action.AfterDelete;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(1);
        insert contacts;

        Term__c term = new Term__c(Name = 'Fall', Account__c = acc.Id);
        insert term;

        Course__c course = new Course__c(Name = 'Biology', Account__c = acc.Id);
        insert course;

        Affiliation__c affiliation = new Affiliation__c(Account__c = acc.Id, Contact__c = contacts[0].Id);
        insert affiliation;

        Education_History__c eduHis = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[0].Id);
        insert eduHis;

        List<SObject> oldList = new List<SObject>((List<SObject>) contacts);

        Map<Id, Contact> contactById = new Map<Id, Contact>(contacts);

        CON_CannotDelete_TDTM ConCannotDeleteTDTM = new CON_CannotDelete_TDTM();

        Test.startTest();
        ConCannotDeleteTDTM.run(null, oldList, testBeforeAction, objResult);
        List<Contact> contactsWithChildRelations = CON_CannotDelete_TDTM.contactsWithChildRelations;
        ConCannotDeleteTDTM.run(null, oldList, testAfterAction, objResult);
        Test.stopTest();

        // verify before handler retrieved contact with relations
        System.assertEquals(oldList.size(), contactsWithChildRelations.size());
        List<Contact> deletionPreventedContactList = SRVC_Contact_PreventDeletion.getInstance()
            .preventDeletionForContacts(contactById, contactsWithChildRelations);

        // verify deletionPreventedContactList is not empty
        System.assertEquals(1, deletionPreventedContactList.size());
        // verify after handler cleared contactsWithChildRelations static var
        System.assertEquals(null, CON_CannotDelete_TDTM.contactsWithChildRelations);
    }

    /************************************************************************************************************************
     * @description Negative test for run method to verify contactPreventedFromDeletionList has no records that are prevented
     * from Deletion when Prevent Contact Deletion Custom Settings is disabled
     */
    @isTest
    private static void runMethodNegativeTestWithCustomSettingsDisabled() {
        SRVC_Contact_PreventDeletion.instance = new STUB_DeletionPreventionContactList();

        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = false));

        TDTM_Runnable.Action testBeforeAction = TDTM_Runnable.Action.BeforeDelete;
        TDTM_Runnable.Action testAfterAction = TDTM_Runnable.Action.AfterDelete;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(1);
        insert contacts;

        Term__c term = new Term__c(Name = 'Fall', Account__c = acc.Id);
        insert term;

        Course__c course = new Course__c(Name = 'Biology', Account__c = acc.Id);
        insert course;

        Affiliation__c affiliation = new Affiliation__c(Account__c = acc.Id, Contact__c = contacts[0].Id);
        insert affiliation;

        Education_History__c eduHis = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[0].Id);
        insert eduHis;

        List<SObject> oldList = new List<SObject>((List<SObject>) contacts);

        Map<Id, Contact> contactById = new Map<Id, Contact>();

        CON_CannotDelete_TDTM ConCannotDeleteTDTM = new CON_CannotDelete_TDTM();

        Test.startTest();
        ConCannotDeleteTDTM.run(null, oldList, testBeforeAction, objResult);
        List<Contact> contactsWithChildRelations = CON_CannotDelete_TDTM.contactsWithChildRelations;
        ConCannotDeleteTDTM.run(null, oldList, testAfterAction, objResult);
        Test.stopTest();

        // verify before handler didn't retrieve any contacts with relations
        System.assertEquals(null, contactsWithChildRelations);

        List<Contact> deletionPreventedContactList = SRVC_Contact_PreventDeletion.getInstance()
            .preventDeletionForContacts(contactById, new List<Contact>());

        // Verify deletionPreventedContactList is empty
        System.assertEquals(0, deletionPreventedContactList.size());
        // verify after handler cleared contactsWithChildRelations static var
        System.assertEquals(null, CON_CannotDelete_TDTM.contactsWithChildRelations);
    }

    /*************************************************************************************************************************
     * @description Negative test for run method to verify contactPreventedFromDeletionList has no records that are prevented
     * from Deletion when Prevent Contact Deletion Custom Settings is enabled.
     */
    @isTest
    static void runMethodNegativeTestWithNoChildren() {
        SRVC_Contact_PreventDeletion.instance = new STUB_deletionPreventionContactList();

        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));

        TDTM_Runnable.Action testBeforeAction = TDTM_Runnable.Action.BeforeDelete;
        TDTM_Runnable.Action testAfterAction = TDTM_Runnable.Action.AfterDelete;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(1);
        insert contacts;

        List<SObject> oldList = new List<SObject>((List<SObject>) contacts);

        Map<Id, Contact> contactById = new Map<Id, Contact>((List<Contact>) oldList);

        CON_CannotDelete_TDTM ConCannotDeleteTDTM = new CON_CannotDelete_TDTM();

        Test.startTest();
        ConCannotDeleteTDTM.run(null, oldList, testBeforeAction, objResult);
        List<Contact> contactsWithChildRelations = CON_CannotDelete_TDTM.contactsWithChildRelations;
        ConCannotDeleteTDTM.run(null, oldList, testAfterAction, objResult);
        Test.stopTest();

        List<Contact> deletionPreventedContactList = SRVC_Contact_PreventDeletion.getInstance()
            .preventDeletionForContacts(contactById, contactsWithChildRelations);

        // Verify deletionPreventedContactList is empty
        System.assertEquals(0, deletionPreventedContactList.size());
    }

    /********************************************************************************************************************************
     * @description Tests handleBeforeDelete method of CON_CannotDelete_TDTM when Prevent Contact Deletion Custom Settings is enabled
     * and Contact having child records
     */
    @isTest
    private static void handleBeforeDeleteMethodWithCustomSettingsEnabledPositiveTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));
        Account acc = UTIL_UnitTestData_TEST.getMultipleTestAccounts(1, UTIL_Describe_API.getBizAccRecTypeID())[0];
        insert acc;

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(1);
        insert contacts;

        Term__c term = new Term__c(Name = 'Fall', Account__c = acc.Id);
        insert term;

        Course__c course = new Course__c(Name = 'Biology', Account__c = acc.Id);
        insert course;

        Affiliation__c affiliation = new Affiliation__c(Account__c = acc.Id, Contact__c = contacts[0].Id);
        insert affiliation;

        Education_History__c eduHis = UTIL_UnitTestData_Test.getEduHistory(acc.Id, contacts[0].Id);
        insert eduHis;

        CON_CannotDelete_TDTM conCanNotDeleteTDTM = new CON_CannotDelete_TDTM();
        Test.startTest();
        List<Contact> contactsWithChildRelations = conCanNotDeleteTDTM.handleBeforeDelete(contacts);
        Test.stopTest();

        // Verify contactsWithChildRelations is not empty
        System.assertEquals(1, contactsWithChildRelations.size());
    }

    /*******************************************************************************************************************************************
     * @description positive test for handleBeforeDelete method of CON_CannotDelete_TDTM when Prevent Contact Deletion Custom Settings is enabled
     * with no CHild records for Contact
     */
    @isTest
    private static void handleBeforeDeleteMethodWithCustomSettingsEnabledNoRelationsPositiveTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));

        List<Contact> contacts = UTIL_UnitTestData_TEST.getMultipleTestContacts(1);
        insert contacts;

        CON_CannotDelete_TDTM conCanNotDeleteTDTM = new CON_CannotDelete_TDTM();
        Test.startTest();
        List<Contact> contactsWithChildRelations = conCanNotDeleteTDTM.handleBeforeDelete((List<SObject>) contacts);
        Test.stopTest();

        // Verify contactsWithChildRelations is empty
        System.assertEquals(1, contactsWithChildRelations.size());
    }

    /************************************************************************************************************************
     * @description Tests handleBeforeDelete method of CON_CannotDelete_TDTM with Prevent Deletion Custom Settings disabled
     */
    @isTest
    private static void handleBeforeDeleteMethodWIthCustomSettingsDisabledTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = false));

        List<SObject> testContactlist = UTIL_UnitTestData_TEST.getMultipleTestContacts(10);

        CON_CannotDelete_TDTM conCanNotDeleteTDTM = new CON_CannotDelete_TDTM();
        Test.startTest();
        List<Contact> contactsWithChildRelations = conCanNotDeleteTDTM.handleBeforeDelete(testContactlist);
        Test.stopTest();

        // Verify contactsWithChildRelations is null
        System.assertEquals(null, contactsWithChildRelations);
    }

    /*************************************************************************************************************
     * @description Tests locateContactPreventDeletionService method of CON_CannotDelete_TDTM
     */
    @isTest
    private static void locateContactPreventDeletionServiceTest() {
        CON_CannotDelete_TDTM conCanNotDeleteTDTM = new CON_CannotDelete_TDTM();
        Test.startTest();
        SRVC_Contact_PreventDeletion conPreventDeleteInstance = conCanNotDeleteTDTM.locateContactPreventDeletionService();
        Test.stopTest();

        SRVC_Contact_PreventDeletion srvcInstance = SRVC_Contact_PreventDeletion.getInstance();

        System.assertEquals(srvcInstance, conPreventDeleteInstance);
    }

    /*************************************************************************************************************
     * @description Positive tests for isContactDeletionPreventionEnabled method of CON_CannotDelete_TDTM
     */
    @isTest
    private static void isContactDeletionPreventionEnabledPositiveTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = true));
        Test.startTest();
        CON_CannotDelete_TDTM conPreventDeleteInstance = new CON_CannotDelete_TDTM();
        Test.stopTest();

        Boolean isContactDeletionPreventionEnabled = conPreventDeleteInstance.isContactDeletionPreventionEnabled();

        // Verify isContactDeletionPreventionEnabled is true
        System.assertEquals(true, isContactDeletionPreventionEnabled);
    }

    /*************************************************************************************************************
     * @description Negative tests for isContactDeletionPreventionEnabled method of CON_CannotDelete_TDTM
     */
    @isTest
    private static void isContactDeletionPreventionEnabledNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c(Prevent_Contact_Deletion__c = false));
        Test.startTest();
        CON_CannotDelete_TDTM conPreventDeleteInstance = new CON_CannotDelete_TDTM();
        Test.stopTest();

        Boolean isContactDeletionPreventionEnabled = conPreventDeleteInstance.isContactDeletionPreventionEnabled();

        System.assertEquals(false, isContactDeletionPreventionEnabled);
    }

    /**************************************************************************************************************************
     ****************************************************** STUB CLASS *********************************************************
     **************************************************************************************************************************/

    /*************************************************************************************************************
     * STUB class which extends SRVC_Contact_PreventDeletion
     */
    private class STUB_DeletionPreventionContactList extends SRVC_Contact_PreventDeletion {
        @TestVisible
        List<Contact> deletionPreventedContactList = new List<Contact>();

        public override List<Contact> preventDeletionForContacts(
            Map<Id, Contact> contactById,
            List<Contact> contactWithChildRecordsList
        ) {
            deletionPreventedContactList = super.preventDeletionForContacts(contactById, contactWithChildRecordsList);
            return deletionPreventedContactList;
        }
    }
}
/*
    Copyright (c) 2014, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
 
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/

/**
* @author Salesforce.org
* @date 2015
* @group Contacts
* @group-content ../../ApexDocContent/Contacts.htm
* @description Tests to validate the functionality of the CON_DoNotContact_TDTM class to
* synchronize Household naming exclusions and communication preferences with changes to the Deceased
* and Do Not Contact fields for the Contact object.
*/
@isTest
private class CON_DoNotContact_TEST {
    /**************************************************************************************************************************
    ****************************************************** FUNCTIONAL TESTS ***************************************************
    **************************************************************************************************************************/

    /**************************************************************************************************************************
    * @description Test method to verify that contacts inserted with "Deceased" = true are excluded from 
    * from Household naming functionality and have the following fields automatically marked as true: 
    * Do Not Contact, Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest 
    private static void insertContactDeceasedIsTrue(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = true;
        }

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        Exclude_from_Household_Name__c, 
                                                        Exclude_from_Household_Formal_Greeting__c,
                                                        Exclude_from_Household_Informal_Greeting__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];
        
        for (Contact con : contactsAfterInsertList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(true, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that contacts inserted with "Deceased" = false are not excluded from 
    * from Household naming functionality and have the following fields automatically marked as false: 
    * Do Not Contact, Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest 
    private static void insertContactDeceasedIsFalse(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = false;
        }

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                    Exclude_from_Household_Name__c, 
                                                    Exclude_from_Household_Formal_Greeting__c,
                                                    Exclude_from_Household_Informal_Greeting__c, 
                                                    HasOptedOutOfEmail, 
                                                    DoNotCall, 
                                                    HasOptedOutOfFax
                                             FROM CONTACT 
                                             WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that contacts updated from being deceased to not deceased are not excluded from 
    * from Household naming functionality and have the following fields automatically marked as false: 
    * Do Not Contact, Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void updateContactDeceasedToFalse() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = true;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            con.Deceased__c = false; 
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterUpdateList = [SELECT Do_Not_Contact__c, 
                                                        Exclude_from_Household_Name__c, 
                                                        Exclude_from_Household_Formal_Greeting__c,
                                                        Exclude_from_Household_Informal_Greeting__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterUpdateList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of email.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of phone calls.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of fax.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that contacts updated as deceased are excluded from Household naming functionality
    * and have the following fields automatically marked as true: Do Not Contact, Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void updateContactDeceasedToTrue() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = false;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            con.Deceased__c = true; 
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterUpdateList = [SELECT Do_Not_Contact__c, 
                                                        Exclude_from_Household_Name__c, 
                                                        Exclude_from_Household_Formal_Greeting__c,
                                                        Exclude_from_Household_Informal_Greeting__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterUpdateList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');    
            System.assertEquals(true, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of email.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of phone calls.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of fax.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that contacts inserted with "Do Not Contact" selected have the following communication
    * fields automatically updated to true: Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void insertDoNotContactIsTrue() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = true;
        }

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT DoNotCall, 
                                                        HasOptedOutOfEmail, 
                                                        HasOptedOutOfFax 
                                                FROM Contact 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of phone calls.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of email.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of fax.');    
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that contacts inserted with "Do Not Contact" selected have the following communication
    * fields automatically updated to true: Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void insertDoNotContactIsFalse() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = false;
        }

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT DoNotCall, 
                                                        HasOptedOutOfEmail, 
                                                        HasOptedOutOfFax 
                                                FROM Contact 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of phone calls.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of email.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of fax.');    
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that contacts updated with "Do Not Contact" = true have the following fields 
    * automatically marked as true: Do Not Contact, Email Opt Out, Do Not Call, Do Not Fax
    */   
    @isTest
    private static void updateDoNotContactTotrue() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = false;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = true;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterUpdateList = [SELECT DoNotCall, 
                                                        HasOptedOutOfEmail, 
                                                        HasOptedOutOfFax 
                                                FROM Contact 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterUpdateList){
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of phone calls.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should  be opted out of email.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of fax.');    
        }
    }

    /****************************************************************************************************************************
    * @description Test method to verify that contacts updated with "Do Not Contact" = False
    * have the following fields automatically marked as false: Do Not Contact, Email Opt Out, Do Not Call, Do Not Fax
    */  
    @isTest
    private static void updateDoNotContactToFalse() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = true;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = false;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> contactsAfterUpdateList = [SELECT DoNotCall, 
                                                        HasOptedOutOfEmail, 
                                                        HasOptedOutOfFax 
                                                FROM Contact 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterUpdateList){
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of phone calls.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not  be opted out of email.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of fax.');    
        }
    }

    /**************************************************************************************************************************************
    * @description Test method to verify that deceased contacts updated with "Do Not Contact" = false will remain excluded from household
    * naming functionality, but will have the following communication preferences automatically updated to false:
    * Email Opt Out, Do Not Call, Do Not Fax
    */  
    @isTest
    private static void updateDoNotContactToFalseOnADeceasedContact() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = true;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = false;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> contactAfterUpdateList = [SELECT DoNotCall, 
                                                       HasOptedOutOfEmail, 
                                                       HasOptedOutOfFax,
                                                       Do_Not_Contact__c, 
                                                       Exclude_from_Household_Name__c,
                                                       Exclude_from_Household_Formal_Greeting__c, 
                                                       Exclude_from_Household_Informal_Greeting__c
                                               FROM Contact 
                                               WHERE Id IN :testContactsList];

        for (Contact con : contactAfterUpdateList){
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of phone calls.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of Email.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of Fax.');
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
        }
    }

    /**************************************************************************************************************************
    ****************************************************** UNIT TESTS *********************************************************
    **************************************************************************************************************************/

    /**************************************************************************************************************************
    * @description Test method to verify that syncDoNotContactFieldsOnContact synchronizes the following fields to true when 
    * "Do Not Contact" is selected: Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void syncDoNotContactFieldsToPositive(){
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactList){
            con.Do_Not_Contact__c = true;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.syncDoNotContactFieldsOnContacts(testContactList);
        Test.stopTest();

        for (Contact con : testContactList){
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of emails.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of phone calls.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that syncDoNotContactFieldsOnContact synchronizes the following fields to false when 
    * "Do Not Contact" is not selected: Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void syncDoNotContactFieldsToNegative(){
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactList){
            con.Do_Not_Contact__c = false;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.syncDoNotContactFieldsOnContacts(testContactList);
        Test.stopTest();

        for (Contact con : testContactList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of emails.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of phone calls.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that syncDoNotContactFieldsOnContact synchronizes the following fields to false when 
    * a null value is set for "Do Not Contact": Email Opt Out, Do Not Call, Do Not Fax
    */
    @isTest
    private static void syncDoNotContactFieldsNull(){
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactList){
            con.Do_Not_Contact__c = null;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.syncDoNotContactFieldsOnContacts(testContactList);
        Test.stopTest();

        for (Contact con : testContactList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of emails.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of phone calls.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that syncNamingExclusionsOnContact excludes the following naming conventions  
    * when a contact has been marked as deceased: Household Name, Household Formal Greeting, Household Informal Greeting
    */
    @isTest 
    private static void syncNamingExclusionsPositive(){
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactList){
            con.Deceased__c = true;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.syncNamingExclusionsOnContacts(testContactList);
        Test.stopTest();

        for (Contact con : testContactList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that syncNamingExclusionsOnContact removes all household naming exclusions   
    * when a contact is marked as being not deceased.
    */
    @isTest 
    private static void syncNamingExclusionsNegative(){
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactList){
            con.Deceased__c = false;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.syncNamingExclusionsOnContacts(testContactList);
        Test.stopTest();

        for (Contact con : testContactList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that syncNamingExclusionsOnContact removes all household naming exclusions   
    * when a null value is passed for Deceased.
    */
    @isTest 
    private static void syncNamingExclusionsNull(){
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactList){
            con.Deceased__c = null;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.syncNamingExclusionsOnContacts(testContactList);
        Test.stopTest();

        for (Contact con : testContactList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeInsert excludes a deceased contact from all household naming
    * functionality and the following fields are set to true: Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertDeceasedPositive(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = true;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeInsert(testContactsList);
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        Exclude_from_Household_Name__c, 
                                                        Exclude_from_Household_Formal_Greeting__c,
                                                        Exclude_from_Household_Informal_Greeting__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(true, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeInsert does not exclude a living contact from any household naming
    * functionality and the following fields are set to false: Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertDeceasedNegative(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = false;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeInsert(testContactsList);
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        Exclude_from_Household_Name__c, 
                                                        Exclude_from_Household_Formal_Greeting__c,
                                                        Exclude_from_Household_Informal_Greeting__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should note be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should note be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that when Deceased is null, processBeforeInsert does not exclude a contact from any 
    * household naming functionality and the following fields are set to false: 
    * Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertDeceasedNull(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Deceased__c = null;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeInsert(testContactsList);
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        Exclude_from_Household_Name__c, 
                                                        Exclude_from_Household_Formal_Greeting__c,
                                                        Exclude_from_Household_Informal_Greeting__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax,
                                                        Account.Name 
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should note be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeInsert synchronizes the following fields to true when 
    * "Do Not Contact" is selected: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertDoNotContactPositive(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = true;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeInsert(testContactsList);
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeInsert synchronizes the following fields to false when 
    * "Do Not Contact" is not selected: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertDoNotContactNegative(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = false;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeInsert(testContactsList);
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeInsert synchronizes the following fields to false when 
    * "Do Not Contact" is null: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertDoNotContactNull(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Do_Not_Contact__c = null;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeInsert(testContactsList);
        Test.stopTest();

        List<Contact> contactsAfterInsertList = [SELECT Do_Not_Contact__c, 
                                                        HasOptedOutOfEmail, 
                                                        DoNotCall, 
                                                        HasOptedOutOfFax
                                                FROM CONTACT 
                                                WHERE Id IN :testContactsList];

        for (Contact con : contactsAfterInsertList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeUpdate excludes a deceased contact from household naming 
    * functionality and synchronizes the following fields to true: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeUpdateDeceasedPositive(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        Map<Id, Contact> testContactsById = new Map<Id, Contact>();
        
        for (Contact con : testContactsList){
            String testId = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

            Contact oldCon = con.clone(false);
            oldCon.Id = testId;
            oldCon.Deceased__c = false;
            testContactsById.put(testId, oldCon);

            con.Id = testId;
            con.Deceased__c = true;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeUpdate(testContactsList, testContactsById);
        Test.stopTest();

        for (Contact con : testContactsList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(true, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that processBeforeUpdate does not exclude a living contact from household naming 
    * functionality and synchronizes the following fields to false: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeInsertUpdateDeceasedNegative(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        Map<Id, Contact> testContactsById = new Map<Id, Contact>();
        
        for (Contact con : testContactsList){
            String testId = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

            Contact oldCon = con.clone(false);
            oldCon.Id = testId;
            oldCon.Deceased__c = true;
            testContactsById.put(testId, oldCon);

            con.Id = testId;
            con.Deceased__c = false;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeUpdate(testContactsList, testContactsById);
        Test.stopTest();

        for (Contact con : testContactsList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that when Deceased is null, processBeforeUpdate does not exclude a contact from 
    * household naming functionality and synchronizes the following fields to false: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeUpdateDeceasedNull(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        Map<Id, Contact> testContactsById = new Map<Id, Contact>();
        
        for (Contact con : testContactsList){
            String testId = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

            Contact oldCon = con.clone(false);
            oldCon.Id = testId;
            oldCon.Deceased__c = true;
            testContactsById.put(testId, oldCon);

            con.Id = testId;
            con.Deceased__c = null;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeUpdate(testContactsList, testContactsById);
        Test.stopTest();

        for (Contact con : testContactsList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that when "Do Not Contact" is updated to checked, processBeforeUpdate synchronizes 
    * the following communication preference fields to true: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeUpdateDoNotContactPositive(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        Map<Id, Contact> testContactsById = new Map<Id, Contact>();
        
        for (Contact con : testContactsList){
            String testId = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

            Contact oldCon = con.clone(false);
            oldCon.Id = testId;
            oldCon.Do_Not_Contact__c = false;
            testContactsById.put(testId, oldCon);

            con.Id = testId;
            con.Do_Not_Contact__c = true;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeUpdate(testContactsList, testContactsById);
        Test.stopTest();

        for (Contact con : testContactsList){
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that when "Do Not Contact" is updated to unchecked, processBeforeUpdate synchronizes 
    * the following communication preference fields to false: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeUpdateDoNotContactNegative(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        Map<Id, Contact> testContactsById = new Map<Id, Contact>();
        
        for (Contact con : testContactsList){
            String testId = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

            Contact oldCon = con.clone(false);
            oldCon.Id = testId;
            oldCon.Do_Not_Contact__c = true;
            testContactsById.put(testId, oldCon);

            con.Id = testId;
            con.Do_Not_Contact__c = false;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeUpdate(testContactsList, testContactsById);
        Test.stopTest();

        for (Contact con : testContactsList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that when "Do Not Contact" is updated to null, processBeforeUpdate synchronizes 
    * the following communication preference fields to false: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void processBeforeUpdateDoNotContactNull(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        Map<Id, Contact> testContactsById = new Map<Id, Contact>();
        
        for (Contact con : testContactsList){
            String testId = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

            Contact oldCon = con.clone(false);
            oldCon.Id = testId;
            oldCon.Do_Not_Contact__c = true;
            testContactsById.put(testId, oldCon);

            con.Id = testId;
            con.Do_Not_Contact__c = null;
        }

        Test.startTest();
        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.processBeforeUpdate(testContactsList, testContactsById);
        Test.stopTest();

        for (Contact con : testContactsList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that isBeforeInsert returns true for a BeforeInsert trigger action.
    */
    @isTest 
    private static void checkIsBeforeInsertPositive(){
        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.BeforeInsert;

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        System.assertEquals(true, conDoNotContactTDTM.isBeforeInsert(testAction), 'Trigger Action is BeforeInsert');
    }

    /**************************************************************************************************************************
    * @description Test method to verify that isBeforeInsert returns false when the trigger action is not BeforeInsert.
    */
    @isTest 
    private static void checkIsBeforeInsertNegative(){
        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.AfterInsert;

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        System.assertEquals(false, conDoNotContactTDTM.isBeforeInsert(testAction), 'Trigger Action is not BeforeInsert');
    }

    /**************************************************************************************************************************
    * @description Test method to verify that isBeforeUpdate returns true for a BeforeUpdate trigger action.
    */
    @isTest 
    private static void checkIsBeforeUpdatePositive(){
        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.BeforeUpdate;

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        System.assertEquals(true, conDoNotContactTDTM.isBeforeUpdate(testAction), 'Trigger Action is BeforeUpdate');
    }

    /**************************************************************************************************************************
    * @description Test method to verify that isBeforeUpdate returns false when the trigger action is not BeforeUpdate.
    */
    @isTest 
    private static void checkIsBeforeUpdateNegative(){
        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.AfterUpdate;

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        System.assertEquals(false, conDoNotContactTDTM.isBeforeUpdate(testAction), 'Trigger Action is not BeforeUpdate');
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method excludes contact updated to deceased from household naming 
    * functionality and sets the following fields to true: Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeUpdateDeceasedPositive(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = new List<SObject>();

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            SObject oldObj = so.clone(false);
            oldObj.put('Deceased__c', false);
            oldList.add(oldObj);

            so.put('Deceased__c', true);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(true, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method clears household naming exclusions for contacts updated from 
    * being deceased and sets the following fields to false: Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeUpdateDeceasedNegative(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = new List<SObject>();

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            SObject oldObj = so.clone(false);
            oldObj.put('Deceased__c', true);
            oldList.add(oldObj);
            
            so.put('Deceased__c', false);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method sets the following fields to true for contacts when the  
    * "Do Not Contact" field is updated to checked: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeUpdateDoNotContactPositive(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = new List<SObject>();

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            SObject oldObj = so.clone(false);
            oldObj.put('Do_Not_Contact__c', false);
            oldList.add(oldObj);

            so.put('Do_Not_Contact__c', true);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method sets the following fields to false for contacts when the  
    * "Do Not Contact" field is updated to unchecked: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeUpdateDoNotContactNegative(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = new List<SObject>();

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            SObject oldObj = so.clone(false);
            oldObj.put('Do_Not_Contact__c', true);
            oldList.add(oldObj);
            
            so.put('Do_Not_Contact__c', false);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method excludes inserted deceased contacts from household naming 
    * functionality and sets the following fields to true: Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeInsertDeceasedPositive(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = null;

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            so.put('Deceased__c', true);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(true, con.Exclude_from_Household_Name__c, 'Contact should be excluded from Household Naming.');
            System.assertEquals(true, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should be excluded from Household Formal Greeting.');
            System.assertEquals(true, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should be excluded from Household Informal Greeting.');
            System.assertEquals(true, con.Do_Not_Contact__c, 'Contact should be marked as Do Not Contact.');
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method does not exclude inserted living contacts from household naming 
    * functionality and sets the following fields to false: Do Not Contact, Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeInsertDeceasedNegative(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = null;

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            so.put('Deceased__c', false);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(false, con.Exclude_from_Household_Name__c, 'Contact should not be excluded from Household Naming.');
            System.assertEquals(false, con.Exclude_from_Household_Formal_Greeting__c, 'Contact should not be excluded from Household Formal Greeting.');
            System.assertEquals(false, con.Exclude_from_Household_Informal_Greeting__c, 'Contact should not be excluded from Household Informal Greeting.');
            System.assertEquals(false, con.Do_Not_Contact__c, 'Contact should not be marked as Do Not Contact.');
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method synchronizes the following to fields to true when contacts are
    * inserted with "Do Not Contact" selected: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeInsertDoNotContactPositive(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = null;

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            so.put('Do_Not_Contact__c', true);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(true, con.HasOptedOutOfEmail, 'Contact should be opted out of receiving emails.');
            System.assertEquals(true, con.HasOptedOutOfFax, 'Contact should be opted out of receiving faxes.');
            System.assertEquals(true, con.DoNotCall, 'Contact should be opted out of receiving phone calls.');
        }
    }

    /**************************************************************************************************************************
    * @description Test method to verify that the run method synchronizes the following to fields to false when contacts are
    * inserted with "Do Not Contact" unchecked: Email Opt Out, Fax Opt Out, Do Not Call
    */
    @isTest 
    private static void fireBeforeInsertDoNotContactNegative(){
        List<SObject> newList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = null;

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.BeforeInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (SObject so : newList){
            so.put('Do_Not_Contact__c', false);
        }

        CON_DoNotContact_TDTM conDoNotContactTDTM = new CON_DoNotContact_TDTM();
        conDoNotContactTDTM.run(newList, oldList, triggerAction, objResult);

        for (Contact con : (List<Contact>)newList){
            System.assertEquals(false, con.HasOptedOutOfEmail, 'Contact should not be opted out of receiving emails.');
            System.assertEquals(false, con.HasOptedOutOfFax, 'Contact should not be opted out of receiving faxes.');
            System.assertEquals(false, con.DoNotCall, 'Contact should not be opted out of receiving phone calls.');
        }
    }
}
/*
    Copyright (c) 2019 Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
/**
* @author Salesforce.org
* @date 2019
* @group Contacts
* @group-content ../../ApexDocContent/Contacts.htm
* @description Handles processing of Contact Preferred Phone. Copies custom Phone fields to the standard field.
* Ensures a phone is selected when Preferred phone is set.
*/
public with sharing class CON_Phone {
    /*******************************************************************************************************
    * @description Sets the Phone field depending on the value of Preferred Phone
    * @param Contact the contact to update
    * @param oldlist list of old contacts from update or delete context of a trigger
    */
     
    public static void processPreferredPhone(Contact contact, Contact oldContact, Boolean validatePreferredPhone, String selectedPreferredPhone) {
        
        // No need to run if we are in a delete context
        if (contact == null) {
            return;
        }

         Boolean isUpdate = (oldContact != null) ? true : false;

        // Build the list of phone fields
        CON_PhoneFieldList phoneFields = new CON_PhoneFieldList(contact);

        if( phoneFields.valuedFields.size() > 0 ) {
            // Check the presence of a special cases when running a batch process.
            // This will prevent some validation errors below to allow batches to complete successfully.
            if( validatePreferredPhone && System.isBatch() ) {
                   
                // Catch a special case when there is a value in Phone that doesn't match the 
                // other fields and Preferred Phone is blank
                if(String.isNotBlank(contact.Phone) && phoneFields.valueExists(contact.Phone) == null && String.isBlank(contact.PreferredPhone__c)) {
                   
                    contact.PreferredPhone__c = Label.preferredBatchDefaultPhone;
                }

                // Process when Phone matches an existing value
                if(String.isNotBlank(contact.Phone) && phoneFields.valueExists(contact.Phone) != null && String.isBlank(contact.PreferredPhone__c)) {
                    contact.PreferredPhone__c = phoneFields.valueExists(contact.Phone).prefLabel;
                }

                // We are catching a special case here when there are multiple Phones but Phone is blank.
                // If there is only one custom Phone present, we will set it as preferred. When multiple
                // Phones are present the first in the list will be set to preferred if a selection
                // is not made in EDA settings.
                if(String.isBlank(contact.Phone) ) {
                    
                    if (phoneFields.valuedFields.size() > 1 && String.isNotEmpty(selectedPreferredPhone)) {
                    
                        for (CON_PhoneField eachField : phoneFields.valuedFields)  {
                                                     
                            if (eachField.apiName == selectedPreferredPhone) {
                                
                                setPhoneFields(contact, eachField.value, eachField.prefLabel);
                                break;
                            }    
                            
                        }

                        if (contact.Phone == NULL && Contact.PreferredPhone__c == NULL) {
                              setPhoneFields(contact, phoneFields.valuedFields[0].value, phoneFields.valuedFields[0].prefLabel);
                        }
                    }
                    
                     // Get the first item from the list either one or many
                     
                    else {
                        setPhoneFields(contact, phoneFields.valuedFields[0].value, phoneFields.valuedFields[0].prefLabel);
                    }
                }
            }

            // Only one phone field, so we can intelligently set Preferred Phone.
            if(validatePreferredPhone && phoneFields.valuedFields.size() == 1 && String.isBlank(contact.PreferredPhone__c)){
                setPhoneFields(contact, phoneFields.valuedFields[0].value, phoneFields.valuedFields[0].prefLabel);
                
            // Enforce Preferred Phone field unless validation is disabled
            } else if(validatePreferredPhone && String.isBlank(contact.PreferredPhone__c)){

                contact.addError( Label.PreferredPhoneRequiredError );

            // Check if the field selected for Preferred Phone matches the label
            // throw an error if it doesn't match or update according if there is a match
            } else if ( String.isNotBlank(contact.PreferredPhone__c) && contact.PreferredPhone__c != Label.preferredBatchDefaultPhone && contact.PreferredPhone__c != phoneFields.phoneLabel ) {

                CON_PhoneField field = phoneFields.getFieldByPrefLabel(contact.PreferredPhone__c);
                if( field != null) {
                    // Make sure we are not setting to a blank value
                    if(String.isNotBlank(field.value)) {
                        // Copy the value that matches preferred Phone to the standard Phone field
                        contact.Phone = field.value;
                    } else {
                        contact.addError(Label.PreferredPhoneMatchNotNull);
                    }

                // Make sure the value in Preferred Phone matches an actual field 
                } else {
                    contact.addError(Label.PreferredPhoneMatchMustExist);
                }
            }

        } else {
                   
            // Cannot have Preferred Phone set if there are no phones present
            if( String.isNotBlank(contact.PreferredPhone__c)) {
                contact.addError(Label.PreferredPhoneMatchNotNull);
            }

            // We are not going to format data for orgs that are not enforcing the Preferred Phone field
            if(validatePreferredPhone && String.isNotBlank(contact.Phone)) {

                // oldlist is NULL on insert so we check to make sure this logic only applies on updates.
                // We make sure this isn't a batch, because the batch relies on this trigger while
                // updating contacts
                if( isUpdate && !System.isBatch() ) {
                   // Map<ID, Contact> oldmap = new Map<ID, Contact>( (List<Contact>)oldlist);

                    // Get the old phone values - if any - to compare.
                    //CON_PhoneFieldList oldPhoneFields = new CON_PhoneFieldList( oldmap.get(contact.Id) );
                     CON_PhoneFieldList oldPhoneFields = new CON_PhoneFieldList(Oldcontact);
                    // If this is an update and the contact contained previous phones we want to clear the standard phone field
                    // we do this because when a user deletes all phone values in the EDA contact without clearing
                    // the value if phone, there would be an phone number that the user tried to delete.
                    if (oldPhoneFields.valuedFields.size() > 0) {
                        contact.Phone = null;
                    } else {

                        copyStdPhoneToOther(contact, phoneFields);
                    }
                } else {

                    copyStdPhoneToOther(contact, phoneFields);
                }
            }
        }


    } 

    /*******************************************************************************************************
    * @description Copies the value of the standard Phone field to the Other Phone field if Phone has a value and no other phones.
    * @param contact the contact to change
    * @param fieldList an instance of the CON_PhoneFieldList class
    */
    public static void copyStdPhoneToOther(Contact contact, CON_PhoneFieldList fieldList) {
        if(contact.Phone != null) {

            // Retrieve field from field list using the known API name.
            CON_PhoneField otherField = fieldList.getFieldByApiName('OtherPhone');

                contact.PreferredPhone__c = otherField.prefLabel;
                contact.OtherPhone = contact.Phone;          
        }
    }
    
    private static Map<String, String> preferredPhoneLabelToAPI;

    /*******************************************************************************************************
    * @description Returns a map with Preferred Phone picklist entry's label as key and API as value
    * @return  preferredPhoneLabelToAPI A Map<String, String> with key value pair of Preferred Phone picklist entrys's label and API respectively
    */
    private static Map<String, String> createPreferredLabelToAPIMap() {   
        if (preferredPhoneLabelToAPI == NULL) {          
            String namespace = UTIL_Namespace.getNamespace();
            String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';
            preferredPhoneLabelToAPI =  UTIL_Describe.getpicklistEntriesLabelToAPIMap('Contact', prefix+'preferredPhone__c');
        }
        return preferredPhoneLabelToAPI;            
    }
    
    /*******************************************************************************************************
    * @description Copies the value of the standard Phone field to the Other Phone field if Phone has a value and no other phones.
    * @param contact the contact to change
    * @param phone the value that needs to be set for standard phone
    * @param preferredPhone the preferred phone label
    */

    private static void setPhoneFields(Contact contact, String phone, String preferredPhone) {
        contact.Phone = phone;
        contact.PreferredPhone__c = preferredPhone;
    }

    private static Map<String, Schema.DescribeFieldResult> contactPhoneFieldMap;

    /*******************************************************************************************************
    * @description An inner wrapper class to contain a list of phone fields and perform functions on them
    */

    private class CON_PhoneFieldList {

        private List<CON_PhoneField> allFields {get;set;}
        private List<CON_PhoneField> valuedFields {get;set;}
        public String phoneLabel {get;set;}
        
        /************************************************************
        *@description Constructor for the wrapper class
        *@param Contact in context
        */

        public CON_PhoneFieldList(Contact contact) {

            this.allFields = new List<CON_PhoneField>();
            this.valuedFields = new List<CON_PhoneField>();

            if (contactPhoneFieldMap == null) {
                contactPhoneFieldMap = UTIL_Describe.getFieldsOfType('Contact', 'Phone');
            }
            this.phoneLabel = contactPhoneFieldMap.get('Phone').getLabel();

            Map<String, String> edaPhoneField = new Map<String, String>();
            //build map for EDA phone field map (Label, API Name)
            for(String fieldName : contactPhoneFieldMap.keySet() ) {
                if(String.isNotBlank(UTIL_Namespace.getNamespace()) && fieldName.startsWithIgnoreCase(UTIL_Namespace.getNamespace())) {
                    edaPhoneField.put(contactPhoneFieldMap.get(fieldName).getLabel(), fieldName);
                }
            }

            for(String fieldName : contactPhoneFieldMap.keySet()) {
                String fieldLabel = contactPhoneFieldMap.get(fieldName).getLabel();
                
                // Add the phone field to valued fields if it is not a standard phone
                // If named field check if it is in edaPhoneField Map
                if (fieldName != 'Phone' && !(edaPhoneField.get(fieldLabel) != null && fieldName != edaPhoneField.get(fieldLabel))){
                    String phoneField = (String)contact.get(fieldName);

                    allFields.add(new CON_PhoneField(phoneField, fieldLabel, fieldName));
                    if(String.isNotBlank(phoneField)) {
                        valuedFields.add(new CON_PhoneField(phoneField, fieldLabel, fieldName));
                    }
                }
            }
        }

        public CON_PhoneField getFieldByPrefLabel(String labelSearch) {
            labelSearch = getCustomPicklistValue(labelSearch);
            for(CON_PhoneField field : this.allFields) {
                if (labelSearch == field.label || labelSearch == field.prefLabel) {
                    return field;
                }
            }
            return null;
        }

        public CON_PhoneField getFieldByApiName(String apiSearch) {
            for(CON_PhoneField field : this.allFields) {
                if (apiSearch == field.apiName ) {
                    return field;
                }
            }
            return null;
        }

        private CON_PhoneField valueExists(String search) {
            for(CON_PhoneField field : this.valuedFields ){
                if(String.isNotBlank(search) && field.value == search){
                    return field;
                }
            }
            return null;
        }

        //Check if transalted picklist value of preferred phone exist
        private String getCustomPicklistValue(String labelSearch) {       
            Map<String,String> apiLabelMappings = new Map<String,String>();       
            Schema.DescribeFieldResult fieldResult = Contact.PreferredPhone__c.getDescribe();
            List<Schema.PicklistEntry> picklistEntries = fieldResult.getPicklistValues();
            for( Schema.PicklistEntry entry : fieldResult.getPicklistValues()) {
                if (entry.getValue() == labelSearch) {
                    return entry.getLabel();
                }
            }
            return labelSearch;         
        }

    }

    /*******************************************************************************************************
    * @description An inner wrapper class to represent a phone field on a contact
    */
    private class CON_PhoneField {

        public String value {get;set;}
        public String label {get;set;}
        public String apiName {get;set;}
        public String prefLabel {get;set;}
        
        /*******************************************************************************************************
        Constructor for wrapper class
        * @param val The value of the phone field
        * @param lbl The label of the phone field
        * @param api The API name of the phone field
        */
        public CON_PhoneField(String val, String lbl, String api ) {
            // Store default phone field mappings to Preferred Phone picklist values prior to EDA 1.86.
            // The mapping is used when Preferred Phone picklist values do not match corresponding the field labels.
            Map<String,String> preferredPhoneMappings = new Map<String,String>{
                'Home Phone' => 'Home',
                'Work Phone' => 'Work',
                'Mobile Phone' => 'Mobile',
                'Other Phone' => 'Other'
            };
            
            this.value = val;
            this.label = lbl;
            this.apiName = api;
            
            Map<String, String> preferredLabelToApi = createPreferredLabelToAPIMap();
            
            /* If the field label is not in Preferrred Phone picklist API values then check if it is in PreferredPhoneMappings, if yes then take the value from mappings
             else keep the label as label. If the field label is in the Preferrred Phone picklist API values then assign the picklist API value that matches the field label
             such that Preferred Phone field will reflect the translated value when users use a language that is not English. */
            if (!PreferredLabelToApi.keySet().contains(lbl)) {
                this.prefLabel = (preferredPhoneMappings.containsKey(lbl)) ? preferredPhoneMappings.get(lbl) : lbl;
            } else {            
                 this.prefLabel = PreferredLabelToApi.get(lbl);
            }
            
        }
        
    }   
}
/*
    Copyright (c) 2019, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2019
 * @group Contacts
 * @group-content ../../ApexDocContent/Contacts.htm
 * @description Unit tests for Preferred Phone
 */
@isTest
private class CON_PreferredPhone_TEST {
    private static Hierarchy_Settings__c enablePreferredPhone() {
        return UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Disable_Preferred_Phone_Enforcement__c = false,
                Enable_New_Preferred_Phone_Sync__c = true
            )
        );
    }

    private static Hierarchy_Settings__c disablePreferredPhone() {
        return UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(
                Disable_Preferred_Phone_Enforcement__c = true,
                Enable_New_Preferred_Phone_Sync__c = false
            )
        );
    }

    /* When Preferred Phone is blank and the count of valued phone fields is one
        update Preferred Phone to label of valued phone and copy the value to 
        standard Phone.
    */
    @isTest
    static void testSinglePhoneSmartSet() {
        enablePreferredPhone();

        Contact newCont = new Contact(FirstName = 'JohnnyTest1', LastName = 'JohnnyTest', WorkPhone__c = '1234567890');

        Test.startTest();
        insert newCont;
        Test.stopTest();

        Contact newContAfter = [
            SELECT Id, FirstName, LastName, Name, WorkPhone__c, Phone, PreferredPhone__c
            FROM Contact
        ];

        System.assertEquals(newContAfter.Phone, newContAfter.WorkPhone__c);
        System.assertEquals('Work Phone', newContAfter.PreferredPhone__c);
    }

    /* When Preferred Phone is defined and the count of valued phone fields is more
        then one, the Preferred Phone field will be used.
        Test Scenario: T-3903365
    */
    @isTest
    static void testMultiplePhoneSmartSetEnforced() {
        enablePreferredPhone();

        Test.startTest();
        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            WorkPhone__c = '1234567890',
            HomePhone = '2345678901',
            OtherPhone = '3456789012',
            PreferredPhone__c = 'Work Phone'
        );
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assertEquals(newContAfter.Phone, newContAfter.WorkPhone__c);
        System.assertEquals('Work Phone', newContAfter.PreferredPhone__c);
    }

    /*
     * When Preferred Phone is blank and the count of valued phone fields is one
     * update Preferred Phone to label of valued phone and copy the value to
     * standard Phone.
     * Test Scenario: T-3903367
     */
    @isTest
    static void testMultiplePhoneSmartSetUnenforced() {
        disablePreferredPhone();

        Test.startTest();
        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            HomePhone = '2345678901',
            WorkPhone__c = '1234567890',
            OtherPhone = '3456789012',
            PreferredPhone__c = 'Other Phone'
        );
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assertEquals(newContAfter.Phone, newContAfter.OtherPhone);

        newContAfter.PreferredPhone__c = 'Work Phone';
        update newContAfter;
        newContAfter = getCurrentContact();

        System.assertEquals(newContAfter.Phone, newContAfter.WorkPhone__c);
    }

    /* When Standard Phone is not null and Preferred Phone is enforced update Preferred Phone
       to Other and update Other Phone to the value of Standard Phone.
    */
    @isTest
    static void testUpdatePrefPhoneToOther() {
        enablePreferredPhone();

        Contact newCont = new Contact(FirstName = 'JohnnyTest1', LastName = 'JohnnyTest');
        insert newCont;

        Test.startTest();
        newCont.Phone = '0000000000';
        update newCont;
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assertEquals('0000000000', newContAfter.OtherPhone);
        System.assertEquals('Other Phone', newContAfter.PreferredPhone__c);
    }

    /* Clear the value in Standard Phone when the other valued Phone is cleared
     *  Test Scenario: T-3903368
     */
    @isTest
    static void testClearPhoneValue() {
        enablePreferredPhone();

        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            Phone = '111111111',
            HomePhone = '2345678901',
            WorkPhone__c = '1234567890',
            OtherPhone = '3456789012',
            PreferredPhone__c = 'Work Phone'
        );

        Contact newContAfter = getCurrentContact();
        Test.startTest();
        newContAfter.WorkPhone__c = 'JJJJJ';
        update newContAfter;
        Test.stopTest();

        newContAfter = getCurrentContact();
        System.assertEquals('JJJJJ', newContAfter.Phone);
    }

    /* Update standard Phone's value to another valued phone's and update Preferred Phone to
     the label of another Phone.  */
    @isTest
    static void testOnClearOther() {
        enablePreferredPhone();

        Contact newCont = new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            WorkPhone__c = '111111111',
            PreferredPhone__c = 'Work Phone',
            OtherPhone = '0000000000'
        );
        insert newCont;

        Contact newContAfter = getCurrentContact();
        Test.startTest();
        newContAfter.WorkPhone__c = '';
        newContAfter.PreferredPhone__c = '';
        update newContAfter;
        Test.stopTest();

        newContAfter = getCurrentContact();
        System.assertEquals('Other Phone', newContAfter.PreferredPhone__c);
        System.assertEquals('0000000000', newContAfter.Phone);
    }

    /*
     Update Preferred Phone to 'Phone (Standard)' when standard Phone's value is not same as 
     any other Phone values and when Preferred Phone is Blank and the Context is batch.
    */
    @isTest
    static void testBatchPhoneNull() {
        disablePreferredPhone();

        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            Phone = '111111111',
            OtherPhone = '0000000000'
        );

        Test.startTest();
        enablePreferredPhone();
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Database.executeBatch(batch);
        Test.stopTest();

        System.assertEquals('Phone (standard)', getCurrentContact().PreferredPhone__c);
    }

    /* 
     Updates Preferred Phone to the label of the Phone field that has a value which is not same as 
     standard phone
    */
    @isTest
    static void testBatchOther() {
        disablePreferredPhone();

        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            Phone = '111111111',
            OtherPhone = '111111111'
        );

        Test.startTest();
        enablePreferredPhone();
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Database.executeBatch(batch);
        Test.stopTest();

        System.assertEquals('Other Phone', getCurrentContact().PreferredPhone__c);
    }

    /* Validation when there are more than one phone fields but not Preferred Phone
     * Test Scenario: T-3903371
     */
    @isTest
    static void testErrorPrefPhoneAmbiguous() {
        enablePreferredPhone();
        Contact newCont = new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            WorkPhone__c = '111111111',
            OtherPhone = '0000000000'
        );

        try {
            Test.startTest();
            insert newCont;
            Test.stopTest();
            System.assert(false, 'Multiple phones without preference specified should error out - when enforced');
        } catch (Exception error) {
            System.assert(error.getMessage().contains(Label.PreferredPhoneRequiredError));
        }

        disablePreferredPhone();
        insert newCont;
        System.assert(true, 'Multiple phones without preference specified should not error out - when unenforced');
    }

    /* Ensure contact edits validate against missing specififed preferred phone(home phone)
     *  Test Scenario: T-3903370
     */
    @isTest
    static void testcontactUpdatePrefPhoneNotBlankUponSettingUpdate() {
        enablePreferredPhone();

        Contact newCont = new Contact(FirstName = 'JohnnyTest1', LastName = 'JohnnyTest', OtherPhone = '0000000000');
        insert newCont;

        Hierarchy_Settings__c settings = enablePreferredPhone();
        settings.Preferred_Phone_Selection__c = 'homePhone';
        UTIL_CustomSettingsFacade.getSettingsForTests(settings);

        newCont.PreferredPhone__c = 'Home phone';
        try {
            Test.startTest();
            update newCont;
            Test.stopTest();
            System.assert(false, 'Missing preferred phone should error out.');
        } catch (Exception error) {
            System.assert(error.getMessage().contains(Label.PreferredPhoneMatchNotNull));
        }

        newCont.HomePhone = '0000000000';
        update newCont;
    }

    /* Validation when Preferred Phone is selected but no other Phone Fields have a value
     *  Test Scenario: T-3903364
     */
    @isTest
    static void testPrefPhoneNotBlankEnforced() {
        enablePreferredPhone();
        try {
            Test.startTest();
            testPrefPhoneNotBlank();
            Test.stopTest();
            System.assert(false, 'Should error out when no phone is indicated.');
        } catch (Exception error) {
            System.assert(error.getMessage().contains(Label.PreferredPhoneMatchNotNull));
        }
    }

    /* Validation when Preferred Phone is unenforced and no phone fields are populated value
     *  Test Scenario: T-3903366
     */
    @isTest
    static void testPrefPhoneNotBlankUnenforced() {
        disablePreferredPhone();
        try {
            Test.startTest();
            insert new Contact(
                FirstName = 'JohnnyTest1',
                LastName = 'JohnnyTest',
                WorkPhone__c = '1234567890',
                HomePhone = '2345678901',
                OtherPhone = '3456789012',
                PreferredPhone__c = 'NONE'
            );
            Test.stopTest();
        } catch (Exception error) {
            System.assert(
                false,
                'When preferred phone is unenforced, contact without specified phone insertion should persist.'
            );
        }
    }

    private static void testPrefPhoneNotBlank() {
        insert new Contact(FirstName = 'JohnnyTest1', LastName = 'JohnnyTest', PreferredPhone__c = 'Work');
    }

    /* Validation when Preferred Phone label doesn't match any of the other fields
     *  Test Scenario: T-3903363
     */
    @isTest
    static void testPrefDiffValue() {
        enablePreferredPhone();

        try {
            Test.startTest();
            insert new Contact(
                FirstName = 'JohnnyTest1',
                LastName = 'JohnnyTest',
                WorkPhone__c = '111111111',
                PreferredPhone__c = 'ForTestingPurposes'
            );
            Test.stopTest();
        } catch (Exception error) {
            System.assert(error.getMessage().contains(Label.PreferredPhoneMatchMustExist));
        }
    }

    /*
    Update Preferred Phone when Phone Clean Up batch job is run. 
    */
    @isTest
    static void testBatchWPreferredPhoneSelection() {
        disablePreferredPhone();

        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            OtherPhone = '0000000000',
            HomePhone = '111111111'
        );

        Test.startTest();
        Hierarchy_Settings__c settings = enablePreferredPhone();
        settings.Preferred_Phone_Selection__c = 'homePhone';
        UTIL_CustomSettingsFacade.getSettingsForTests(settings);

        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Database.executeBatch(batch);
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assertEquals('Home Phone', newContAfter.PreferredPhone__c);
        System.assertEquals('111111111', newContAfter.Phone);
    }

    /*
    Update Preferred Phone and Phone when Phone Clean Up batch job is run with no selection done in EDA Settings. 
    */
    @isTest
    static void testBatchWNoPreferredPhoneSelection() {
        disablePreferredPhone();

        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            OtherPhone = '0000000000',
            HomePhone = '111111111'
        );

        Test.startTest();
        enablePreferredPhone();
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Database.executeBatch(batch);
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assert(newContAfter.PreferredPhone__c != null);
        System.assert(newContAfter.Phone != null);
    }

    /*
    Update Preferred Phone and Phone when Phone Clean Up batch job is run with selection done in EDA Settings
    but value null on contact record.
    */

    @isTest
    static void testBatchWPreferredPhoneSelectionMisMatch() {
        disablePreferredPhone();

        insert new Contact(
            FirstName = 'JohnnyTest1',
            LastName = 'JohnnyTest',
            OtherPhone = '0000000000',
            MobilePhone = '0000000000'
        );

        Test.startTest();
        Hierarchy_Settings__c settings = enablePreferredPhone();
        settings.Preferred_Phone_Selection__c = 'homePhone';
        UTIL_CustomSettingsFacade.getSettingsForTests(settings);

        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Database.executeBatch(batch);
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assert(newContAfter.PreferredPhone__c != null);
        System.assert(newContAfter.Phone == '0000000000');
    }

    /*
     Copy value of Standard Phone Field to Other when Preferred Phone is Null, Standard Phone is not null and
     all other phones are null.
    */
    @isTest
    static void testCopyStdPhoneToOther() {
        enablePreferredPhone();

        Test.startTest();
        insert new Contact(FirstName = 'JohnnyTest1', LastName = 'JohnnyTest', Phone = '0000000000');
        Test.stopTest();

        Contact newContAfter = getCurrentContact();
        System.assertEquals('Other Phone', newContAfter.PreferredPhone__c);
        System.assert(newContAfter.OtherPhone == '0000000000');
    }

    /* When Standard Phone is not null and Preferred Phone is enforced update Preferred Phone
       to Other and update Other Phone to the value of Standard Phone.
    */
    @isTest
    static void testUpdatePrefPhoneTOtherBulk() {
        enablePreferredPhone();

        List<Contact> contactsToInsert = new List<Contact>();
        for (Integer i = 0; i < 100; i++) {
            Contact a = new Contact(FirstName = 'TestAccount' + i, LastName = 'JohnnyTest' + i);
            contactsToInsert.add(a);
        }
        insert contactsToInsert;

        Test.startTest();
        for (Contact each : contactsToInsert) {
            each.Phone = '0000000000';
        }
        update contactsToInsert;
        Test.stopTest();

        List<Contact> newContAfterList = [
            SELECT Id, FirstName, LastName, Name, OtherPhone, Phone, PreferredPhone__c
            FROM Contact
        ];

        for (Contact each : newContAfterList) {
            System.assertEquals('0000000000', each.OtherPhone);
            System.assertEquals('Other Phone', each.PreferredPhone__c);
        }
    }

    private static Contact getCurrentContact() {
        return [
            SELECT Id, FirstName, LastName, Name, Phone, WorkPhone__c, OtherPhone, PreferredPhone__c
            FROM Contact
            LIMIT 1
        ];
    }
}
/*
    Copyright (c) 2020, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
 
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
* @author Salesforce.org
* @date 2020
* @group Contacts
* @group-content ../../ApexDocContent/Contacts.htm
* @description Test class for CON_Preferred_TDTM - Preferred Email functionality.
*/
@isTest
private class CON_Preferred_Email_TEST {

    /**************************************************************************************************************************
    ****************************************************** UNIT TESTS *********************************************************
    **************************************************************************************************************************/

    /*************************************************************************************************************
    * @description NULL test for run method to verify null is returned when newList is null
    *************************************************************************************************************/
    @isTest
    private static void runMethodNULLTest() {

        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.AfterUpdate;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            TDTM_Runnable.DmlWrapper dmlWrapperReturned = tdtmClass.run(null, null, testAction, objResult);
        Test.stopTest();

        System.assertEquals(null, dmlWrapperReturned);

    }

    /*************************************************************************************************************
    * @description Test for run method to verify null is returned when newList is empty
    *************************************************************************************************************/
    @isTest
    private static void runMethodEmptyTest() {

        List<Contact> newContactsList = new List<Contact>();
        List<SObject> oldContactList = new List<SObject>();

        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.AfterUpdate;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            TDTM_Runnable.DmlWrapper dmlWrapperReturned = tdtmClass.run(newContactsList, oldContactList, testAction, objResult);
        Test.stopTest();

        System.assertEquals(null, dmlWrapperReturned);

    }

    /*************************************************************************************************************
    * @description Tests runMethod in BeforInsert Context
    *************************************************************************************************************/
    @isTest
    private static void runMethodBeforeInsert() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> contactList = new List<Contact>();

        Contact contact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact1.Email = 'test@sf.org';

        Contact contact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact2.Preferred_Email__c = 'Alternate Email';

        contactList.add(contact1);
        contactList.add(contact2);

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            tdtmClass.run(contactList, null, TDTM_Runnable.Action.BeforeInsert, Schema.SObjectType.Contact);
        Test.stopTest();

        System.assertEquals('Alternate Email', contact1.Preferred_Email__c);
        System.assertEquals(contact1.Email, contact1.AlternateEmail__c);

        System.assertEquals(true, contact2.hasErrors());
        System.assertEquals(Label.PreferredEmailMatchNotNull, contact2.getErrors()[0].getMessage());
              
    }
    
    /*************************************************************************************************************
    * @description Tests runMethod in BeforUpdate Context
    *************************************************************************************************************/
    @isTest
    private static void runMethodBeforeUpdate() {

        List<Contact> oldContactList = new List<Contact>();
        List<Contact> newContactList = new List<Contact>();

        Contact oldContact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        oldContact1.Email = '';
        oldContact1.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

        Contact newContact1 = oldContact1.clone(true);
        newContact1.Email = 'test@sf.org';

        Contact oldContact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        oldContact2.Email = '';
        oldContact2.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);

        Contact newContact2 = oldContact2.clone(true);
        newContact2.Preferred_Email__c = 'Alternate Email';

        oldContactList.add(oldContact1);
        oldContactList.add(oldContact2);
        newContactList.add(newContact1);
        newContactList.add(newContact2);

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            tdtmClass.run(newContactList, oldContactList, TDTM_Runnable.Action.BeforeUpdate, Schema.SObjectType.Contact);
        Test.stopTest();

        System.assertEquals('Alternate Email', newContact1.Preferred_Email__c);
        System.assertEquals(newContact1.Email, newContact1.AlternateEmail__c);
        System.assertEquals(true, newContact2.hasErrors());
        System.assertEquals(Label.PreferredEmailMatchNotNull, newContact2.getErrors()[0].getMessage());

    }
    
    /*************************************************************************************************************
    * @description Tests handleBeforeInsert method under recursion to ensure no Contacts are processed
    *************************************************************************************************************/
    @isTest
    private static void handleBeforeInsertInRecursion() {

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        tdtmClass.setRecursion();
        Test.startTest();
            List<Contact> returnedContactList = tdtmClass.handleBeforeInsert(UTIL_UnitTestData_TEST.getMultipleTestContacts(5));
        Test.stopTest();

        System.assertEquals(0, returnedContactList.size());
    }
    
    /*************************************************************************************************************
    * @description Tests handleBeforeInsert method
    *************************************************************************************************************/
    @isTest
    private static void handleBeforeInsert() {

        List<Contact> contactList = new List<Contact>();

        Contact contact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact1.Email = '';
        contactList.add(contact1);

        Contact contact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact2.Email = 'test@sf.org';
        contactList.add(contact2);

        Contact contact3 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact3.Preferred_Email__c = 'Alternate Email';
        contactList.add(contact3);

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            List<Contact> returnedContactList = tdtmClass.handleBeforeInsert(contactList);
        Test.stopTest();

        System.assertEquals(2, returnedContactList.size(), 'Contact1 should not be in the list');
        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM));
        
    }

    /*************************************************************************************************************
    * @description Tests handleBeforeInsert method with Preferred Phone
    *************************************************************************************************************/
    @isTest
    private static void handleBeforeInsertWithPreferredPhone() {

        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c
                                                         (Enable_New_Preferred_Phone_Sync__c = false));

        List<Contact> contactList = new List<Contact>();

        Contact contact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact1.Email = 'test@sf.org';
        contact1.Phone = '';
        contact1.HomePhone = '1234567890';
        contact1.PreferredPhone__c = 'Home Phone';

        contactList.add(contact1);

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            List<Contact> returnedContactList = tdtmClass.handleBeforeInsert(contactList);
        Test.stopTest();

        System.assertEquals(1, returnedContactList.size());
        System.assertEquals(contact1.HomePhone, returnedContactList[0].Phone);
        System.assertEquals(contact1.Email, returnedContactList[0].AlternateEmail__c);
        System.assertEquals('Alternate Email', returnedContactList[0].Preferred_Email__c);

    }

    /*************************************************************************************************************
    * @description Tests handleBeforeUpdate method under recursion to ensure no Contacts are processed
    *************************************************************************************************************/
    @isTest
    private static void handleBeforeUpdateInRecursion() {

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        tdtmClass.setRecursion();
        Test.startTest();
            List<Contact> returnedContactList = tdtmClass.handleBeforeUpdate(UTIL_UnitTestData_TEST.getMultipleTestContacts(5), null);
        Test.stopTest();

        System.assertEquals(0, returnedContactList.size());
    }
    
    /*************************************************************************************************************
    * @description Tests handleBeforeUpdate method
    *************************************************************************************************************/
    @isTest
    private static void handleBeforeUpdate() {

        List<Contact> oldList = new List<Contact>();

        Contact contact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact1.Email = '';
        contact1.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);
        oldList.add(contact1);

        Contact contact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact2.Email = '';
        contact2.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);
        oldList.add(contact2);

        Contact contact3 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact3.Email = '';
        contact3.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);
        oldList.add(contact3);

        Contact newContact1 = contact1.clone(true);
        Contact newContact2 = contact2.clone(true);
        newContact2.Email = 'test@sf.org';
        Contact newContact3 = contact3.clone(true);
        newContact3.Preferred_Email__c = 'Alternate Email';

        List<Contact> newList = new List<Contact>();
        newList.add(newContact1);
        newList.add(newContact2);
        newList.add(newContact3);

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            List<Contact> returnedContactList = tdtmClass.handleBeforeUpdate(newList, oldList);
        Test.stopTest();

        System.assertEquals(2, returnedContactList.size(), 'Contact1 should not be in the list');
        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM));

    }

    /*************************************************************************************************************
    * @description Tests handleBeforeUpdate with Preferred Phone
    *************************************************************************************************************/
    @isTest
    private static void handleBeforeUpdateWithPreferredPhone() {

        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c
                                                      (Enable_New_Preferred_Phone_Sync__c = false));

        List<Contact> newContactList = new List<Contact>();
        List<Contact> oldContactList = new List<Contact>();

        Contact contact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        contact1.Phone = '';
        contact1.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.sObjectType);
        oldContactList.add(contact1);

        Contact newContact1 = contact1.clone(true);
        contact1.Email = 'test@sf.org';
        contact1.HomePhone = '1234567890';
        contact1.PreferredPhone__c = 'Home Phone';
        newContactList.add(contact1);

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            List<Contact> returnedContactList = tdtmClass.handleBeforeUpdate(newContactList, oldContactList);
        Test.stopTest();

        System.assertEquals(1, returnedContactList.size());
        System.assertEquals(contact1.HomePhone, returnedContactList[0].Phone);
        System.assertEquals(contact1.Email, returnedContactList[0].AlternateEmail__c);
        System.assertEquals('Alternate Email', returnedContactList[0].Preferred_Email__c);

    }

    /****************************************************************************
    * @description Tests locateContactEmailService method of CON_Preferred_TDTM
    ****************************************************************************/
    @isTest
    private static void locateContactEmailService() {

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            SRVC_Contact_PreferredEmail preferredEmailService = tdtmClass.locateContactEmailService();
        Test.stopTest();

        SRVC_Contact_PreferredEmail srvcInstance = SRVC_Contact_PreferredEmail.getInstance();

        System.assertEquals(srvcInstance, preferredEmailService);

    }
    
    /****************************************************************************
    * @description Tests locatePreferredEmailMapper method of CON_Preferred_TDTM
    ****************************************************************************/
    @isTest
    private static void locatePreferredEmailMapper() {

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        Test.startTest();
            MAPR_CON_PreferredEmailFields preferredEmailFields = tdtmClass.locatePreferredEmailMapper();
        Test.stopTest();

        MAPR_CON_PreferredEmailFields srvcInstance = MAPR_CON_PreferredEmailFields.getInstance();

        System.assertEquals(srvcInstance, preferredEmailFields);
        
    }

    /********************************************************
    * @description Tests setRecursion method
    *********************************************************/
    @isTest
    static void setRecursion() {
        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();

        Test.startTest();
            tdtmClass.setRecursion();
        Test.stopTest();

        Boolean preferredTDTMFlag = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM
        );

        System.assertEquals(true, preferredTDTMFlag, 'CON_Preferred_TDTM should be active');
    }

    /********************************************************
    * @description Tests unsetRecursion method
    *********************************************************/
    @isTest
    static void unsetRecursion() {

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        tdtmClass.setRecursion();

        System.assertEquals(true, TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM
        ));

        Test.startTest();
            tdtmClass.unsetRecursion();
        Test.stopTest();

        Boolean preferredTDTMFlag = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM
        );

        System.assertEquals(false, preferredTDTMFlag, 'CON_Preferred_TDTM should be Inactive');
    }
    
    /********************************************************
    * @description Tests isRecursion method
    *********************************************************/
    @isTest
    static void isRecursion() {

        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();
        tdtmClass.setRecursion();

        System.assertEquals(true, TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM
        ));

        Test.startTest();
            tdtmClass.isRecursion();
        Test.stopTest();

        Boolean preferredTDTMFlag = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM
        );

        System.assertEquals(true, preferredTDTMFlag, 'CON_Preferred_TDTM should be Active');
    }

    /********************************************************************
    * @description Tests isNewPreferredPhoneFunctionalityEnabled method
    ********************************************************************/
    @isTest
    static void isNewPreferredPhoneFunctionalityEnabled() {
        UTIL_CustomSettingsFacade.getSettingsForTests(new Hierarchy_Settings__c
                                                         (Enable_New_Preferred_Phone_Sync__c = true));
        
        CON_Preferred_TDTM tdtmClass = new CON_Preferred_TDTM();

        Test.startTest();
            Boolean preferredPhoneEnabled = tdtmClass.isNewPreferredPhoneFunctionalityEnabled();
        Test.stopTest();

        System.assertEquals(true, preferredPhoneEnabled, 'Preferred Phone should be enabled');
    }

    /**************************************************************************************************************************
    ****************************************************** FUNCTIONAL TESTS ***************************************************
    **************************************************************************************************************************/

    /*****************************************************************************************************************************
    * @description Tests inserting a Contact with Preferred Email and no Email fields will throw PreferredEmailMatchNotNull Error
    * when Preferred Email Enforcement is Enabled
    *****************************************************************************************************************************/
    @isTest
    static void preferredEmailNotBlankOnInsertWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
            );
    
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = 'Alternate Email';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = 'Alternate Email';

        try {
            Test.startTest();
                insert testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /*****************************************************************************************************************************
    * @description Tests inserting a Contact with Preferred Email and no Email fields will throw PreferredEmailMatchNotNull Error
    * when Preferred Email Enforcement is Disabled
    *****************************************************************************************************************************/
    @isTest 
    static void preferredEmailNotBlankOnInsertWithEnforcementDisabled() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = 'Alternate Email';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = 'Alternate Email';

        try {
            Test.startTest();
                insert testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /*****************************************************************************************************************************
    * @description Tests Updating a Contact with Preferred Email and no Email fields will throw PreferredEmailMatchNotNull Error
    * when Preferred Email Enforcement is Enabled
    *****************************************************************************************************************************/
    @isTest
    static void preferredEmailNotBlankOnUpdateWithEnforcementEnabled() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        
        insert testContactList;
        testContactList[0].Preferred_Email__c = 'Alternate';
        testContactList[1].Preferred_Email__c = 'Alternate';
        try {
            Test.startTest();
                update testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }
    
    /*****************************************************************************************************************************
    * @description Tests Updating a Contact with Preferred Email and no Email fields will throw PreferredEmailMatchNotNull Error
    * when Preferred Email Enforcement is Disabled
    *****************************************************************************************************************************/
    @isTest 
    static void preferredEmailNotBlankOnUpdateWithEnforcementDisabled() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        
        insert testContactList;
        testContactList[0].Preferred_Email__c = 'Alternate';
        testContactList[1].Preferred_Email__c = 'Alternate';
        try {
            Test.startTest();
                update testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /*********************************************************************************************************************************
    * @description Tests Inserting a Contact with standard Email field populated will update Alternate Email to the value in Standard
    * Email and update Preferred Email to 'Alternate Email' when Preferred Email Enforcement is enabled
    *********************************************************************************************************************************/
    @isTest 
    static void standardEmailNotBlankOnInsert() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].Email = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].Email = 'test@sf.org';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> updatedContact = [SELECT Id, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals('test@sf.org', updatedContact[0].AlternateEmail__c, 'Alternate Email should be same as standard email');
        System.assertEquals('Alternate Email', updatedContact[0].Preferred_Email__c, 'Preferred Email should be set to Alternate Email');
        System.assertEquals('test@sf.org', updatedContact[1].AlternateEmail__c, 'Alternate Email should be same as standard email');
        System.assertEquals('Alternate Email', updatedContact[1].Preferred_Email__c, 'Preferred Email should be set to Alternate Email');
    }
    
    /*********************************************************************************************************************************
    * @description Tests inserting a Contact with standard Email field populated will not update Alternate Email
    * and Preferred Email when Preferred Email Enforcement is diabled
    *********************************************************************************************************************************/
    @isTest 
    static void standardEmailNotBlankOnInsertNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].Email = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].Email = 'test@sf.org';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals(null, updatedContactList[0].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should be cleared');
        System.assertEquals(null, updatedContactList[1].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should be cleared');
    }

     /*********************************************************************************************************************************
    * @description Tests Updating a Contact in Batch context with standard Email field populated will update Alternate Email to the 
    * value in Standard Email and update Preferred Email to 'Alternate Email' when Preferred Email Enforcement is enabled
    *********************************************************************************************************************************/
    @isTest 
    static void standardEmailNotBlankOnBatch() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].Email = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].Email = 'test@sf.org';
        
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);
        insert testContactList;
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals('test@sf.org', updatedContactList[0].AlternateEmail__c, 'Alternate Email should be same as standard email');
        System.assertEquals('Alternate Email', updatedContactList[0].Preferred_Email__c, 'Preferred Email should be alternate email');
        System.assertEquals('test@sf.org', updatedContactList[1].AlternateEmail__c, 'Alternate Email should be same as standard email');
        System.assertEquals('Alternate Email', updatedContactList[1].Preferred_Email__c, 'Preferred Email should be alternate email');

    }
    
    /*********************************************************************************************************************************
    * @description Tests Updating a Contact in Batch context with standard Email field populated will not update Alternate Email
    * and Preferred Email when Preferred Email Enforcement is disbaled
    *********************************************************************************************************************************/
    @isTest 
    static void standardEmailNotBlankOnBatchNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].Email = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].Email = 'test@sf.org';
        
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);
        insert testContactList;
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);
        CON_Email_BATCH batch = new CON_Email_BATCH(null);

        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c FROM COntact];

        System.assertEquals(null, updatedContactList[0].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c , 'Preferred Email should be cleared');
        System.assertEquals(null, updatedContactList[1].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c , 'Preferred Email should be cleared');

    }

    /*********************************************************************************************************************************
    * @description Tests Updating a Contact to populate standard Email field will update Alternate Email to the 
    * value in Standard Email and update Preferred Email to 'Alternate Email' when Preferred Email Enforcement is enabled
    *********************************************************************************************************************************/
    @isTest 
    static void standardEmailNotBlankOnUpdate() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        
        insert testContactList;
        testContactList[0].Email = 'test@sf.org';
        testContactList[1].Email = 'test@sf.org';
        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals('test@sf.org', updatedContactList[0].AlternateEmail__c, 'Alternate Email should be same as standard email');
        System.assertEquals('Alternate Email', updatedContactList[0].Preferred_Email__c, 'Preferred Email should be alternate email');
        System.assertEquals('test@sf.org', updatedContactList[1].AlternateEmail__c, 'Alternate Email should be same as standard email');
        System.assertEquals('Alternate Email', updatedContactList[1].Preferred_Email__c, 'Preferred Email should be alternate email');
        
    }
    
    /*********************************************************************************************************************************
    * @description Tests Updating a Contact's standard Email field will not update Alternate Email
    * and Preferred Email when Preferred Email Enforcement is disabled
    *********************************************************************************************************************************/
    @isTest 
    static void standardEmailNotBlankOnUpdateNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        
        insert testContactList;
        testContactList[0].Email = 'test@sf.org';
        testContactList[1].Email = 'test@sf.org';

        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals(null, updatedContactList[0].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should be cleared');
        System.assertEquals(null, updatedContactList[1].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should be cleared');
        
    }

    /*********************************************************************************************************************************
    * @description Tests Updating a Contact to clear Preferred Email and the value corresponding to the field in Preferred Email will
    * clear the value in standard Email field
    *********************************************************************************************************************************/
    @isTest 
    static void clearEmailFieldsOnUpdate() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        insert testContactList;

        List<Contact> insertedContactList = [SELECT Id, Email, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals('test@sf.org', insertedContactList[0].Email);
        System.assertEquals('Alternate Email', insertedContactList[0].Preferred_Email__c);
        System.assertEquals('test@sf.org', insertedContactList[1].Email);
        System.assertEquals('Alternate Email', insertedContactList[1].Preferred_Email__c);

        insertedContactList[0].AlternateEmail__c = '';
        insertedContactList[0].Preferred_Email__c = null;
        insertedContactList[1].AlternateEmail__c = '';
        insertedContactList[1].Preferred_Email__c = null;
        
        Test.startTest();
            update insertedContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, updatedContactList[0].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should be cleared');
        System.assertEquals(null, updatedContactList[0].Email, 'Standard Email should be cleared');
        System.assertEquals(null, updatedContactList[1].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should be cleared');
        System.assertEquals(null, updatedContactList[1].Email, 'Standard Email should be cleared');
    } 
    
    /*********************************************************************************************************************************
    * @description Tests Updating a Contact to clear Preferred Email and all other custom email fields will not clear the value in
    * standard email field
    *********************************************************************************************************************************/
    @isTest 
    static void clearEmailFieldsOnUpdateNegative() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        insert testContactList;

        List<Contact> insertedContactList = [SELECT Id, Email, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals('test@sf.org', insertedContactList[0].Email);
        System.assertEquals('Alternate Email', insertedContactList[0].Preferred_Email__c);
        System.assertEquals('test@sf.org', insertedContactList[1].Email);
        System.assertEquals('Alternate Email', insertedContactList[1].Preferred_Email__c);

        MAPR_CON_PreferredEmailFields.preferredEmailFieldSettingsModel = null;
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );        


        insertedContactList[0].AlternateEmail__c = '';
        insertedContactList[0].Preferred_Email__c = null;
        insertedContactList[1].AlternateEmail__c = '';
        insertedContactList[1].Preferred_Email__c = null;
        
        Test.startTest();
            update insertedContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, updatedContactList[0].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should be cleared');
        System.assertEquals('test@sf.org', updatedContactList[0].Email, 'Standard Email should not be cleared');
        System.assertEquals(null, updatedContactList[1].AlternateEmail__c, 'Alternate Email should be cleared');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should be cleared');
        System.assertEquals('test@sf.org', updatedContactList[1].Email, 'Standard Email should not be cleared');

    }

    /*********************************************************************************************************************************
    * @description Tests Updating a Contact by clearing Preferred Email and other custom email fields, leaving one email field populated
    * will not repopule values in Standard Email and Preferred Email when Preferred Email Enforcement is disabled
    *********************************************************************************************************************************/
    @isTest 
    static void clearStandEmailAndSomeEmailFieldsOnUpdateTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
            );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = 'demo@sf.org';
        testContactList[0].Preferred_Email__c = 'Work Email';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = 'demo@sf.org';
        testContactList[1].Preferred_Email__c = 'Work Email';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        insert testContactList;

        List<Contact> insertedContactList = [SELECT Id, Email, AlternateEmail__c, Preferred_Email__c FROM Contact];

        System.assertEquals('demo@sf.org', insertedContactList[0].Email, 'Standard Email should be same as Work Email');
        System.assertEquals('demo@sf.org', insertedContactList[1].Email, 'Standard Email should be same as Work Email');

        MAPR_CON_PreferredEmailFields.preferredEmailFieldSettingsModel = null;
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );        

        // Clear Alternate Email, Preferred Email and Standard Email leaving only work email populated
        insertedContactList[0].AlternateEmail__c = '';
        insertedContactList[0].Preferred_Email__c = null;
        insertedContactList[0].Email = null;
        insertedContactList[1].AlternateEmail__c = '';
        insertedContactList[1].Preferred_Email__c = null;
        insertedContactList[1].Email = null;

        Test.startTest();
            update insertedContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, AlternateEmail__c, Preferred_Email__c, WorkEmail__c, Email FROM Contact];

        System.assertEquals('demo@sf.org', updatedContactList[0].WorkEmail__c, 'Work Email should not be cleared');
        System.assertEquals('demo@sf.org', updatedContactList[1].WorkEmail__c, 'Work Email should not be cleared');
        System.assertEquals(null, updatedContactList[0].AlternateEmail__c, 'Alternate Email should not be re-populated');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should not be re-populated');
        System.assertEquals(null, updatedContactList[0].Email, 'Standard Email should not not be re-populated');
        System.assertEquals(null, updatedContactList[1].AlternateEmail__c, 'Alternate Email should not be re-populated');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should not be re-populated');
        System.assertEquals(null, updatedContactList[1].Email, 'Standard Email should not be re-populated');

    }

    
    /*************************************************************************************************************************
    * @description Tests Inserting a Contact with only one custom Email field will set it as Preferred Email and copy the value 
    * to standard the Email field when Preferred Email Enforcement is Enabled
    **************************************************************************************************************************/
    @isTest
    static void singleEmailSmartSetOnInsert() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].AlternateEmail__c = 'test@sf.org';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email, Preferred_Email__c FROM Contact];
        System.assertEquals('test@sf.org', updatedContactList[0].Email, 'Email should be populated with Alternate Email value');
        System.assertEquals('Alternate Email', updatedContactList[0].Preferred_Email__c, 'Preferred Email shoule be Alternate Email');
        System.assertEquals('test@sf.org', updatedContactList[1].Email, 'Email should be populated with Alternate Email value');
        System.assertEquals('Alternate Email', updatedContactList[1].Preferred_Email__c, 'Preferred Email shoule be Alternate Email');

    }
    
    /*************************************************************************************************************************
    * @description Tests Inserting a Contact with only one custom Email field not set Preferred Email and will not copy the value 
    * to standard the Email field when Preferred Email Enforcement is disabled
    **************************************************************************************************************************/
    @isTest 
    static void singleEmailSmartSetOnInsertNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].AlternateEmail__c = 'test@sf.org';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email, Preferred_Email__c FROM Contact];
        System.assertEquals(null, updatedContactList[0].Email, 'Standard Email should not be popualted');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals(null, updatedContactList[1].Email, 'Standard Email should not be popualted');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should not be popualted');

    }
    
    /*************************************************************************************************************************
    * @description Tests Updating a Contact with only one custom Email field will it as Preferred Email and copy the value 
    * to standard the Email field when Preferred Email Enforcement is Enabled
    **************************************************************************************************************************/
    @isTest 
    static void singleEmailSmartSetOnUpdate() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        insert testContactList;

        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        
        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email, Preferred_Email__c FROM Contact];
        System.assertEquals('test@sf.org', updatedContactList[0].Email,  'Email should be populated with Alternate Email value');
        System.assertEquals('Alternate Email', updatedContactList[0].Preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals('test@sf.org', updatedContactList[1].Email, 'Email should be populated with Alternate Email value');
        System.assertEquals('Alternate Email', updatedContactList[1].Preferred_Email__c, 'Preferred Email should not be popualted');

    }
    
    /*************************************************************************************************************************
    * @description Tests Updating a Contact with only one custom Email field will not set Preferred Email and will not copy 
    * the value to standard the Email field when Preferred Email Enforcement is disbaled
    **************************************************************************************************************************/
    @isTest 
    static void singleEmailSmartSetOnUpdateNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        insert testContactList;

        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email, Preferred_Email__c FROM Contact];
        System.assertEquals(null, updatedContactList[0].Email, 'Standard Email should not be popualted');
        System.assertEquals(null, updatedContactList[0].Preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals(null, updatedContactList[1].Email, 'Standard Email should not be popualted');
        System.assertEquals(null, updatedContactList[1].Preferred_Email__c, 'Preferred Email should not be popualted');

    }
    
    /*************************************************************************************************************************
    * @description Tests Inserting a Contact with more than one custom Email fields will throw PreferredEmailRequiredError
    * when Preferred Email Enforcement is Enabled
    **************************************************************************************************************************/
    @isTest 
    static void multipleEmailsOnInsert() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        try {
            Test.startTest();
                insert testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when multiple email fields have value and when Preferred Email is Blank.');
        } catch (DmlException  error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailRequiredError));
        }
    }
    
    /***********************************************************************************************************************************
    * @description Tests inserting a Contact with more than one custom Email fields will not throw any error and not set Preferred Email
    * and standard Email field when Preferred Email Enforcement is disabled
    ************************************************************************************************************************************/
    @isTest 
    static void multipleEmailsOnInsertNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> insertedContactList = [SELECT Id, Email, Preferred_Email__c FROM Contact];
        System.assertEquals(null, insertedContactList[0].Preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals(null, insertedContactList[0].Email, 'Standard Email should not be popualted');
        System.assertEquals(null, insertedContactList[1].Preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals(null, insertedContactList[1].Email, 'Standard Email should not be popualted');

    }
    
    /*************************************************************************************************************************
    * @description Tests updating a Contact with more than one custom Email fields will throw PreferredEmailRequiredError
    * when Preferred Email Enforcement is Enabled
    **************************************************************************************************************************/
    @isTest 
    static void multipleEmailsOnUpdate() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        insert testContactList;

        try {
            testContactList[0].AlternateEmail__c = 'test@sf.org';
            testContactList[0].WorkEmail__c = 'test@sf.org';
            testContactList[1].AlternateEmail__c = 'test@sf.org';
            testContactList[1].WorkEmail__c = 'test@sf.org';
            Test.startTest();
                update testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when multiple email fields have value and when Preferred Email is Blank.');
        } catch (DmlException  error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailRequiredError));
        }
    }
    
    /*************************************************************************************************************************
    * @description Tests updating a Contact with more than one custom Email fields will not throw any Error
    * and will not set Preferred Email or standarad email when Preferred Email Enforcement is Disbaled
    **************************************************************************************************************************/
    @isTest 
    static void multipleEmailsOnUpdateNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        insert testContactList;

        testContactList[0].AlternateEmail__c = 'test@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].AlternateEmail__c = 'test@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        
        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, preferred_Email__c, Email FROM Contact];
        System.assertEquals(null, updatedContactList[0].preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals(null, updatedContactList[0].Email, 'Standard Email should not be popualted');
        System.assertEquals(null, updatedContactList[1].preferred_Email__c, 'Preferred Email should not be popualted');
        System.assertEquals(null, updatedContactList[1].Email, 'Standard Email should not be popualted');

    }

    /************************************************************************************************************************************
    * @description Tests inserting a Contact with one custom Email field and Preferred Email which doesn't correspond to preferred Email
    * will throw PreferredEmailMatchNotNull when Preferred Email Enforcement is Enabled
    *************************************************************************************************************************************/
    @isTest 
    static void insertWithPreferredEmailMatchNotNullErrorWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].Preferred_Email__c = 'Alternate Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Email = '';
        testContactList[1].Preferred_Email__c = 'Alternate Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        try {
            Test.startTest();
                insert testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /************************************************************************************************************************************
    * @description Tests inserting a Contact with one custom Email field and Preferred Email which doesn't correspond to preferred Email
    * will throw PreferredEmailMatchNotNull when Preferred Email Enforcement is Disabled
    *************************************************************************************************************************************/
    @isTest 
    static void insertWithPreferredEmailMatchNotNullErrorWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].Preferred_Email__c = 'Alternate Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Email = '';
        testContactList[1].Preferred_Email__c = 'Alternate Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        try {
            Test.startTest();
                insert testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /************************************************************************************************************************************
    * @description Tests upating a Contact with one custom Email field and Preferred Email which doesn't correspond to preferred Email
    * will throw PreferredEmailMatchNotNull when Preferred Email Enforcement is Enabled
    *************************************************************************************************************************************/
    @isTest 
    static void updateWithPreferredEmailMatchNotNullErrorWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].WorkEmail__c = '';
        testContactList[1].Email = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        insert testContactList;

        testContactList[0].Preferred_Email__c = 'Alternate Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Alternate Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        
        try {
            Test.startTest();
                update testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /************************************************************************************************************************************
    * @description Tests upating a Contact with one custom Email field and Preferred Email which doesn't correspond to preferred Email
    * will throw PreferredEmailMatchNotNull when Preferred Email Enforcement is disabled
    *************************************************************************************************************************************/
    @isTest 
    static void updateWithPreferredEmailMatchNotNullErrorWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[0].WorkEmail__c = '';
        testContactList[1].Email = '';
        testContactList[1].Preferred_Email__c = '';
        testContactList[1].WorkEmail__c = '';
        insert testContactList;

        testContactList[0].Preferred_Email__c = 'Alternate Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Alternate Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        
        try {
            Test.startTest();
                update testContactList;
            Test.stopTest();
            System.assert(false, 'Always throw an error when the value corresponding to Preferred Email is Blank.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchNotNull));
        }
    }

    /************************************************************************************************************************************
    * @description Tests inserting a Contact with one custom Email field and Preferred Email which corresponds to preferred Email
    * will update Standard Email field to the value in custom Email field when Preferred Email Enforcement is enabled
    *************************************************************************************************************************************/
    @isTest 
    static void copyValueToStandardFieldOnInsertWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Preferred_Email__c = 'Work Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].Email = '';
        testContactList[1].Preferred_Email__c = 'Work Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].Email = '';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email FROM Contact];
        System.assertEquals(testContactList[0].WorkEmail__c, updatedContactList[0].Email);
        System.assertEquals(testContactList[1].WorkEmail__c, updatedContactList[1].Email);

    }

    /************************************************************************************************************************************
    * @description Tests inserting a Contact with one custom Email field and Preferred Email which corresponds to preferred Email
    * will update Standard Email field to the value in custom Email field when Preferred Email Enforcement is disabled
    *************************************************************************************************************************************/
    @isTest 
    static void copyValueToStandardFieldOnInsertWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Preferred_Email__c = 'Work Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].Email = '';
        testContactList[1].Preferred_Email__c = 'Work Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].Email = '';

        Test.startTest();
            insert testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email FROM Contact];
        System.assertEquals('test@sf.org', updatedContactList[0].Email, 'Email should be same as Work Email');
        System.assertEquals('test@sf.org', updatedContactList[1].Email, 'Email should be same as Work Email');

    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact with one custom Email field and Preferred Email which corresponds to preferred Email
    * will update Standard Email field to the value in custom Email field when Preferred Email Enforcement is enabled
    *************************************************************************************************************************************/
    @isTest 
    static void copyValueToStandardFieldOnUpdateWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].Email = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        insert testContactList;

        testContactList[0].Preferred_Email__c = 'Work Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Work Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email FROM Contact];
        System.assertEquals('test@sf.org', updatedContactList[0].Email, 'Email should be same as Work Email');
        System.assertEquals('test@sf.org', updatedContactList[1].Email, 'Email should be same as Work Email');

    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact with one custom Email field and Preferred Email which corresponds to preferred Email
    * will update Standard Email field to the value in custom Email field when Preferred Email Enforcement is disabled
    *************************************************************************************************************************************/
    @isTest 
    static void copyValueToStandardFieldOnUpdateWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = '';
        testContactList[1].Email = '';
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = '';
        insert testContactList;

        testContactList[0].Preferred_Email__c = 'Work Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Work Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        Test.startTest();
            update testContactList;
        Test.stopTest();

        List<Contact> updatedContactList = [SELECT Id, Email FROM Contact];
        System.assertEquals('test@sf.org', updatedContactList[0].Email, 'Email should be same as Work Email');
        System.assertEquals('test@sf.org', updatedContactList[1].Email, 'Email should be same as Work Email');

    }

    /************************************************************************************************************************************
    * @description Tests inserting a Contact with one custom Email field and Preferred Email which doesn't corresponds to any of the
    * custom email fields will throw PreferredEmailMatchMustExist error when Preferred Email Enforcement is Enabled
    *************************************************************************************************************************************/
    @isTest 
    static void fieldNotFoundOnInsertWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Preferred_Email__c = 'Test sf Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Test sf Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        try {
        Test.startTest();
            insert testContactList;
        Test.stopTest();
        System.assert(false, 'Always throw an error when the field corresponding to Preferred Email is not found.');
        } catch (DmlException error) {
             System.assert(error.getMessage().contains(Label.PreferredEmailMatchMustExist));
        }
    }
    
    /************************************************************************************************************************************
    * @description Tests inserting a Contact with one custom Email field and Preferred Email which doesn't corresponds to any of the
    * custom email fields will throw PreferredEmailMatchMustExist error when Preferred Email Enforcement is Disabled
    *************************************************************************************************************************************/
    @isTest 
    static void fieldNotFoundOnInsertWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Preferred_Email__c = 'Test sf Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Test sf Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        try {
        Test.startTest();
            insert testContactList;
        Test.stopTest();
        System.assert(false, 'Always throw an error when the field corresponding to Preferred Email is not found.');
        } catch (DmlException error) {
             System.assert(error.getMessage().contains(Label.PreferredEmailMatchMustExist));
        }
    }

    /************************************************************************************************************************************
    * @description Tests updating  a Contact with one custom Email field and Preferred Email which doesn't corresponds to any of the
    * custom email fields will throw PreferredEmailMatchMustExist error when Preferred Email Enforcement is Enabled
    *************************************************************************************************************************************/
    @isTest 
    static void fieldNotFoundOnUpdateWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = null; 
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = null; 
        insert testContactList;

        testContactList[0].Preferred_Email__c = 'Test sf Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Test sf Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';

        try {
            Test.startTest();
                update  testContactList[0];
            Test.stopTest();
            System.assert(false, 'Always throw an error when the field corresponding to Preferred Email is not found.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchMustExist));
        }
    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact with one custom Email field and Preferred Email which doesn't corresponds to any of the
    * custom email fields will throw PreferredEmailMatchMustExist error when Preferred Email Enforcement is Disabled
    *************************************************************************************************************************************/
    @isTest 
    static void fieldNotFoundOnUpdateWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].WorkEmail__c = '';
        testContactList[0].Preferred_Email__c = null; 
        testContactList[1].WorkEmail__c = '';
        testContactList[1].Preferred_Email__c = null; 
        insert testContactList;

        testContactList[0].Preferred_Email__c = 'Test sf Email';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = 'Test sf Email';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        
        try {
            Test.startTest();
                update  testContactList[0];
            Test.stopTest();
            System.assert(false, 'Always throw an error when the field corresponding to Preferred Email is not found.');
        } catch (DmlException error) {
            System.assert(error.getMessage().contains(Label.PreferredEmailMatchMustExist));
        }
    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with the value of standard Email field not matching with any of the values in
    * custom email fields will update Preferred Email to the label preferredBatchDefaultEmail when Preferred Email Enforcement is enabled
    *************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailToEmailStandardBatch() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = 'TestingEmail@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = 'TestingEmail@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);  
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c FROM Contact];

        System.assertEquals(Label.preferredBatchDefaultEmail, contactAfterBatchUpdateList[0].Preferred_Email__c, 'Email should be populated with default email');
        System.assertEquals(Label.preferredBatchDefaultEmail, contactAfterBatchUpdateList[1].Preferred_Email__c, 'Email should be populated with default email');

    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with the value of standard Email field not matching with any of the values in
    * custom email fields will not update Preferred Email when Preferred Email Enforcement is disabled
    *************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailToEmailStandardBatchNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = 'TestingEmail@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = 'TestingEmail@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c FROM Contact];

        System.assertEquals(null, contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should be null');

    }
    
    /************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with the value of standard Email field matching with any of the values in
    * custom email fields will update Preferred Email to the first available custom email field's label when Preferred Email Enforcement is enabled
    *************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailToFirstMatchingEmailFieldBatch() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = 'test@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].UniversityEmail__c = 'testUniv@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = 'test@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].UniversityEmail__c = 'testUniv@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);  
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c FROM Contact];

        System.assertEquals('Work Email', contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should be Work Email');
        System.assertEquals('Work Email', contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should be Work Email');

    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with the value of standard Email field matching with any of the values in
    * custom email fields will not update Preferred Email when Preferred Email Enforcement is disabled
    *************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailToFirstMatchingEmailFieldBatchNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = 'test@sf.org';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].UniversityEmail__c = 'testUniv@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = 'test@sf.org';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].UniversityEmail__c = 'testUniv@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c FROM Contact];

        System.assertEquals(null, contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should be null');

    }
    
    /************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with only one custom email field will update Preferred Email to the label 
    * corresponding to the custom email field with value when Standard Email field is blank and Preferred Email Enforcement is enabled
    *************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailSmartSetBatch() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = '';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        List<Contact> contactAfterInsertList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, contactAfterInsertList[0].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsertList[0].Email);
        System.assertEquals(null, contactAfterInsertList[1].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsertList[1].Email);

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);  
        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals('Work Email', contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should work email');
        System.assertEquals('test@sf.org', contactAfterBatchUpdateList[0].Email, 'Standard Email should be same as work email');
        System.assertEquals('Work Email', contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should work email');
        System.assertEquals('test@sf.org', contactAfterBatchUpdateList[1].Email, 'Standard Email should be same as work email');

    }

    /************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with only one custom email field will not update Preferred Email and 
    * standard email fields Preferred Email Enforcement is disbaled
    *************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailSmartSetBatchNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = '';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        List<Contact> contactAfterInsert = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, contactAfterInsert[0].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsert[0].Email);
        System.assertEquals(null, contactAfterInsert[1].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsert[1].Email);

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[0].Email, 'Standard Email is null');
        System.assertEquals(null, contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[1].Email, 'Standard Email is null');

    }

    /***************************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with more than one custom email field will update Preferred Email to the label 
    * corresponding to the first available custom email field with value when Standard Email field is blank and Preferred Email Enforcement is enabled
    **************************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailWhenMulitpleEmailsBatch() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);

        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].UniversityEmail__c = 'test@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = '';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].UniversityEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        List<Contact> contactAfterInsertList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, contactAfterInsertList[0].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsertList[0].Email);
        System.assertEquals(null, contactAfterInsertList[1].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsertList[1].Email);

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);  
        CON_Email_BATCH batch = new CON_Email_BATCH(null);

        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertNotEquals(null, contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals('test@sf.org', contactAfterBatchUpdateList[0].Email, 'Standard Email should be same as work email');
        System.assertNotEquals(null, contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals('test@sf.org', contactAfterBatchUpdateList[1].Email, 'Standard Email should be same as work email');

    }
    
    /***************************************************************************************************************************************************
    * @description Tests updating a Contact in Batch context with more than one custom email field will not update Preferred Email 
    * and Standard Email fields when Preferred Email Enforcement is disabled
    **************************************************************************************************************************************************/
    @isTest 
    static void updatePreferredEmailWhenMulitpleEmailsBatchNegativeTest() {
        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);
        List<Contact> testContactList = UTIL_UnitTestData_TEST.getMultipleTestContacts(2);
        testContactList[0].Email = '';
        testContactList[0].WorkEmail__c = 'test@sf.org';
        testContactList[0].UniversityEmail__c = 'test@sf.org';
        testContactList[0].Preferred_Email__c = null;
        testContactList[1].Email = '';
        testContactList[1].WorkEmail__c = 'test@sf.org';
        testContactList[1].UniversityEmail__c = 'test@sf.org';
        testContactList[1].Preferred_Email__c = null;
        insert testContactList;

        List<Contact> contactAfterInsertList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, contactAfterInsertList[0].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsertList[0].Email);
        System.assertEquals(null, contactAfterInsertList[1].Preferred_Email__c);
        System.assertEquals(null, contactAfterInsertList[1].Email);


         UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        CON_Email_BATCH batch = new CON_Email_BATCH(null);
        Test.startTest();
            Database.executeBatch(batch);
        Test.stopTest();

        List<Contact> contactAfterBatchUpdateList = [SELECT Id, Preferred_Email__c, Email FROM Contact];

        System.assertEquals(null, contactAfterBatchUpdateList[0].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[0].Email, 'Standard Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[1].Preferred_Email__c, 'Preferred Email should be null');
        System.assertEquals(null, contactAfterBatchUpdateList[1].Email, 'Standard Email should be null');

    }

    /**************************************************************************************************************************
    ******************************************* BULK FUNCTIONAL TESTS *********************************************************
    **************************************************************************************************************************/

    /*****************************************************************************************************************************
    * @description Bulk test for Preferred Email in Insert context when Preferred Email Enforcement is enabled 
    *****************************************************************************************************************************/
    @isTest 
    static void bulkTestToCoverAllPreferredEmailBeforeInsertScenariosWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        Contact testContact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact1.Email = '';
        testContact1.Preferred_Email__c = 'Alternate Email';

        Contact testContact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact2.Email = 'test@sf.org';

        Contact testContact3 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact3.Email = '';
        testContact3.AlternateEmail__c = 'test@sf.org';

        Contact testContact4 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact4.Email = '';
        testContact4.AlternateEmail__c = 'test@sf.org';
        testContact4.WorkEmail__c = 'test@sf.org';

        Contact testContact5 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact5.Email = '';
        testContact5.Preferred_Email__c = 'Alternate Email';
        testContact5.WorkEmail__c = 'test@sf.org';

        Contact testContact6 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact6.Preferred_Email__c = 'Alternate Email';
        testContact6.AlternateEmail__c = 'test@sf.org';
        testContact6.Email = '';

        Contact testContact7 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact7.Preferred_Email__c = 'Test sf Email';
        testContact7.WorkEmail__c = 'test@sf.org';

        Contact testContact8 = testContact6.clone(false);
        Contact testContact9 = testContact2.clone(false);

        List<Contact> contactsToBeInserted = new List<Contact> {
            testContact1, testContact2, testContact3, testContact4, testContact5, testContact6, testContact7, testContact8, testContact9
                };
    
        List<Database.saveResult> results = Database.insert(contactsToBeInserted, false);

        System.assertEquals(true, results[1].success);
        System.assertEquals(true, results[2].success);
        System.assertEquals(true, results[5].success);
        System.assertEquals(true, results[7].success);
        System.assertEquals(true, results[8].success);
        System.assertEquals(Label.PreferredEmailMatchNotNull, results[0].errors[0].message);
        System.assertEquals(Label.PreferredEmailRequiredError, results[3].errors[0].message);
        System.assertEquals(Label.PreferredEmailMatchNotNull, results[4].errors[0].message);
        System.assertEquals(Label.PreferredEmailMatchMustExist, results[6].errors[0].message);

        for (Contact contact : [SELECT Id, Preferred_Email__c, Email, AlternateEmail__c FROM Contact WHERE 
                                Id =: results[1].getId() OR 
                                Id =: results[2].getId() OR
                                Id =: results[5].getId()]) {
                                    
           System.assertEquals(contact.AlternateEmail__c, contact.Email);
           System.assertEquals('Alternate Email', contact.Preferred_Email__c);
        }

    }   

    /*****************************************************************************************************************************
    * @description Bulk test for Preferred Email in Insert context when Preferred Email Enforcement is disabled 
    *****************************************************************************************************************************/
    @isTest 
    static void bulkTestToCoverAllPreferredEmailBeforeInsertScenariosWithEnforcementDisbaled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        Contact testContact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact1.Email = '';
        testContact1.Preferred_Email__c = 'Alternate Email';

        Contact testContact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact2.Email = 'test@sf.org';

        Contact testContact3 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact3.Email = '';
        testContact3.AlternateEmail__c = 'test@sf.org';

        Contact testContact4 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact4.Email = '';
        testContact4.AlternateEmail__c = 'test@sf.org';
        testContact4.WorkEmail__c = 'test@sf.org';

        Contact testContact5 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact5.Email = '';
        testContact5.Preferred_Email__c = 'Alternate Email';
        testContact5.WorkEmail__c = 'test@sf.org';

        Contact testContact6 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact6.Preferred_Email__c = 'Alternate Email';
        testContact6.AlternateEmail__c = 'test@sf.org';
        testContact6.Email = '';

        Contact testContact7 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact7.Preferred_Email__c = 'Test sf Email';
        testContact7.WorkEmail__c = 'test@sf.org';

        List<Contact> contactsToBeInserted = new List<Contact> {
            testContact1, testContact2, testContact3, testContact4, testContact5, testContact6, testContact7
                };
       
        List<Database.saveResult> results = Database.insert(contactsToBeInserted, false);

        for (Database.saveResult eachResult: results) {
            if (eachResult != results[0] && eachResult != results[4] && eachResult != results[6]) {
                System.assertEquals(true, eachResult.success);   
            } else if (eachResult == results[0] || eachResult == results[4]) {
                System.assertEquals(Label.PreferredEmailMatchNotNull, results[0].errors[0].message);
                System.assertEquals(Label.PreferredEmailMatchNotNull, results[4].errors[0].message);
            } else {
                System.assertEquals(Label.PreferredEmailMatchMustExist, results[6].errors[0].message);
            }
        }
    }

    /*****************************************************************************************************************************
    * @description Bulk test for Preferred Email in Update context when Preferred Email Enforcement is enabled 
    *****************************************************************************************************************************/
    @isTest 
    static void bulkTestToCoverAllPreferredEmailBeforeUpdateScenariosWithEnforcementEnabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        Contact testContact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact1.Email = '';

        Contact testContact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact2.Email = '';

        Contact testContact3 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact3.Email = '';

        Contact testContact4 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact4.Email = '';

        Contact testContact5 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact5.Email = '';

        Contact testContact6 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact6.Email = '';

        Contact testContact7 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact7.Email = '';

        Contact testContact8 = testContact6.clone(false);
        Contact testContact9 = testContact2.clone(false);

        List<Contact> contactsToBeInserted = new List<Contact> {
            testContact1, testContact2, testContact3, testContact4, testContact5, testContact6, testContact7, testContact8, testContact9
                };

        insert contactsToBeInserted;

        List<Contact> insertedContactList = [SELECT Id FROM Contact];
        System.assertEquals(9, insertedContactList.size());

        testContact1.Preferred_Email__c = 'Alternate Email';
        testContact2.Email = 'test@sf.org';
        testContact3.AlternateEmail__c = 'test@sf.org';
        testContact4.AlternateEmail__c = 'test@sf.org';
        testContact4.WorkEmail__c = 'test@sf.org';
        testContact5.Preferred_Email__c = 'Alternate Email';
        testContact5.WorkEmail__c = 'test@sf.org';
        testContact6.Preferred_Email__c = 'Alternate Email';
        testContact6.AlternateEmail__c = 'test@sf.org';
        testContact7.Preferred_Email__c = 'Test sf Email';
        testContact7.WorkEmail__c = 'test@sf.org';
        testContact8.Preferred_Email__c = 'Alternate Email';
        testContact8.AlternateEmail__c = 'test@sf.org';
        testContact9.Email = 'test@sf.org';

        List<Contact> contactsToBeUpdated = new List<Contact> {
            testContact1, testContact2, testContact3, testContact4, testContact5, testContact6, testContact7, testContact8, testContact9
                };

        List<Database.saveResult> results = Database.update(contactsToBeUpdated, false);

        System.assertEquals(true, results[1].success);
        System.assertEquals(true, results[2].success);
        System.assertEquals(true, results[5].success);
        System.assertEquals(true, results[7].success);
        System.assertEquals(true, results[8].success);
        System.assertEquals(Label.PreferredEmailMatchNotNull, results[0].errors[0].message);
        System.assertEquals(Label.PreferredEmailRequiredError, results[3].errors[0].message);
        System.assertEquals(Label.PreferredEmailMatchNotNull, results[4].errors[0].message);
        System.assertEquals(Label.PreferredEmailMatchMustExist, results[6].errors[0].message);

        for (Contact contact : [SELECT Id, Preferred_Email__c, Email, AlternateEmail__c FROM Contact WHERE 
                                Id =: results[1].getId() OR 
                                Id =: results[2].getId() OR
                                Id =: results[5].getId()]) {
                                    
           System.assertEquals(contact.AlternateEmail__c, contact.Email);
           System.assertEquals('Alternate Email', contact.Preferred_Email__c);
        }

    }

    /*****************************************************************************************************************************
    * @description Bulk test for Preferred Email in Update context when Preferred Email Enforcement is disabled 
    *****************************************************************************************************************************/
    @isTest 
    static void bulkTestToCoverAllPreferredEmailBeforeUpdateScenariosWithEnforcementDisabled() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = true)
        );

        Contact testContact1 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact1.Email = '';
        
        Contact testContact2 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact2.Email = '';

        Contact testContact3 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact3.Email = '';

        Contact testContact4 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact4.Email = '';

        Contact testContact5 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact5.Email = '';

        Contact testContact6 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact6.Email = '';

        Contact testContact7 = UTIL_UnitTestData_TEST.getUniqueContact(1);
        testContact7.Email = '';

        List<Contact> contactsToBeInserted = new List<Contact> {
            testContact1, testContact2, testContact3, testContact4, testContact5, testContact6, testContact7
                };

        insert contactsToBeInserted;

        List<Contact> insertedContactList = [SELECT Id FROM Contact];
        System.assertEquals(7, insertedContactList.size());

        testContact1.Preferred_Email__c = 'Alternate Email';
        testContact2.Email = 'test@sf.org';
        testContact3.AlternateEmail__c = 'test@sf.org';
        testContact4.AlternateEmail__c = 'test@sf.org';
        testContact4.WorkEmail__c = 'test@sf.org';
        testContact5.Preferred_Email__c = 'Alternate Email';
        testContact5.WorkEmail__c = 'test@sf.org';
        testContact6.Preferred_Email__c = 'Alternate Email';
        testContact6.AlternateEmail__c = 'test@sf.org';
        testContact7.Preferred_Email__c = 'Test sf Email';
        testContact7.WorkEmail__c = 'test@sf.org';

        List<Contact> contactsToBeUpdated = new List<Contact> {
            testContact1, testContact2, testContact3, testContact4, testContact5, testContact6, testContact7
                };

        List<Database.saveResult> results = Database.update(contactsToBeUpdated, false);

        for (Database.saveResult eachResult: results) {
            if (eachResult != results[0] && eachResult != results[4] && eachResult != results[6]) {
                System.assertEquals(true, eachResult.success);   
            } else if (eachResult == results[0] || eachResult == results[4]) {
                System.assertEquals(Label.PreferredEmailMatchNotNull, results[0].errors[0].message);
                System.assertEquals(Label.PreferredEmailMatchNotNull, results[4].errors[0].message);
            } else {
                System.assertEquals(Label.PreferredEmailMatchMustExist, results[6].errors[0].message);
            }
        }
        
    }

    /*****************************************************************************************************************************
    * @description Bulk test for Preferred Email in Batch context when Preferred Email Enforcement is enabled 
    *****************************************************************************************************************************/
    @isTest 
    static void preferredEMailBatchBulkTest() {

        UTIL_CustomSettingsFacade.getSettingsForTests(
            new Hierarchy_Settings__c(Disable_Preferred_Email_Enforcement__c = false)
        );

        // Get contacts set up
        List<Contact> contactList = UTIL_UnitTestData_API.getMultipleTestContacts(10);
        for (Integer i = 0; i < 10; i++) {

            contactList[i].LastName = 'ToAvoidDupeRule' + i;//Avoid duplicate matching
            contactList[i].WorkEmail__c = ''; // clear email field set in getMultipleTestContacts
            contactList[i].Preferred_Email__c = ''; // clear preferred field set in getMultipleTestContacts
            System.assert(contactList[i].email == null);
        }

        insert contactList;

        List<String> contIds = new List<String>();

        List<Contact> contacts = [SELECT Id, Name, Preferred_Email__c, Email, AlternateEmail__c,UniversityEmail__c, WorkEmail__c FROM Contact];

        String caseOneId;
        String caseTwoId;

        // Process the contact for testing
        if(contacts.size() > 0) {

            for (Integer i = 0; i < contacts.size(); i++) {

                // Setup special Case 1
                if(i==5) {
                    contacts[5].Email = 'uniquwemailtest5nomatch@domainemail.com';
                    contacts[5].AlternateEmail__c = 'alternate5@domainemail.com';
                    contacts[5].UniversityEmail__c = null;
                    contacts[5].WorkEmail__c = null;
                    contacts[5].Preferred_Email__c = '';
                    caseOneId = contacts[5].Id;

                // Setup special Case 2
                } else if (i==6) {
                    contacts[6].AlternateEmail__c = 'alternate6@domainemail.com';
                    contacts[6].Email = '';
                    contacts[6].WorkEmail__c = null;
                    contacts[6].Preferred_Email__c = '';
                    caseTwoId = contacts[6].Id;

                } else {
                    contacts[i].Email = 'emailtest' + i + '@domainemail.com';
                    contacts[i].UniversityEmail__c = null;
                    contacts[i].WorkEmail__c = null;
                    contacts[i].AlternateEmail__c = null;
                    contacts[i].Preferred_Email__c = null;
                    contIds.add(contacts[i].Id);
                }
            }

            TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, true);
            update contacts;
        }

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_Preferred_TDTM, false);
        // Run Batch
        Test.startTest();
            CON_Email_BATCH contbatch = new CON_Email_BATCH(null);
        Database.executeBatch( contbatch );
        Test.stopTest();

        // After batch run assert leaving off the two contacts for special cases
        contacts = [SELECT Id, Name, Email, AlternateEmail__c FROM Contact WHERE Id in: contIds AND Id!=:caseOneId AND Id !=: caseTwoId];
        for(Contact contact : contacts) {
            System.assertEquals(contact.AlternateEmail__c , contact.Email );
        }

        // Check special Case 1
        Contact contactOne = [SELECT Id, Name, Email, AlternateEmail__c, Preferred_Email__c FROM Contact WHERE Id =:caseOneId LIMIT 1];
        System.assertEquals('uniquwemailtest5nomatch@domainemail.com', contactOne.Email);
        System.assertEquals(Label.preferredBatchDefaultEmail, contactOne.Preferred_Email__c);

        // Check special Case 2
        Contact contactTwo = [SELECT Id, Name, Email, AlternateEmail__c, Preferred_Email__c FROM Contact WHERE Id =:caseTwoId LIMIT 1];
        System.assertEquals(contactTwo.Email, contactTwo.AlternateEmail__c);
        System.assertEquals('Alternate Email', contactTwo.Preferred_Email__c);

    }

    /**************************************************************************************************************************
    ******************************************* LEAD CONVERSION TEST *********************************************************
    **************************************************************************************************************************/
    @isTest 
    static void testLeadConversion() {
        // create a Lead
        Lead testLead = new Lead(
            FirstName='Joshua',
            LastName='McTesterman',
            Email='mctesterman@mctesersite.com',
            Company='Test',
            Status='Inquiry'
        );

        insert testLead;

        Database.LeadConvert convertedLead = new Database.LeadConvert();
        convertedLead.setLeadId(testLead.Id);

        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        convertedLead.setConvertedStatus(convertStatus.MasterLabel);

        Test.startTest();		
            Database.LeadConvertResult convertedLeadResult = Database.convertLead(convertedLead);
        Test.stopTest();

        Contact contact = [SELECT Id, Name, Email FROM Contact WHERE Id =:convertedLeadResult.getContactId() LIMIT 1];

        System.assertEquals(contact.Email, testLead.Email);
    }
}
/*
    Copyright (c) 2015, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
 * @author Salesforce.org
 * @date 2015
 * @group Contacts
 * @group-content ../../ApexDocContent/Contacts.htm
 * @description Test for Contact primary affilation fields functionality.
 */
@isTest
private with sharing class CON_PrimaryAffls_TEST {
    private static Integer contactCount = 100; // used to determine number of test contact records to create

    /**************************************************************************************************************************
     ****************************************************** UNIT TESTS *********************************************************
     **************************************************************************************************************************/

    /********************************************************
     * @description Tests setAffiliationUpdateRecursion method
     *********************************************************/
    @isTest
    static void setAffiliationUpdateRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.setAffiliationUpdateRecursion();
        Test.stopTest();

        Boolean keyLookupUpdated = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_keyAfflLookupUpdated
        );

        System.assertEquals(true, keyLookupUpdated, 'keyLookupUpdated should be active for CON_PrimaryAffls_TDTM');
    }

    /******************************************************
     * @description Tests setInsertRecursion method
     *******************************************************/
    @isTest
    static void setInsertRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.setInsertRecursion();
        Test.stopTest();

        Boolean afterInsert = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Insert
        );

        System.assertEquals(true, afterInsert, 'afterInsert should be active for CON_PrimaryAffls_TDTM');
    }

    /*******************************************************
     * @description Tests setUpdateRecursion method
     ********************************************************/
    @isTest
    static void setUpdateRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.setUpdateRecursion();
        Test.stopTest();

        Boolean afterUpdate = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Update
        );

        System.assertEquals(true, afterUpdate, 'afterUpdate should be active for CON_PrimaryAffls_TDTM');
    }

    /*******************************************************
     * @description Tests unsetInsertRecursion method
     ********************************************************/
    @isTest
    static void unsetInsertRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setInsertRecursion();

        Test.startTest();
        tdtmClass.unsetInsertRecursion();
        Test.stopTest();

        Boolean isInsertRecursion = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Insert
        );

        System.assertEquals(
            false,
            isInsertRecursion,
            'Insert recursion should not be active for CON_PrimaryAffls_TDTM'
        );
    }

    /*******************************************************
     * @description Tests unsetInsert recursion method
     *******************************************************/
    @isTest
    static void unsetUpdateRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setUpdateRecursion();

        Test.startTest();
        tdtmClass.unsetUpdateRecursion();
        Test.stopTest();

        Boolean isUpdateRecursion = TDTM_ProcessControl.getRecursionFlag(
            TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Insert
        );

        System.assertEquals(
            false,
            isUpdateRecursion,
            'Update recursion should not be active for CON_PrimaryAffls_TDTM'
        );
    }

    /*******************************************************
     * @description Tests isInsertRecursion method
     *******************************************************/
    @isTest
    static void isInsertRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setInsertRecursion();

        Test.startTest();
        Boolean isInsertRecursion = tdtmClass.isInsertRecursion();
        Test.stopTest();

        System.assertEquals(true, isInsertRecursion, 'Insert recursion should not be active for CON_PrimaryAffls_TDTM');
    }

    /*******************************************************
     * @description Tests IsUpdateRecursion method for
     * CON_PrimaryAffls_TDTM_After_Update flag
     *******************************************************/
    @isTest
    static void isupdateRecursionForAfterUpdate() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setUpdateRecursion();

        Test.startTest();
        Boolean isUpdateRecursion = tdtmClass.isUpdateRecursion();
        Test.stopTest();

        System.assertEquals(true, isUpdateRecursion, 'Update recursion should not be active for CON_PrimaryAffls_TDTM');
    }

    /*******************************************************
     * @description Tests IsUpdateRecursion method for
     * AFFL_AccRecordType_TDTM flag
     *******************************************************/
    @isTest
    static void isupdateRecursionForAfflAccRecType() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.AFFL_AccRecordType_TDTM, true);

        Test.startTest();
        Boolean isUpdateRecursion = tdtmClass.isUpdateRecursion();
        Test.stopTest();

        System.assertEquals(true, isUpdateRecursion, 'Update recursion should not be active for CON_PrimaryAffls_TDTM');
    }

    /*******************************************************
     * @description Tests isAffiliationUpdateRecursion method
     *******************************************************/
    @isTest
    static void isAffiliationUpdateRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setUpdateRecursion();

        Test.startTest();
        Boolean isAffiliationUpdateRecursion = tdtmClass.isAffiliationUpdateRecursion();
        Test.stopTest();

        System.assertEquals(
            true,
            isAffiliationUpdateRecursion,
            'Update recursion should not be active for CON_PrimaryAffls_TDTM'
        );
    }

    /*******************************************************
     * @description Tests resetAffiliationUpdateRecursion will
     * reset CON_PrimaryAffls_TDTM_keyAfflLookupUpdated flag
     *******************************************************/
    @isTest
    static void resetAffiliationUpdateRecursion() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setAffiliationUpdateRecursion();

        System.assertEquals(
            true,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_keyAfflLookupUpdated
            ),
            'update recurssion should be true'
        );

        Test.startTest();
        tdtmClass.resetAffiliationUpdateRecursion();
        Test.stopTest();

        System.assertEquals(
            false,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_keyAfflLookupUpdated
            ),
            'Update recursion should be reset'
        );
    }

    /*************************************************************************************************************
     * @description Tests locateAffiliationSettingMapper method of CON_PrimaryAffls_TDTM
     *************************************************************************************************************/
    @isTest
    private static void locateAffiliationSettingMapperTest() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        Test.startTest();
        MAPR_PrimaryAffiliations primaryAfflInstance = tdtmClass.locateAffiliationSettingMapper();
        Test.stopTest();

        MAPR_PrimaryAffiliations maprInstance = MAPR_PrimaryAffiliations.getInstance();

        System.assertEquals(maprInstance, primaryAfflInstance);
    }

    /*************************************************************************************************************
     * @description Tests locateContactAffiliationService method of CON_PrimaryAffls_TDTM
     **************************************************************************************************************/
    @isTest
    private static void locateContactAffiliationService() {
        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        Test.startTest();
        SRVC_Contact_PrimaryAffiliations primaryAfflInstance = tdtmClass.locateContactAffiliationService();
        Test.stopTest();

        SRVC_Contact_PrimaryAffiliations srvcInstance = SRVC_Contact_PrimaryAffiliations.getInstance();

        System.assertEquals(srvcInstance, primaryAfflInstance);
    }

    /*************************************************************************************************************
     * @description NULL test for run method to verify new DmlWrapper(); is returned when newList is null
     *************************************************************************************************************/
    @isTest
    private static void runMethodNULLTest() {
        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.AfterUpdate;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        Test.startTest();
        TDTM_Runnable.DmlWrapper dmlWrapperReturned = tdtmClass.run(null, null, testAction, objResult);
        Test.stopTest();

        System.assertEquals(0, dmlWrapperReturned.objectsToInsert.size());
    }

    /*************************************************************************************************************
     * @description Test for run method to verify new DmlWrapper(); is returned when newList is empty
     *************************************************************************************************************/
    @isTest
    private static void runMethodEmptyTest() {
        List<Contact> newContactsList = new List<Contact>();
        List<SObject> oldContactList = new List<SObject>();

        TDTM_Runnable.Action testAction = TDTM_Runnable.Action.AfterUpdate;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        Test.startTest();
        TDTM_Runnable.DmlWrapper dmlWrapperReturned = tdtmClass.run(
            newContactsList,
            oldContactList,
            testAction,
            objResult
        );
        Test.stopTest();

        System.assertEquals(0, dmlWrapperReturned.objectsToInsert.size());
    }

    /*************************************************************************************************************
     * @description Positive test method for run method afterInsert to ensure affiliations are created on insert
     *************************************************************************************************************/
    @isTest
    static void runMethodTestForAfterInsert() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> newContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccount1.Id;
            newContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert newContactList;

        List<Affiliation__c> affiliationAfterInsertList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(5, affiliationAfterInsertList.size());

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        TDTM_Runnable.DmlWrapper dmlWrapper = tdtmClass.run(
            (List<SObject>) newContactList,
            null,
            TDTM_Runnable.Action.AfterInsert,
            contactDescribeResult
        );
        Test.stopTest();

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(10, affiliationList.size(), '5 more affiliation records should be inserted');
    }

    /*************************************************************************************************************
     * @description Positive test method for run method afterUpdate to ensure affiliations are created
     * when contact is updated with Primary Field
     **************************************************************************************************************/
    @isTest
    static void runMethodTestForAfterUpdate() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert oldContactList;

        List<Contact> newContactList = new List<Contact>();
        for (Contact eachContact : oldContactList) {
            Contact newContact = eachContact.Clone(false);
            newContact.Id = eachContact.Id;
            newContact.Primary_organization__c = businessAccount1.Id;
            newContactList.add(newContact);
        }

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        TDTM_Runnable.DmlWrapper dmlWrapper = tdtmClass.run(
            (List<SObject>) newContactList,
            (List<SObject>) oldContactList,
            TDTM_Runnable.Action.Afterupdate,
            contactDescribeResult
        );
        Test.stopTest();

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(5, affiliationList.size());
    }

    /*************************************************************************************************************
     * @description Positive test method for handleAfterInsertMethod to ensure affiliations are inserted when
     * Primary field is populated
     *************************************************************************************************************/
    @isTest
    static void handleAfterInsertWithPrimaryBusinessOrg() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_organization__c = businessAccounts[0].Id;
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert oldContactList;

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(5, affiliationList.size());

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.handleAfterInsert(oldContactList);
        Test.stopTest();

        List<Affiliation__c> affiliationAfterCallList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(10, affiliationAfterCallList.size());
        System.assertEquals(
            false,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Insert
            ),
            'Recursion flag should be unset.'
        );
    }

    /*************************************************************************************************************
     * @description Negative test method for run method afterUpdate to ensure no affiliatons are inserted when
     * Primary field is not populated
     **************************************************************************************************************/
    @isTest
    static void handleAfterInsertWithNoPrimaryField() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert oldContactList;

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(0, affiliationList.size());

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.handleAfterInsert(oldContactList);
        Test.stopTest();

        List<Affiliation__c> affiliationAfterCallList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(0, affiliationAfterCallList.size());
        System.assertEquals(
            false,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Insert
            ),
            'Recursion flag should be unset.'
        );
    }

    /*************************************************************************************************************
     * @description Test method for run method afterUpdate doesn't create affiliations when flag is on
     **************************************************************************************************************/
    @isTest
    static void handleAfterInsertWithFlagOn() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccounts[0].Id;
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setInsertRecursion();

        Test.startTest();
        tdtmClass.handleAfterInsert(oldContactList);
        Test.stopTest();

        List<Affiliation__c> affiliationAfterCallList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(0, affiliationAfterCallList.size());
    }

    /*************************************************************************************************************
     * @description Positive test method for run method after Update to ensure affiliations are not created when
     * flag is on
     **************************************************************************************************************/
    @isTest
    static void handleAfterUpdateWithFlagOn() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        List<Contact> newContactsList = new List<Contact>();
        for (Contact oldContact : oldContactList) {
            Contact newContact = oldContact.Clone(false);
            newContact.Id = oldContact.Id;
            newContact.Primary_Organization__c = businessAccounts[0].Id;
            newContactsList.add(newContact);
        }

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();
        tdtmClass.setUpdateRecursion();

        Test.startTest();
        tdtmClass.handleAfterUpdate(oldContactList, newContactsList);
        Test.stopTest();

        List<Affiliation__c> affiliationAfterCallList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(0, affiliationAfterCallList.size());
    }

    /*************************************************************************************************************
     * @description Positive test method for run method afterUpdate to ensure affiliations are created when
     * Contacts are updated with Primary field
     **************************************************************************************************************/
    @isTest
    static void handleAfterUpdateInsertOnly() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert oldContactList;

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(0, affiliationList.size());

        List<Contact> newContactsList = new List<Contact>();
        for (Contact oldContact : oldContactList) {
            Contact newContact = oldContact.Clone(false);
            newContact.Id = oldContact.Id;
            newContact.Primary_Organization__c = businessAccounts[0].Id;
            newContactsList.add(newContact);
        }

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.handleAfterUpdate(oldContactList, newContactsList);
        Test.stopTest();

        List<Affiliation__c> affiliationAfterCallList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(5, affiliationAfterCallList.size());

        System.assertEquals(
            false,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Update
            ),
            'Recursion flag should be unset.'
        );
    }

    /*************************************************************************************************************
     * @description Positive test method for run method afterUpdate to ensure affiliations are updated when
     * Contacts are cleared with Primary fields
     **************************************************************************************************************/
    @isTest
    static void handleAfterUpdateUpdatesOnly() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccounts[0].Id;
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert oldContactList;

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c WHERE Primary__c = TRUE];

        System.assertEquals(5, affiliationList.size());

        List<Contact> newContactsList = new List<Contact>();
        for (Contact oldContact : oldContactList) {
            Contact newContact = oldContact.Clone(false);
            newContact.Id = oldContact.Id;
            newContact.Primary_Organization__c = null;
            newContactsList.add(newContact);
        }

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.handleAfterUpdate(oldContactList, newContactsList);
        Test.stopTest();

        List<Affiliation__c> affiliationAfterCallList = [SELECT Id, Primary__c FROM Affiliation__c];

        System.assertEquals(5, affiliationAfterCallList.size());

        for (Affiliation__c each : affiliationAfterCallList) {
            System.assertEquals(false, each.Primary__c);
        }

        System.assertEquals(
            false,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Update
            ),
            'Recursion flag should be unset.'
        );
    }

    /*************************************************************************************************************
     * @description Positive test method for run method afterUpdate to test inserts and updates of affiliations
     **************************************************************************************************************/
    @isTest
    static void handleAfterUpdateInsertAndUpdates() {
        String namespace = UTIL_Namespace.getNamespace();
        String prefix = (String.isNotBlank(namespace)) ? namespace + '__' : '';

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = prefix + 'Primary_Organization__c'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = prefix + 'Primary_Household__c'
            )
        );
        insert mappings;

        List<Account> businessAccounts = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccounts;

        Schema.DescribeSObjectResult contactDescribeResult = UTIL_Describe.getObjectDescribe('Contact');

        List<Contact> oldContactList = new List<Contact>();

        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccounts[0].Id;
            oldContactList.add(contactWithPrimaryBusinessOrg);
        }

        insert oldContactList;

        List<Affiliation__c> affiliationList = [SELECT Id FROM Affiliation__c WHERE Primary__c = TRUE];

        System.assertEquals(5, affiliationList.size());

        List<Contact> newContactsList = new List<Contact>();
        for (Contact oldContact : oldContactList) {
            Contact newContact = oldContact.Clone(false);
            newContact.Id = oldContact.Id;
            newContact.Primary_Organization__c = businessAccounts[1].Id;
            newContactsList.add(newContact);
        }

        CON_PrimaryAffls_TDTM tdtmClass = new CON_PrimaryAffls_TDTM();

        Test.startTest();
        tdtmClass.handleAfterUpdate(oldContactList, newContactsList);
        Test.stopTest();

        List<Contact> contactList = [
            SELECT Id, (SELECT Id, Contact__c, Account__c, Primary__c FROM Affl_Accounts__r)
            FROM Contact
        ];
        System.assertEquals(5, contactList.size());
        for (Contact eachContact : contactList) {
            System.assertEquals(2, eachContact.Affl_Accounts__r.size());
            for (Affiliation__c affiliation : eachContact.Affl_Accounts__r) {
                if (affiliation.Account__c == businessAccounts[1].Id) {
                    System.assertEquals(true, affiliation.Primary__c);
                }
                System.assertEquals(eachContact.Id, affiliation.Contact__c);
            }
        }

        System.assertEquals(
            false,
            TDTM_ProcessControl.getRecursionFlag(
                TDTM_ProcessControl.registeredTrigger.CON_PrimaryAffls_TDTM_After_Update
            ),
            'Recursion flag should be unset.'
        );
    }

    /**************************************************************************************************************************
     ****************************************************** FUNCTIONAL TESTS ***************************************************
     **************************************************************************************************************************/

    /**************************************************************************************************************************************
     * @description Helper method to generate error message associated with a mapping to a field that does not lookup to Account.
     * @param  affiliationMapping An affiliation mapping with an invalid lookup field mapping.
     * @return The expected error message associated with the generated model.
     **************************************************************************************************************************************/
    private static String getExpectedInvalidFieldMappingErrorMessage(Affl_Mappings__c affiliationMapping) {
        List<String> params = new List<String>{
            Label.stgColContactPrimaryAfflField,
            affiliationMapping.Primary_Affl_Field__c
        };

        return StringHandlingService.getInstance()
            .formatStringWithApostrophesAndParameters(label.invalidContactFieldInAffiliationMapping, params);
    }

    /**************************************************************************************************************************************
     * @description Helper method to generate error message associated with a mapping to an invalid record type.
     * @param  affiliationMapping An affiliation mapping with an invalid record type mapping.
     * @return The expected error message associated with the generated model.
     **************************************************************************************************************************************/
    private static String getExpectedInvalidRTMappingErrorMessage(Affl_Mappings__c affiliationMapping) {
        List<String> params = new List<String>{
            Label.stgColAccountRecordType,
            affiliationMapping.Account_Record_Type__c
        };

        return StringHandlingService.getInstance()
            .formatStringWithApostrophesAndParameters(Label.invalidRecordTypeInAffiliationMapping, params);
    }

    /*************************************************************************************************************
     * @description Test case to verify that inserting a contact with a primary affiliation field populated with record type
     * validation enabled, a valid Contact field mapping and invalid Record Type mapping throws an error.
     **************************************************************************************************************/
    @isTest
    private static void insertContactAfflInvalidRecordTypeError() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        for (Contact con : testContactsList) {
            con.Primary_Organization__c = businessAccount1.Id;
        }

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                CON_PrimaryAffls_TEST.getExpectedInvalidRTMappingErrorMessage(mappings[0]),
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that inserting a Contact with a primary affiliation field populated with record type
     * validation enabled, a valid Contact field mapping that is not a lookup to Account and valid Record Type mapping throws an error.
     **************************************************************************************************************/
    @isTest
    private static void insertContactAfflInvalidFieldMappingError() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        for (Contact con : testContactsList) {
            con.Gender__c = 'Decline to State';
        }

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Gender__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidFieldMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that inserting a Contact with a primary affiliation field populated with record type
     * validation enabled, a valid Contact field mapping to a non-lookup field and invalid Record Type mapping throws
     * an error when the mapped field is populated.
     **************************************************************************************************************/
    @isTest
    private static void insertContactAfflInvalidRTAndInvalidFieldMappingFieldPopulatedInvalidRecordTypeError() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = 'FirstName'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidRTMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Ensure affiliations are created on Contact insert.
     **************************************************************************************************************/
    @isTest
    private static void insertContactPrimaryAfflWAccRecTypeUnenforced_English() {
        Test.startTest();
        createAffiliationsOnBulkContactInsert();
        Test.stopTest();
    }

    /*************************************************************************************************************
     * @description For a spanish user, ensure affiliations are created on Contact insert.
     * Test Scenario: T-3939029
     **************************************************************************************************************/
    @isTest
    private static void insertContactPrimaryAfflWAccRecTypeUnenforced_Spanish() {
        Profile systemAdministratorProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

        System.runAs(UTIL_UnitTestData_TEST.createNewUserForTests(
            System.now().getTime() + '@testerson.com',
            systemAdministratorProfile.Id,
            'es'
        )) {
            Test.startTest();
            createAffiliationsOnBulkContactInsert();
            Test.stopTest();
        }
    }

    /*************************************************************************************************************
     * @description Test case to for a spanish user, verify that updating a primary affiliation field on Contact
     * with record type validation disabled, a valid Contact field mapping to a lookup field and invalid Record
     * Type mapping does not throw an error when the mapped field is not populated.
     * Test Scenario: T-3939030
     **************************************************************************************************************/
    @isTest
    private static void updateContactPrimaryAfflWAccRecTypeUnenforced_Spanish() {
        Profile systemAdministratorProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

        System.runAs(UTIL_UnitTestData_TEST.createNewUserForTests(
            System.now().getTime() + '@testerson.com',
            systemAdministratorProfile.Id,
            'es'
        )) {
            updateContactAfflInvalidRTAndValidFieldMappingFieldNotPopulatedNoValidationPositive();
        }
    }

    /*************************************************************************************************************
     * @description For a spanish user, ensure affiliations are created on Contact insert, additionally
     * ensure affiliations are updated upon contact primary affiliation reassignment.
     * Test Scenario: T-3939026
     **************************************************************************************************************/
    @isTest
    private static void updateMultipleContactPrimaryAfflWAccRecTypeUnenforced_Spanish() {
        Profile systemAdministratorProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];

        System.runAs(UTIL_UnitTestData_TEST.createNewUserForTests(
            System.now().getTime() + '@testerson.com',
            systemAdministratorProfile.Id,
            'es'
        )) {
            createAffiliationsOnBulkContactInsert();

            // insert secondary business account
            Account businessAccount2 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
                1,
                UTIL_Describe_API.getBizAccRecTypeID()
            )[0];
            insert businessAccount2;

            List<Contact> contactsList = [
                SELECT Id, Primary_Organization__c, (SELECT Account__c, Contact__c, Primary__c FROM Affl_Accounts__r)
                FROM Contact
            ];

            System.assertEquals(100, contactsList.size());
            // Reassign the primary business accounts.
            for (Contact currentContact : contactsList) {
                currentContact.Primary_Organization__c = businessAccount2.Id;
            }

            Test.startTest();
            update contactsList;
            Test.stopTest();

            //Ensure Affiliations appropriately reflect new mapping.
            Integer activeAffiliations = [SELECT COUNT() FROM Affiliation__c WHERE Primary__c = TRUE];
            Integer inactiveAffiliations = [SELECT COUNT() FROM Affiliation__c WHERE Primary__c = FALSE];

            System.assertEquals(100, activeAffiliations);
            System.assertEquals(100, inactiveAffiliations);
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that insert a Contact with primary affiliation field populated with record type
     * validation disabled, a valid Contact field mapping to a non-lookup field and invalid Record Type mapping throws
     * an error when the mapped field is populated.
     **************************************************************************************************************/
    @isTest
    private static void insertContactAfflInvalidRTAndInvalidFieldMappingFieldPopulatedInvalidValidationOffFieldError() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = 'FirstName'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidFieldMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that inserting a Contact where the mapped primary affiliation field is not
     * populated, with record type validation is disabled, a valid Contact field mapped to a non-lookup field, and an
     * invalid Record Type mapping does not throw an error and does not create an affiliation record.
     **************************************************************************************************************/
    @isTest
    private static void insertContactAfflInvalidRTAndInvalidFieldMappingFieldNotPopulatedNoError() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Gender__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact> testContactResultsList = [
            SELECT Id, Primary_Organization__c, (SELECT Id FROM Contact.Affl_Accounts__r)
            FROM Contact
            WHERE Id IN :testContactsList
        ];

        System.assertEquals(100, testContactResultsList.size(), 'Contact records should be created.');

        for (Contact contact : testContactResultsList) {
            System.assertEquals(
                true,
                String.isBlank(contact.Primary_Organization__c),
                'Primary Organization field should be blank.'
            );
            System.assertEquals(
                0,
                contact.Affl_Accounts__r.size(),
                'No related affiliation records should be created.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation disabled, a valid Contact field mapping to a non-lookup field and invalid Record Type mapping does not
     * throw an error when the mapped field is not populated.
     **************************************************************************************************************/
    @isTest
    private static void insertContactAfflInvalidRTAndInvalidFieldMappingFieldNotPopulatedPositive() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Gender__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact> testContactResultsList = [
            SELECT Id, Primary_Organization__c, (SELECT Id FROM Contact.Affl_Accounts__r)
            FROM Contact
            WHERE Id IN :testContactsList
        ];

        System.assertEquals(100, testContactResultsList.size());

        for (Contact contact : testContactResultsList) {
            System.assertEquals(
                true,
                String.isBlank(contact.Primary_Organization__c),
                'Primary Organization field should be blank.'
            );
            System.assertEquals(
                0,
                contact.Affl_Accounts__r.size(),
                'No related affiliation records should be created.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation enabled, a valid Contact field mapping and invalid Record Type mapping throws an error.
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflInvalidRecordTypeError() {
        Hierarchy_Settings__c hs = UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        insert testContactsList;

        for (Contact con : testContactsList) {
            con.Primary_Organization__c = businessAccount1.Id;
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidRTMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation enabled, a valid Contact field mapping that is not a lookup to Account and valid Record Type mapping throws an error.
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflInvalidFieldMappingError() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Gender__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        insert testContactsList;

        for (Contact con : testContactsList) {
            con.Primary_Organization__c = businessAccount1.Id;
            con.Gender__c = 'Decline to State';
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidFieldMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation enabled, a valid Contact field mapping to a non-lookup field and invalid Record Type mapping throws
     * an error when the mapped field is populated.
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflInvalidRTAndInvalidFieldMappingFieldPopulatedInvalidRecordTypeError() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Gender__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        insert testContactsList;

        for (Contact con : testContactsList) {
            con.Gender__c = 'Decline to State';
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidRTMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation enabled, a valid Contact field mapping to a non-lookup field and invalid Record Type mapping does not
     * throw an error when the mapped field is not populated.
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflInvalidRTAndInvalidFieldMappingFieldNotPopulatedPositive() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        for (Contact con : testContactsList) {
            con.FirstName = '';
        }
        insert testContactsList;

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('FirstName')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        for (Contact con : testContactsList) {
            con.Primary_Organization__c = businessAccount1.Id;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> testContactResultsList = [
            SELECT Id, Primary_Organization__c
            FROM Contact
            WHERE Id IN :testContactsList
        ];

        for (Contact con : testContactResultsList) {
            System.assertEquals(businessAccount1.Id, con.Primary_Organization__c);
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation disabled, a valid Contact field mapping to a lookup field and invalid Record Type mapping does not
     * throw an error when the mapped field is not populated.
     * Test Scenario: T-3939018
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflInvalidRTAndValidFieldMappingFieldNotPopulatedNoValidationPositive() {
        User u = [SELECT toLabel(LanguageLocaleKey) FROM User WHERE Id = :UserInfo.getUserId()];
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100, u.LanguageLocaleKey);
        insert testContactsList;

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        for (Contact con : testContactsList) {
            con.Primary_Organization__c = businessAccount1.Id;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> testContactResultsList = [
            SELECT Id, Primary_Organization__c
            FROM Contact
            WHERE Id IN :testContactsList
        ];

        for (Contact con : testContactResultsList) {
            System.assertEquals(businessAccount1.Id, con.Primary_Organization__c);
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation disabled, a valid Contact field mapping to a lookup field and invalid Record Type mapping does not
     * throw an error when the mapped field is not populated.
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflInvalidRTAndInValidFieldMappingFieldNotPopulatedNoValidationPositive() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Not a Valid RecordType',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Gender__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        insert testContactsList;

        for (Contact con : testContactsList) {
            con.Gender__c = 'Decline to State';
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getExpectedInvalidFieldMappingErrorMessage(mappings[0]);

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(testContactsList, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'Invalid Record Type mapping should throw an error when validation is enabled.'
            );
        }
    }

    /*************************************************************************************************************
     * @description Test case to verify that updating a primary affiliation field on Contact with record type
     * validation disabled, a valid Contact field mapping to a lookup field and invalid Record Type mapping does not
     * throw an error when the mapped field is not populated.
     **************************************************************************************************************/
    @isTest
    private static void updateContactAfflValidRTAndValidFieldMappingFieldPopulatedNoValidationPositive() {
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(100);
        insert testContactsList;

        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Account businessAccount = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount;

        for (Contact con : testContactsList) {
            con.Primary_Organization__c = businessAccount.Id;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact> testContactResultsList = [
            SELECT Id, Primary_Organization__c
            FROM Contact
            WHERE Id IN :testContactsList
        ];

        for (Contact con : testContactResultsList) {
            System.assertEquals(businessAccount.Id, con.Primary_Organization__c);
        }
    }

    private static void createAffiliationsOnBulkContactInsert() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccount1.Id;
            contactsToBeInserted.add(contactWithPrimaryBusinessOrg);
        }

        insert contactsToBeInserted;
        Map<Id, Contact> ContactsById = new Map<Id, Contact>(contactsToBeInserted);

        //Ensure Primary Business Organization affiliations are created for each Contact
        List<Contact> updatedContactList = [
            SELECT Id, Primary_Organization__c, (SELECT Account__c, Contact__c, Primary__c FROM Affl_Accounts__r)
            FROM Contact
            WHERE Id IN :ContactsById.keySet()
        ];

        System.assertEquals(100, updatedContactList.size());
        for (Contact eachUpdatedContact : updatedContactList) {
            System.assertEquals(1, eachUpdatedContact.Affl_Accounts__r.size());
            for (Affiliation__c affiliation : eachUpdatedContact.Affl_Accounts__r) {
                System.assertEquals(businessAccount1.Id, affiliation.Account__c);
                System.assertEquals(eachUpdatedContact.Id, affiliation.Contact__c);
                System.assertEquals(true, affiliation.Primary__c);
            }
        }
    }

    /*************************************************************************************************************
     * @description Positive bulk test to ensure affiliations are created on Contact update
     **************************************************************************************************************/
    @isTest
    private static void createAffiliationsOnBulkContactupdate() {
        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactsToBeInserted.add(contactWithPrimaryBusinessOrg);
        }

        insert contactsToBeInserted;

        List<Contact> contactToBeUpdatedList = new List<Contact>();

        for (Contact contactToBeUpdated : contactsToBeInserted) {
            contactToBeUpdated.Primary_Organization__c = businessAccount1.Id;
            contactToBeUpdatedList.add(contactToBeUpdated);
        }

        Test.startTest();
        update contactToBeUpdatedList;
        Test.stopTest();
        Map<Id, Contact> ContactsById = new Map<Id, Contact>(contactToBeUpdatedList);

        //Ensure Primary Business Organization affiliations are created for each Contact
        List<Contact> updatedContactList = [
            SELECT Id, Primary_Organization__c, (SELECT Account__c, Contact__c, Primary__c FROM Affl_Accounts__r)
            FROM Contact
            WHERE Id IN :ContactsById.keySet()
        ];

        System.assertEquals(100, updatedContactList.size());
        for (Contact eachUpdatedContact : updatedContactList) {
            System.assertEquals(1, eachUpdatedContact.Affl_Accounts__r.size());
            for (Affiliation__c affiliation : eachUpdatedContact.Affl_Accounts__r) {
                System.assertEquals(businessAccount1.Id, affiliation.Account__c);
                System.assertEquals(eachUpdatedContact.Id, affiliation.Contact__c);
                System.assertEquals(true, affiliation.Primary__c);
            }
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is inserted with a primary affiliation field populated, the
     * Contact is created, but no associated affiliation record is inserted when Record Type validation is On with
     * an invalid contact field mapping and valid Record Type mapping.
     **************************************************************************************************************/
    @isTest
    private static void createAffiliationsOnBulkContactInsertWithWrongMappingsWithValidationOn() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c' + 'test')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccount1.Id;
            contactsToBeInserted.add(contactWithPrimaryBusinessOrg);
        }

        Test.startTest();
        insert contactsToBeInserted;
        Test.stopTest();

        List<Contact> conList = [
            SELECT Id, (SELECT Id FROM Affl_Accounts__r)
            FROM Contact
            WHERE Id IN :contactsToBeInserted
        ];

        System.assertEquals(100, conList.size(), 'Five Contacts should be created.');

        for (Contact con : conList) {
            System.assertEquals(
                true,
                con.Affl_Accounts__r.isEmpty(),
                'Enabling record type validation with invalid mapping should prevent creation of affiliation records.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is inserted with a primary affiliation field populated, but the
     * mapping is to a field that is not of type lookup to Account, an invalidContactFieldInAffiliationMapping error is thrown.
     **************************************************************************************************************/
    @isTest
    private static void insertContactWithValidRecordTypeMappingAndInvalidFieldMappingToAccountLookup() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = 'ReportsToId'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            con.ReportsToId = reportToContact.Id;
            contactsToBeInserted.add(con);
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getinvalidContactFieldInAffiliationMappingMessage(
            'ReportsToId'
        );

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(contactsToBeInserted, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'An invalidContactFieldInAffiliationMapping error should be thrown.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is inserted with a primary affiliation field populated, the
     * mapping is to a field that is not of type lookup to Account, Record Type mapping is invalid and validation is
     * enabled, an invalidRecordTypeInAffiliationMapping error is thrown.
     **************************************************************************************************************/
    @isTest
    private static void insertContactWithInvalidRTMappingAndInvalidFieldMappingToAccountLookupValidationOn() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization_Invalid',
                Primary_Affl_Field__c = 'ReportsToId'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            con.ReportsToId = reportToContact.Id;
            contactsToBeInserted.add(con);
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getInvalidRecordTypeInAffiliationMappingMessage(
            'Business_Organization_Invalid'
        );

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(contactsToBeInserted, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'An invalidRecordTypeInAffiliationMapping error should be thrown.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is inserted with a primary affiliation field populated,  the
     * mapping is to a field that is not of type lookup to Account, Record Type mapping is invalid and validation is
     * disabled, an invalidContactFieldInAffiliationMapping error is thrown.
     **************************************************************************************************************/
    @isTest
    private static void insertContactWithInvalidRTMappingAndInvalidFieldMappingToAccountLookupValidationOff() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization_Invalid',
                Primary_Affl_Field__c = 'ReportsToId'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            con.ReportsToId = reportToContact.Id;
            contactsToBeInserted.add(con);
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getinvalidContactFieldInAffiliationMappingMessage(
            'ReportsToId'
        );

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.insert(contactsToBeInserted, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'An invalidContactFieldInAffiliationMapping error should be thrown.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is inserted without a primary affiliation field populated,  the
     * mapping is to a field that is not of type lookup to Account, Record Type mapping is invalid and validation is
     * disabled, no error is thrown and the insert completes as expected.
     **************************************************************************************************************/
    @isTest
    private static void insertContactWithNoPrimaryAfflFieldPopulated() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization_Invalid',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('ReportsToId')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            con.Gender__c = 'Decline to State';
            contactsToBeInserted.add(con);
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getinvalidContactFieldInAffiliationMappingMessage(
            'ReportsToId'
        );

        Test.startTest();
        insert contactsToBeInserted;
        Test.stopTest();

        List<Contact> contactResultsList = [SELECT Id, Gender__c FROM Contact WHERE Id IN :contactsToBeInserted];

        System.assertEquals(contactCount, contactResultsList.size(), 'Contacts should insert successfully.');

        for (Contact con : contactResultsList) {
            System.assertEquals(
                'Decline to State',
                con.Gender__c,
                'Gender__c field should be set to \'Decline to State\'.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is updated with a primary affiliation field populated, but the
     * mapping is to a field that is not of type lookup to Account, an invalidContactFieldInAffiliationMapping error is thrown.
     **************************************************************************************************************/
    @isTest
    private static void updateContactWithValidRecordTypeMappingAndInvalidFieldMappingToAccountLookup() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = 'ReportsToId'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactsToBeInserted.add(con);
        }

        insert contactsToBeInserted;

        for (Contact con : contactsToBeInserted) {
            con.ReportsToId = reportToContact.Id;
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getinvalidContactFieldInAffiliationMappingMessage(
            'ReportsToId'
        );

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(contactsToBeInserted, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'An invalidContactFieldInAffiliationMapping error should be thrown.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is updated with a primary affiliation field populated, the
     * mapping is to a field that is not of type lookup to Account, Record Type mapping is invalid and validation is
     * enabled, an invalidRecordTypeInAffiliationMapping error is thrown.
     **************************************************************************************************************/
    @isTest
    private static void updateContactWithInvalidRTMappingAndInvalidFieldMappingToAccountLookupValidationOn() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = true)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization_Invalid',
                Primary_Affl_Field__c = 'ReportsToId'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactsToBeInserted.add(con);
        }

        insert contactsToBeInserted;

        for (Contact con : contactsToBeInserted) {
            con.ReportsToId = reportToContact.Id;
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getInvalidRecordTypeInAffiliationMappingMessage(
            'Business_Organization_Invalid'
        );

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(contactsToBeInserted, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'An invalidRecordTypeInAffiliationMapping error should be thrown.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is updated with a primary affiliation field populated,  the
     * mapping is to a field that is not of type lookup to Account, Record Type mapping is invalid and validation is
     * disabled, an invalidContactFieldInAffiliationMapping error is thrown.
     **************************************************************************************************************/
    @isTest
    private static void updateContactWithInvalidRTMappingAndInvalidFieldMappingToAccountLookupValidationOff() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization_Invalid',
                Primary_Affl_Field__c = 'ReportsToId'
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactsToBeInserted.add(con);
        }

        insert contactsToBeInserted;

        for (Contact con : contactsToBeInserted) {
            con.ReportsToId = reportToContact.Id;
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getinvalidContactFieldInAffiliationMappingMessage(
            'ReportsToId'
        );

        Test.startTest();
        Database.SaveResult[] saveResultsList = Database.update(contactsToBeInserted, false);
        Test.stopTest();

        for (Database.SaveResult saveResult : saveResultsList) {
            System.assertEquals(
                errorMessageText,
                saveResult.getErrors()[0].getMessage(),
                'An invalidContactFieldInAffiliationMapping error should be thrown.'
            );
        }
    }

    /****************************************************************************************************************
     * @description Tests to ensure that when a Contact is updated without a primary affiliation field populated,  the
     * mapping is to a field that is not of type lookup to Account, Record Type mapping is invalid and validation is
     * disabled, no error is thrown and the update completes as expected.
     **************************************************************************************************************/
    @isTest
    private static void updateContactWithNoPrimaryAfflFieldPopulated() {
        UTIL_CustomSettings_API.getSettingsForTests(
            new Hierarchy_Settings__c(Affiliation_Record_Type_Enforced__c = false)
        );

        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization_Invalid',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('ReportsToId')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        Contact reportToContact = UTIL_UnitTestData_TEST.getUniqueContact(contactCount + 5);
        insert reportToContact;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact con = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactsToBeInserted.add(con);
        }

        insert contactsToBeInserted;

        for (Contact con : contactsToBeInserted) {
            con.Gender__c = 'Decline to State';
        }

        String errorMessageText = CON_PrimaryAffls_TEST.getinvalidContactFieldInAffiliationMappingMessage(
            'ReportsToId'
        );

        Test.startTest();
        update contactsToBeInserted;
        Test.stopTest();

        List<Contact> contactResultsList = [SELECT Id, Gender__c FROM Contact WHERE Id IN :contactsToBeInserted];

        for (Contact con : contactResultsList) {
            System.assertEquals(
                'Decline to State',
                con.Gender__c,
                'Gender__c field should be updated to \'Decline to State\'.'
            );
        }
    }

    /*************************************************************************************************************************
     * @description Test to ensure Contacts are not created created when mappings have incorrect values and validation is off
     *************************************************************************************************************************/
    @isTest
    private static void createAffiliationsOnBulkContactInsertWithWrongMappingsWithValidationOff() {
        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c' + 'test')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        Account businessAccount1 = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            1,
            UTIL_Describe_API.getBizAccRecTypeID()
        )[0];
        insert businessAccount1;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccount1.Id;
            contactsToBeInserted.add(contactWithPrimaryBusinessOrg);
        }

        Test.startTest();
        insert contactsToBeInserted;
        Test.stopTest();

        List<Contact> conList = [SELECT Id FROM Contact];
        List<Affiliation__c> afflList = [SELECT Id FROM Affiliation__c];

        System.assertEquals(100, conList.size());
        System.assertEquals(true, afflList.isEmpty());
    }

    /********************************************************************************************************************************
     * @description Test to ensure new Primary affiliations are created and old ones become non-primary when Primary affiliation field
     * is updated in a Contact record.
     ********************************************************************************************************************************/
    @isTest
    private static void createAffiliationsOnBulkContactupdates() {
        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        List<Account> businessAccountList = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccountList;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < contactCount; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccountList[0].Id;
            contactsToBeInserted.add(contactWithPrimaryBusinessOrg);
        }

        insert contactsToBeInserted;

        List<Affiliation__c> afflList = [
            SELECT Id
            FROM Affiliation__c
            WHERE Account__c = :businessAccountList[0].Id AND Primary__c = TRUE
        ];
        System.assertEquals(100, afflList.size());

        List<Contact> contactToBeUpdatedList = new List<Contact>();

        for (Contact contactToBeUpdated : contactsToBeInserted) {
            contactToBeUpdated.Primary_Organization__c = businessAccountList[1].Id;
            contactToBeUpdatedList.add(contactToBeUpdated);
        }

        Test.startTest();
        update contactToBeUpdatedList;
        Test.stopTest();
        Map<Id, Contact> ContactsById = new Map<Id, Contact>(contactToBeUpdatedList);

        List<Affiliation__c> afflListWithBizOrg1AsPrimary = [
            SELECT Id
            FROM Affiliation__c
            WHERE Account__c = :businessAccountList[0].Id AND Primary__c = TRUE
        ];
        System.assertEquals(0, afflListWithBizOrg1AsPrimary.size());

        List<Affiliation__c> afflListWithBizOrg2AsPrimary = [
            SELECT Id
            FROM Affiliation__c
            WHERE Account__c = :businessAccountList[1].Id AND Primary__c = TRUE
        ];
        System.assertEquals(100, afflListWithBizOrg2AsPrimary.size());
    }

    /*************************************************************************************************************
     * @description Test to ensure Primary Affiliations are made non-primary when Primary field is cleared on
     * update of a Contact record.
     **************************************************************************************************************/
    @isTest
    private static void makeAffiliationNonPrimaryByClearingField() {
        // insert mappings
        List<Affl_Mappings__c> mappings = new List<Affl_Mappings__c>();
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Business Organization',
                Account_Record_Type__c = 'Business_Organization',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Organization__c')
            )
        );
        mappings.add(
            new Affl_Mappings__c(
                Name = 'Household Account',
                Account_Record_Type__c = 'HH_Account',
                Primary_Affl_Field__c = UTIL_Namespace.StrTokenNSPrefix('Primary_Household__c')
            )
        );
        insert mappings;

        // insert business account
        List<Account> businessAccountList = UTIL_UnitTestData_TEST.getMultipleTestAccounts(
            2,
            UTIL_Describe_API.getBizAccRecTypeID()
        );
        insert businessAccountList;

        List<Contact> contactsToBeInserted = new List<Contact>();
        for (integer i = 0; i < 5; i++) {
            Contact contactWithPrimaryBusinessOrg = UTIL_UnitTestData_TEST.getUniqueContact(i);
            contactWithPrimaryBusinessOrg.Primary_Organization__c = businessAccountList[0].Id;
            contactsToBeInserted.add(contactWithPrimaryBusinessOrg);
        }

        insert contactsToBeInserted;

        List<Affiliation__c> afflList = [
            SELECT Id
            FROM Affiliation__c
            WHERE Account__c = :businessAccountList[0].Id AND Primary__c = TRUE
        ];
        System.assertEquals(5, afflList.size());

        List<Contact> contactToBeUpdatedList = new List<Contact>();

        for (Contact contactToBeUpdated : contactsToBeInserted) {
            contactToBeUpdated.Primary_Organization__c = null;
            contactToBeUpdatedList.add(contactToBeUpdated);
        }

        Test.startTest();
        update contactToBeUpdatedList;
        Test.stopTest();
        Map<Id, Contact> ContactsById = new Map<Id, Contact>(contactToBeUpdatedList);

        List<Affiliation__c> afflListWithBizOrg1AsPrimary = [SELECT Id FROM Affiliation__c WHERE Primary__c = TRUE];
        System.assertEquals(0, afflListWithBizOrg1AsPrimary.size());
    }

    /**************************************************************************************************************
     * @description Helper method to generate invalidRecordTypeInAffiliationMapping with appropriate
     * substitutions.
     * @param  invalidRTName Name of invalid Record Type in affiliation mapping
     * @return A string containing invalidRecordTypeInAffiliationMapping message text with appropriate
     * substitutions.
     **************************************************************************************************************/
    private static String getInvalidRecordTypeInAffiliationMappingMessage(String invalidRTName) {
        List<String> params = new List<String>{ Label.stgColAccountRecordType, invalidRTName };

        return StringHandlingService.getInstance()
            .formatStringWithApostrophesAndParameters(label.invalidRecordTypeInAffiliationMapping, params);
    }

    /**************************************************************************************************************
     * @description Helper method to generate invalidContactFieldInAffiliationMapping with appropriate
     * substitutions.
     * @param  invalidRTName Name of invalid Contact field in affiliation mapping
     * @return A string containing invalidContactFieldInAffiliationMapping message text with appropriate
     * substitutions.
     **************************************************************************************************************/
    private static String getinvalidContactFieldInAffiliationMappingMessage(String invalidContactFieldName) {
        List<String> params = new List<String>{ Label.stgColContactPrimaryAfflField, invalidContactFieldName };

        return StringHandlingService.getInstance()
            .formatStringWithApostrophesAndParameters(label.invalidContactFieldInAffiliationMapping, params);
    }
}
/*
    Copyright (c) 2019, Salesforce.org
    All rights reserved.
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
* @author Salesforce.org
* @date 2019
* @group Languages
* @group-content ../../ApexDocContent/Languages.htm
* @description Tests to verify the logic associated with the CON_PrimaryLanguage_TDTM class when Contact records are
* inserted or updated with changes to the Primary Language field.  Validates that a new Contact Language record is
* created only when an existing record corresponding to the Contact and Language is not found.
*/
@isTest
private class CON_PrimaryLanguage_TEST {

    /**************************************************************************************************************************
    ****************************************************** FUNCTIONAL TESTS ***************************************************
    **************************************************************************************************************************/

    /*******************************************************************************************************
    * @description Test method to verify that insertion of a new Contact with a Primary Language specified
    * results in the creation of a Primary Contact Language corresponding to the specified language
    * and related to the Contact.
    ********************************************************************************************************/
    @isTest
    private static void insertContactWithPrimaryLanguage() {
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact_Language__c> conLangAfterInsertList = [SELECT Id, 
                                                                   Primary_Language__c, 
                                                                   Fluency__c,
                                                                   Contact__c,
                                                                   Language__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :testContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangAfterInsertList);

        for (Contact con : testContactsList){
            System.assertEquals(true, contactLanguagesListByContactId.containsKey(con.Id), 'Contact should be associated with Contact Language records.');
            System.assertEquals(1, contactLanguagesListByContactId.get(con.Id).size(), 'Contact should be associated with one Contact Language record.');            
            System.assertEquals(englishLanguage.Id, contactLanguagesListByContactId.get(con.Id)[0].Language__c, 'Contact Language record associated with Contact should be for the English Language.');
            System.assertEquals(englishLanguage.Id, con.Primary_Language__c, 'Contact\'s primary language should be English.');            
            System.assertEquals(con.Primary_Language__c, contactLanguagesListByContactId.get(con.Id)[0].Language__c, 'Primary language on Contact should match the language specified on Contact Language record.');
            System.assertEquals(true, contactLanguagesListByContactId.get(con.Id)[0].Primary_Language__c, 'English Contact Language record should be set as primary.');
            System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, contactLanguagesListByContactId.get(con.Id)[0].Fluency__c, 'English Contact Language record fluency should match the default value.');
        }
    }

    /*******************************************************************************************************
    * @description Test method to verify that updating of a Contact to specify a Primary Language 
    * results in the creation of a Primary Contact Language corresponding to the language when one
    * does not already exist.
    ********************************************************************************************************/
    @isTest
    private static void updateContactToAddNewPrimaryLanguage() {
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        insert testContactsList;
        
        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact_Language__c> conLangAfterInsertList = [SELECT Id, 
                                                                   Primary_Language__c, 
                                                                   Fluency__c,
                                                                   Contact__c,
                                                                   Language__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :testContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangAfterInsertList);

        for (Contact con : testContactsList){
            System.assertEquals(true, contactLanguagesListByContactId.containsKey(con.Id), 'Contact should be associated with Contact Language records.');
            System.assertEquals(1, contactLanguagesListByContactId.get(con.Id).size(), 'Contact should be associated with one Contact Language record.');            
            System.assertEquals(englishLanguage.Id, contactLanguagesListByContactId.get(con.Id)[0].Language__c, 'Contact Language record associated with Contact should be for the English Language.');
            System.assertEquals(englishLanguage.Id, con.Primary_Language__c, 'Contact\'s primary language should be English.');            
            System.assertEquals(con.Primary_Language__c, contactLanguagesListByContactId.get(con.Id)[0].Language__c, 'Primary language on Contact should match the language specified on Contact Language record.');
            System.assertEquals(true, contactLanguagesListByContactId.get(con.Id)[0].Primary_Language__c, 'English Contact Language record should be set as primary.');
            System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, contactLanguagesListByContactId.get(con.Id)[0].Fluency__c, 'English Contact Language record fluency should match the default value.');
        }
    }

    /*******************************************************************************************************
    * @description Test method to verify that updating of a Contact to change the specified Primary Language 
    * results in the creation of a new Primary Contact Language corresponding to the new language when one
    * does not already exist and removes the primary setting from the former contact languge record.
    ********************************************************************************************************/
    @isTest
    private static void updateContactToChangeToNewPrimaryLanguage() {
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        Language__c frenchLanguage = UTIL_UnitTestData_TEST.createLanguage('French');

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        insert testContactsList;
        
        for (Contact con : testContactsList){
            con.Primary_Language__c = frenchLanguage.Id;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact_Language__c> conLangAfterInsertList = [SELECT Id, 
                                                                   Primary_Language__c, 
                                                                   Fluency__c,
                                                                   Contact__c,
                                                                   Language__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :testContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangAfterInsertList);

        for (Contact con : testContactsList){
            System.assertEquals(true, contactLanguagesListByContactId.containsKey(con.Id), 'Contact should be associated with Contact Language records.');
            System.assertEquals(2, contactLanguagesListByContactId.get(con.Id).size(), 'Contact should be associated with two Contact Language records.');            
            System.assertEquals(frenchLanguage.Id, con.Primary_Language__c, 'Contact\'s primary language should be French.');            

            for (Contact_Language__c conLang : contactLanguagesListByContactId.get(con.Id)){
                if (conLang.Language__c == frenchLanguage.Id){
                    System.assertEquals(true, conLang.Primary_Language__c, 'French Contact Language record should be set as primary.');
                    System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, conLang.Fluency__c, 'French Contact Language record fluency should match the default value.');
                } else {
                    System.assertEquals(englishLanguage.Id, conLang.Language__c, 'Second contact language record should correspond to the English Language.');
                    System.assertEquals(false, conLang.Primary_Language__c, 'English Contact Language record should not be set as primary.');
                }
            }
        }
    }

    /*******************************************************************************************************
    * @description Test method to verify that updating of a Contact to specify a new Primary Language 
    * does not result in the creation of a new Primary Contact Language corresponding to the new language 
    * when one already exists, and sets the existing record as primary.  Additionally, the primary status on 
    * the former contact is cleard.
    ********************************************************************************************************/
    @isTest
    private static void updateContactToIncludeExistingPrimaryLanguage(){
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        Language__c frenchLanguage = UTIL_UnitTestData_TEST.createLanguage('French');

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<Contact_Language__c> testExistingConLangs = new List<Contact_Language__c>();

        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            Contact_Language__c existingConLang = UTIL_UnitTestData_TEST.getContactLanguage(frenchLanguage, con, UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c);
            testExistingConLangs.add(existingConLang);
        }

        insert testExistingConLangs;

        for (Contact con : testContactsList){
            con.Primary_Language__c = frenchLanguage.Id;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact_Language__c> conLangAfterInsertList = [SELECT Id, 
                                                                   Primary_Language__c, 
                                                                   Fluency__c,
                                                                   Contact__c,
                                                                   Language__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :testContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangAfterInsertList);

        for (Contact con : testContactsList){
            System.assertEquals(true, contactLanguagesListByContactId.containsKey(con.Id), 'Contact should be associated with Contact Language records.');
            System.assertEquals(2, contactLanguagesListByContactId.get(con.Id).size(), 'Contact should be associated with two Contact Language records.');            
            System.assertEquals(frenchLanguage.Id, con.Primary_Language__c, 'Contact\'s primary language should be French.');            
            
            for (Contact_Language__c conLang : contactLanguagesListByContactId.get(con.Id)){
                if (conLang.Language__c == frenchLanguage.Id){
                    System.assertEquals(true, conLang.Primary_Language__c, 'French Contact Language record should be set as primary.');
                    System.assertEquals(con.Primary_Language__c, conLang.Language__c, 'Primary language on Contact should match the language specified on Contact Language record.');
                } else {
                    System.assertEquals(englishLanguage.Id, conLang.Language__c, 'Second contact language record should correspond to the English Language.');
                    System.assertEquals(false, conLang.Primary_Language__c, 'English Contact Language record should not be set as primary.');
                }
            }
        }
    }

    /*******************************************************************************************************
    * @description Test method to ensure that new contact language records are creaded with a fluency level
    * specified by the default Fluency value in EDA settings when available.
    ********************************************************************************************************/
    @isTest
    private static void setPrimaryLanguageWithDifferentFluencyValue() {
        String fluencyValue = 'Intermediate';
        UTIL_CustomSettings_API.getSettingsForTests(new Hierarchy_Settings__c(
                                                        Default_Contact_Language_Fluency__c = fluencyValue));
        
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);

        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        Test.startTest();
        insert testContactsList;
        Test.stopTest();

        List<Contact_Language__c> conLangAfterInsertList = [SELECT Id, 
                                                                   Primary_Language__c, 
                                                                   Fluency__c,
                                                                   Contact__c,
                                                                   Language__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :testContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangAfterInsertList);

        for (Contact con : testContactsList){
            System.assertEquals(true, contactLanguagesListByContactId.containsKey(con.Id), 'Contact should be associated with Contact Language records.');
            System.assertEquals(1, contactLanguagesListByContactId.get(con.Id).size(), 'Contact should be associated with two Contact Language records.');            
            System.assertEquals(englishLanguage.Id, contactLanguagesListByContactId.get(con.Id)[0].Language__c, 'Contact Language record should be associated with the English language.');
            System.assertEquals(fluencyValue, contactLanguagesListByContactId.get(con.Id)[0].Fluency__c, 'Contact Language fluency level for English should be Intermediate.');
            System.assertEquals(englishLanguage.Id, con.Primary_Language__c, 'Contact\'s primary language should be English.');            
        }
    }

    /*******************************************************************************************************
    * @description Test method to ensure that when the Primary Language is removed from a Contact, the
    * the primary setting on the corresponding contact language record is cleared. 
    ********************************************************************************************************/
    @isTest
    private static void updateContactToRemovePrimaryLanguage() {
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        
        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        insert testContactsList;

        for (Contact con : testContactsList){
            con.Primary_Language__c = null;
        }

        Test.startTest();
        update testContactsList;
        Test.stopTest();

        List<Contact_Language__c> conLangAfterInsertList = [SELECT Id, 
                                                                   Primary_Language__c, 
                                                                   Fluency__c,
                                                                   Contact__c,
                                                                   Language__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :testContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangAfterInsertList);

        for (Contact con : testContactsList){
            System.assertEquals(true, contactLanguagesListByContactId.containsKey(con.Id), 'Contact should be associated with Contact Language records.');
            System.assertEquals(1, contactLanguagesListByContactId.get(con.Id).size(), 'Contact should be associated with one Contact Language record.');            
            System.assertEquals(englishLanguage.Id, contactLanguagesListByContactId.get(con.Id)[0].Language__c, 'Contact Language record associated with Contact should be for the English Language.');
            System.assertEquals(null, con.Primary_Language__c, 'Contact\'s primary language should be blank.');            
            System.assertEquals(false, contactLanguagesListByContactId.get(con.Id)[0].Primary_Language__c, 'English Contact Language record should not be set as primary.');
            System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, contactLanguagesListByContactId.get(con.Id)[0].Fluency__c, 'English Contact Language record fluency should match the default value.');
        }
    }

    /**************************************************************************************************************************
    ****************************************************** UNIT TESTS *********************************************************
    **************************************************************************************************************************/

    /************************************************************************************************************
    * @description Test method to verify that isUpdateRecursion returns true when only the recursion flag for
    * CON_PrimaryLanguage_TDTM is set.
    *************************************************************************************************************/ 
    @isTest 
    private static void isConPrimaryLanguageUpdateRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, false);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(true, conPriLangTdtm.isUpdateRecursion(), 'Update recursion status should be true.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that isUpdateRecursion returns true when only the recursion flag
    * for CLAN_PrimaryLanguage_TDTM is set.
    *************************************************************************************************************/ 
    @isTest 
    private static void isCLANPrimaryLanguageUpdateRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, true);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(true, conPriLangTdtm.isUpdateRecursion(), 'Update recursion status should be true.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that isUpdateRecursion returns true when recursion flags for both
    * CON_PrimaryLanguage_TDTM and CLAN_PrimaryLanguage_TDTM set.
    *************************************************************************************************************/ 
    @isTest 
    private static void isUpdateRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, true);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(true, conPriLangTdtm.isUpdateRecursion(), 'Update recursion status should be true.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that isUpdateRecursion returns false when recursion flags for both
    * CON_PrimaryLanguage_TDTM and CLAN_PrimaryLanguage_TDTM are unset.
    *************************************************************************************************************/ 
    @isTest 
    private static void isUpdateRecursionFalse(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, false);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(false, conPriLangTdtm.isUpdateRecursion(), 'Update recursion status should be false.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that unsetUpdateRecursion properly updates the status for the 
    * CON_PrimaryLanguage_After_Update recursion flag to false.
    *************************************************************************************************************/ 
    @isTest 
    private static void unsetUpdateRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        conPriLangTdtm.unsetUpdateRecursion();
        Test.stopTest();

        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Update recursion flag should be cleared.');
    }

    /************************************************************************************************************
    * @description Test method to verify that unsetUpdateRecursion properly updates the status for the 
    * CON_PrimaryLanguage_After_Update recursion flag to true.
    *************************************************************************************************************/ 
    @isTest 
    private static void setUpdateRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        conPriLangTdtm.setUpdateRecursion();
        Test.stopTest();

        System.assertEquals(true, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Update recursion flag should be set.');
    }

    /************************************************************************************************************
    * @description Test method to verify that isInsertRecursion returns true when only the recursion flag for
    * CON_PrimaryLanguage_TDTM is set.
    *************************************************************************************************************/ 
    @isTest 
    private static void isCONPrimaryLanguageInsertRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, false);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(true, conPriLangTdtm.isInsertRecursion(), 'Insert recursion status should be true.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that isInsertRecursion returns true when only the recursion flag for
    * CLAN_PrimaryLanguage_TDTM is set.
    *************************************************************************************************************/ 
    @isTest 
    private static void isCLANPrimaryLanguageInsertRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, true);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(true, conPriLangTdtm.isInsertRecursion(), 'Insert recursion status should be true.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that isInsertRecursion returns true when recursion flags for both
    * CON_PrimaryLanguage_TDTM and CLAN_PrimaryLanguage_TDTM are set.
    *************************************************************************************************************/ 
    @isTest 
    private static void isInsertRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, true);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(true, conPriLangTdtm.isInsertRecursion(), 'Insert recursion status should be true.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that isInsertRecursion returns false recursion flags for both
    * CON_PrimaryLanguage_TDTM and CLAN_PrimaryLanguage_TDTM are unset.
    *************************************************************************************************************/ 
    @isTest 
    private static void isInsertRecursionFalse(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CLAN_PrimaryLanguage_TDTM, false);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        System.assertEquals(false, conPriLangTdtm.isInsertRecursion(), 'Insert recursion status should be false.');
        Test.stopTest();
    }

    /************************************************************************************************************
    * @description Test method to verify that unsetInsertRecursion correctly updates the status of the 
    * CON_PrimaryLanguage_TDTM recursion flag to false.
    *************************************************************************************************************/ 
    @isTest 
    private static void unsetInsertRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        conPriLangTdtm.unsetInsertRecursion();
        Test.stopTest();

        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Insert recursion flag should be cleared.');
    }

    /************************************************************************************************************
    * @description Test method to verify that setInsertRecursion correctly updates the status of the 
    * CON_PrimaryLanguage_TDTM recursion flag to true.
    *************************************************************************************************************/ 
    @isTest 
    private static void setInsertRecursionTrue(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();

        Test.startTest();
        conPriLangTdtm.setInsertRecursion();
        Test.stopTest();

        System.assertEquals(true, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Insert recursion flag should be set.');
    }

    /************************************************************************************************************
    * @description Test method to verify that the locateContactPrimaryLanguageService returns an instance of the
    * SRVC_ContactPrimaryLanguage service class.
    *************************************************************************************************************/ 
    @isTest 
    private static void getInstanceOfContactPrimaryLanguageService(){
        Test.startTest();
        CON_PrimaryLanguage_TDTM conPriLangTdtm = new CON_PrimaryLanguage_TDTM();
        SRVC_ContactPrimaryLanguage srvcConPrimaryLangInstance = conPriLangTdtm.locateContactPrimaryLanguageService();
        Test.stopTest();
        
        System.assertEquals(true, srvcConPrimaryLangInstance != null, 'Instance of service class should be retrieved.');
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterUpdate creates new contact language records for contacts
    * updated with primary languages never previously associated.  
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterUpdateInsertsOnly(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        List<Contact> newTestContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<Contact> oldTestContactsList = new List<Contact>();
      
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        Language__c frenchLanguage = UTIL_UnitTestData_TEST.createLanguage('French');

        insert newTestContactsList;

        for (Contact con : newTestContactsList){
            con.Primary_Language__c = englishLanguage.Id;

            Contact oldContact = con.Clone(false);
            oldContact.Id = con.Id;
            oldContact.Primary_Language__c = frenchLanguage.Id;
            oldTestContactsList.add(oldContact);
        }
        
        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterUpdate((List<SObject>)newTestContactsList, (List<SObject>)oldTestContactsList);
        Test.stopTest();

        List<Contact_Language__c> conLangResultsList = [SELECT Id, 
                                                               Primary_Language__c, 
                                                               Fluency__c,
                                                               Contact__c,
                                                               Language__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :newTestContactsList
                                                        AND Language__c = :englishLanguage.Id];

        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should remain unset.');
        System.assertEquals(5, conLangResultsList.size(), 'There should be 5 new English Contact Language records created.');

        for (Contact_Language__c conLang : conLangResultsList){
            System.assertEquals(true, conLang.Primary_Language__c, 'Each new Contact Language record should be marked as primary.');
            System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, conLang.Fluency__c, 'Each new contact language record should be associated with the default fluency value.');
        }        
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterUpdate does not create new contact language records for 
    * contacts updated with primary languages previously associated and updates existing contact language record
    * to primary.  Instead, the previous contact language record is unset as primary and the existing contact 
    * language record is updated to primary.
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterUpdateUpdatesOnly(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);
        
        List<Contact> newTestContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<Contact> oldTestContactsList = new List<Contact>();
        List<Contact_Language__c> contactLanguagesList = new List<Contact_Language__c>();

        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        Language__c frenchLanguage = UTIL_UnitTestData_TEST.createLanguage('French');

        insert newTestContactsList;

        for (Contact con : newTestContactsList){
            Contact_Language__c englishConLang = UTIL_UnitTestData_TEST.getContactLanguage(englishLanguage, con, UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c);
            Contact_Language__c frenchConLang = UTIL_UnitTestData_TEST.getContactLanguage(frenchLanguage, con, UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c);
            frenchConLang.Primary_Language__c = true;

            contactLanguagesList.add(englishConLang);
            contactLanguagesList.add(frenchConLang);

            con.Primary_Language__c = englishLanguage.Id;

            Contact oldContact = con.Clone(false);
            oldContact.Id = con.Id;
            oldContact.Primary_Language__c = frenchLanguage.Id;
            oldTestContactsList.add(oldContact);
        }
        
        insert contactLanguagesList;

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterUpdate((List<SObject>)newTestContactsList, (List<SObject>)oldTestContactsList);
        Test.stopTest();

        List<Contact_Language__c> conLangResultsList = [SELECT Id, 
                                                               Primary_Language__c, 
                                                               Fluency__c,
                                                               Contact__c,
                                                               Language__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :newTestContactsList];

        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = CON_PrimaryLanguage_TEST.mapContactLanguagesToContact(conLangResultsList);

        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should remain unset.');

        for (Contact con : newTestContactsList){
            List<Contact_Language__c> conLangsList = contactLanguagesListByContactId.get(con.Id);
            System.assertEquals(2, conLangsList.size(), 'There should be 2 contact languages associated with each contact (French and English).');

            for (Contact_Language__c conLang : conLangsList){
                if (conLang.Language__c == englishLanguage.Id){
                    System.assertEquals(true, conLang.Primary_Language__c, 'Existing English Contact Language record should be marked as primary.');
                } else {
                    System.assertEquals(true, (conLang.Language__c == frenchLanguage.Id && conLang.Primary_Language__c == false), 'French Contact Language record should not be marked as primary.');
                }
            } 
        }
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterUpdate creates new contact language records for contacts
    * updated with new primary languages and updates to primary existing contact language record for contacts 
    * with matching existing contact language records.
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterUpdateInsertsAndUpdates(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        List<Contact> newTestContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<Contact> oldTestContactsList = new List<Contact>();
        List<Contact_Language__c> contactLanguagesList = new List<Contact_Language__c>();

        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');

        insert newTestContactsList;

        for (Integer i = 0; i < 5; i++){
            if (Math.mod(i,2) == 0){
                Contact_Language__c englishConLang = UTIL_UnitTestData_TEST.getContactLanguage(englishLanguage, newTestContactsList[i], UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c);
                contactLanguagesList.add(englishConLang);
            }
            
            newTestContactsList[i].Primary_Language__c = englishLanguage.Id;

            Contact oldContact = newTestContactsList[i].Clone(false);
            oldContact.Id = newTestContactsList[i].Id;
            oldContact.Primary_Language__c = null;
            oldTestContactsList.add(oldContact);
        }

        insert contactLanguagesList;

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterUpdate((List<SObject>)newTestContactsList, (List<SObject>)oldTestContactsList);
        Test.stopTest();

        List<Contact_Language__c> conLangResultsList = [SELECT Id, 
                                                               Primary_Language__c, 
                                                               Fluency__c,
                                                               Contact__c,
                                                               Language__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :newTestContactsList
                                                        AND Language__c = :englishLanguage.Id];

        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should remain unset.');
        System.assertEquals(5, conLangResultsList.size(), 'There should only be 5 English contact language records.');

        for (Contact_Language__c conLang : conLangResultsList){
            System.assertEquals(true, conLang.Primary_Language__c, 'Each English contact language record should not be marked as primary.');
        }
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterUpdate does not create new contact language records for 
    * contacts updated with primary languages removed and ensures that the previous contact language record is
    * unset as primary.
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterUpdateLanguageRemoved(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        List<Contact> newTestContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<Contact> oldTestContactsList = new List<Contact>();
        List<Contact_Language__c> contactLanguagesList = new List<Contact_Language__c>();

        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');

        insert newTestContactsList;

        for (Contact con : newTestContactsList){
            Contact_Language__c englishConLang = UTIL_UnitTestData_TEST.getContactLanguage(englishLanguage, con, UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c);
            englishConLang.Primary_Language__c = true;

            contactLanguagesList.add(englishConLang);

            con.Primary_Language__c = null;

            Contact oldContact = con.Clone(false);
            oldContact.Id = con.Id;
            oldContact.Primary_Language__c = englishLanguage.Id;
            oldTestContactsList.add(oldContact);
        }

        insert contactLanguagesList;

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterUpdate((List<SObject>)newTestContactsList, (List<SObject>)oldTestContactsList);
        Test.stopTest();

        List<Contact_Language__c> conLangResultsList = [SELECT Id, 
                                                               Primary_Language__c, 
                                                               Fluency__c,
                                                               Contact__c,
                                                               Language__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :newTestContactsList
                                                        AND Language__c = :englishLanguage.Id];

        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should remain unset.');
        System.assertEquals(5, conLangResultsList.size(), 'There should only be 5 English contact language records.');

        for (Contact_Language__c conLang : conLangResultsList){
            System.assertEquals(false, conLang.Primary_Language__c, 'Each English contact language records should not be marked as primary.');
        }
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterUpdate updates existing contact language records when
    * a contact is updated with a corresponding primary language.
    *************************************************************************************************************/ 
    @isTest 
    private static void runAfterUpdatePositive(){
        List<Contact> newTestContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<Contact> oldTestContactsList = new List<Contact>();
        List<Contact_Language__c> contactLanguagesList = new List<Contact_Language__c>();

        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.AfterUpdate;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        insert newTestContactsList;

        for (Contact con : newTestContactsList){
            Contact_Language__c englishConLang = UTIL_UnitTestData_TEST.getContactLanguage(englishLanguage, con, UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c);
            contactLanguagesList.add(englishConLang);

            con.Primary_Language__c = englishLanguage.Id;

            Contact oldContact = con.Clone(false);
            oldContact.Id = con.Id;
            oldContact.Primary_Language__c = null;
            oldTestContactsList.add(oldContact);
        }

        insert contactLanguagesList;

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.run((List<SObject>)newTestContactsList, (List<SObject>)oldTestContactsList, triggerAction, objResult);
        Test.stopTest();

        List<Contact_Language__c> conLangResultsList = [SELECT Id, 
                                                               Primary_Language__c, 
                                                               Fluency__c,
                                                               Contact__c,
                                                               Language__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :newTestContactsList
                                                        AND Language__c = :englishLanguage.Id];

        System.assertEquals(5, conLangResultsList.size(), 'There should only be 5 English contact language records.');

        for (Contact_Language__c conLang : conLangResultsList){
            System.assertEquals(true, conLang.Primary_Language__c, 'Each English contact language records should be marked as primary.');
        }
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterUpdate does not create or update any contact language 
    * when executed from a recursion context.
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterUpdateRecursion(){
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterUpdate(new List<SObject>(), new List<SObject>());
        Test.stopTest();

        System.assertEquals(true, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should remain set.');
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterInsert creates contact language records for newly 
    * inserted contact records with associated primary languages.   
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterInsertWithPrimaryLanguage(){
        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);      
        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');

        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        for (Contact con : testContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }

        insert testContactsList; // increases expected count for conLangResultsList by 5

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterInsert((List<SObject>)testContactsList);
        Test.stopTest();
        
        List<Contact_Language__c> conLangResultsList = [SELECT Id,
                                                               Contact__c,
                                                               Language__c,
                                                               Primary_Language__c,
                                                               Fluency__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :testContactsList];

        System.assertEquals(5, conLangResultsList.size() - 5, 'Each contact record should be associated with 1 new contact language records.');
        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should be unset.');

        for (Contact_Language__c conLang : conLangResultsList){
            System.assertEquals(englishLanguage.Id, conLang.Language__c, 'Each new contact language record should be associated with the English language.');
            System.assertEquals(true, conLang.Primary_Language__c, 'Each new contact language record should be marked as primary.');
            System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, conLang.Fluency__c, 'Each new contact language record should be associated with the default fluency value.');
        }
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterInsert does not create contact language records for newly 
    * inserted contact records when no primary language is specified.   
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterInsertWithoutPrimaryLanguage(){
        SRVC_ContactPrimarylanguage.instance = new STUB_HasNoContactLanguagesToCreate();

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);  
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, false);

        for (Contact con : testContactsList){
            con.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.SObjectType);
            con.Primary_Language__c = null;
        }

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterInsert((List<SObject>)testContactsList);
        Test.stopTest();
        
        List<Contact_Language__c> conLangResultsList = [SELECT Id,
                                                               Contact__c,
                                                               Language__c,
                                                               Primary_Language__c,
                                                               Fluency__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :testContactsList];

        System.assertEquals(true, conLangResultsList.isEmpty(), 'There should be no contact language records created for contacts inserted without a primary language.');
        System.assertEquals(false, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should be remain unset.');
    }

    /************************************************************************************************************
    * @description Test method to verify that handleAfterInsert does not create contact language records for newly 
    * inserted contact records when executed in a recursion context.   
    *************************************************************************************************************/ 
    @isTest 
    private static void handleAfterInsertRecursion(){
        SRVC_ContactPrimaryLanguage.instance = new STUB_HasNoContactLanguagesToCreate();

        List<Contact> testContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);   
        TDTM_ProcessControl.setRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM, true);

        for (Contact con : testContactsList){
            con.Id = UTIL_UnitTestData_TEST.getFakeId(Contact.SObjectType);
            con.Primary_Language__c = null;
        }

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.handleAfterInsert((List<SObject>)testContactsList);
        Test.stopTest();
        
        List<Contact_Language__c> conLangResultsList = [SELECT Id,
                                                               Contact__c,
                                                               Language__c,
                                                               Primary_Language__c,
                                                               Fluency__c
                                                        FROM Contact_Language__c
                                                        WHERE Contact__c IN :testContactsList];

        System.assertEquals(true, conLangResultsList.isEmpty(), 'There should be no contact language records created for contacts inserted without a primary language.');
        System.assertEquals(true, TDTM_ProcessControl.getRecursionFlag(TDTM_ProcessControl.registeredTrigger.CON_PrimaryLanguage_TDTM), 'Recursion flag should remain set.');
    }

    /************************************************************************************************************
    * @description Test method to verify that the run method creates Contact Language records for newly inserted
    * Contacts with associated Primary Languages.
    *************************************************************************************************************/ 
    @isTest 
    private static void runAfterInsertPositive(){
        
        List<Contact> newContactsList = UTIL_UnitTestData_TEST.getMultipleTestContacts(5);
        List<SObject> oldList = new List<SObject>();

        Language__c englishLanguage = UTIL_UnitTestData_TEST.createLanguage('English');
        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.AfterInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;
        
        for (Contact con : newContactsList){
            con.Primary_Language__c = englishLanguage.Id;
        }
        
        insert newContactsList;

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.run((List<SObject>)newContactsList, oldList, triggerAction, objResult);
        Test.stopTest();

        List<Contact_Language__c> conLanguageResultsList = [SELECT Id,
                                                                   Contact__c,
                                                                   Language__c,
                                                                   Primary_Language__c,
                                                                   Fluency__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :newContactsList];

        System.assertEquals(5, conLanguageResultsList.size() - 5, 'There should 1 new contact language record created for each new contact.');

        for (Contact_Language__c conLang : conLanguageResultsList){
            System.assertEquals(englishLanguage.Id, conLang.Language__c, 'Each contact language record should be associated with the English language.');
            System.assertEquals(true, conLang.Primary_Language__c, 'Each new contact language record should be marked as primary.');
            System.assertEquals(UTIL_CustomSettingsFacade.getSettings().Default_Contact_Language_Fluency__c, conLang.Fluency__c, 'Each new contact language record should be associated with the default fluency value.');
        }
    }

    /************************************************************************************************************
    * @description Test method to verify that the run method does not create Contact Language records when no 
    * new contacts are inserted.
    *************************************************************************************************************/ 
    @isTest 
    private static void runAfterInsertNegative(){
        SRVC_ContactPrimaryLanguage.instance = new STUB_HasNoContactLanguagesToCreate();

        List<Contact> newContactsList = new List<Contact>();
        List<SObject> oldList = new List<SObject>();

        TDTM_Runnable.Action triggerAction = TDTM_Runnable.Action.AfterInsert;
        Schema.DescribeSObjectResult objResult = Schema.SObjectType.Contact;

        Test.startTest();
        CON_PrimaryLanguage_TDTM conPrimaryLangTDTM = new CON_PrimaryLanguage_TDTM();
        conPrimaryLangTDTM.run((List<SObject>)newContactsList, oldList, triggerAction, objResult);
        Test.stopTest();

        List<Contact_Language__c> conLanguageResultsList = [SELECT Id,
                                                                   Contact__c,
                                                                   Language__c,
                                                                   Primary_Language__c,
                                                                   Fluency__c
                                                            FROM Contact_Language__c
                                                            WHERE Contact__c IN :newContactsList];

        System.assertEquals(true, conLanguageResultsList.isEmpty(), 'There should no contact language records created.');
    }

    /**************************************************************************************************************************
    *************************************************** HELPER METHODS ********************************************************
    **************************************************************************************************************************/

    /************************************************************************************************************
    * @description Generates a map of containing a list of Contact Language records, sorted by their associated Contact Id.
    * @param  contactLanguagesList A List of Contact Language records to be mapped.
    * @return A Map containing a list of Contact Languages by Contact Id.
    ************************************************************************************************************/
    private static Map<Id, List<Contact_Language__c>> mapContactLanguagesToContact(List<Contact_Language__c> contactLanguagesList){
        Map<Id, List<Contact_Language__c>> contactLanguagesListByContactId = new Map<Id, List<Contact_Language__c>>();
        List<Contact_Language__c> associatedContactLanguagesList;

        for (Contact_Language__c conLang : contactLanguagesList){
            if (contactLanguagesListByContactId.containsKey(conLang.Contact__c)){
                associatedContactLanguagesList = contactLanguagesListByContactId.get(conLang.Contact__c);
            } else {
                associatedContactLanguagesList = new List<Contact_Language__c>();
            }

            associatedContactLanguagesList.add(conLang);
            contactLanguagesListByContactId.put(conLang.Contact__c, associatedContactLanguagesList);
        }
        return contactLanguagesListByContactId;
    }

    /**************************************************************************************************************************
    ****************************************************** STUBS **************************************************************
    **************************************************************************************************************************/
    
    /************************************************************************************************************
    * @description Stub class to simulate the response from SRVC_ContactPrimaryLanguage with no contact language 
    * records to be inserted.
    *************************************************************************************************************/ 
    private class STUB_HasNoContactLanguagesToCreate extends SRVC_ContactPrimaryLanguage {
        @TestVisible 
        public override List<Contact_Language__c> getContactLanguagesToCreate(List<Contact> contactsList){            
            return new List<Contact_Language__c>();
        }
    }
    
}
