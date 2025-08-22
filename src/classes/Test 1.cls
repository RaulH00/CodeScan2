// Class with "with sharing"
public with sharing class ClassWithSharing {
    public void execute() {
        Account[] accounts = [SELECT Id, Name FROM Account LIMIT 10];
        System.debug('With Sharing: ' + accounts);
    }
}

// Class with "without sharing"
public without sharing class ClassWithoutSharing {
    public void execute() {
        Account[] accounts = [SELECT Id, Name FROM Account LIMIT 10];
        System.debug('Without Sharing: ' + accounts);
    }
}

// Class with "inherited sharing"
public inherited sharing class ClassInheritedSharing {
    public void execute() {
        Account[] accounts = [SELECT Id, Name FROM Account LIMIT 10];
        System.debug('Inherited Sharing: ' + accounts);
    }
}

// Class with no sharing
public class SharingController {
    public void demonstrate() {
    
    }
}
