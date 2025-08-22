public class CreateMetadata{
  public void updateAndDeployMetadata() {
    Metadata.DeployContainer container = new Metadata.DeployContainer();

    for (XYZ_Trigger handler :[SELECT Id, Mlab, DName, BParm__c, BARCalls__c FROM XYZ_Trigger]) {
        Metadata.CustomMetadata customMetadata = new Metadata.CustomMetadata();
        customMetadata.fullName = 'BTrigger_Registration.' + handler.DName;
        customMetadata.label = handler.Mlab;

        Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
        customField.field = 'BTriggerParms__c'; //the custom field API Name that you're wanting to insert/update a value of
        customField.value = handler.BParm__c;
        customMetadata.values.add(customField);

        customField = new Metadata.CustomMetadataValue();
        customField.field = 'BARClass__c'; //the custom field API Name that you're wanting to insert/update a value of
        customField.value = handler.BARCalls__c;
        customMetadata.values.add(customField);

        container.addMetadata(customMetadata);
    }

    Metadata.Operations.enqueueDeployment(container, new BTriggerHMCallback());
  }
}