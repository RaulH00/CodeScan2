public class CreateMetadata{
  public void updateAndDeployMetadata() {
    // Setup custom metadata to be created in the subscriber org.
    Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
    customMetadata.fullName = 'ISVNamespace__MetadataTypeName.MetadataRecordName';

    Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
    customField.field = 'customField__c';
    customField.value = 'New value';

    customMetadata.values.add(customField);

    Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
    mdContainer.addMetadata(customMetadata);

    // Setup deploy callback, MyDeployCallback implements
    // the Metadata.DeployCallback interface (code for
    // this class not shown in this example)
    MyDeployCallback callback = new MyDeployCallback();

    // Enqueue custom metadata deployment
    Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
  }
}