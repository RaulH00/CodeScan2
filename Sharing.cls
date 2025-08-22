public with sharing class SharingController {
    
    // Method to get a list of accounts visible to the current user
    public List<Account> getVisibleAccounts() {
        // Query accounts that the current user has access to
        return [SELECT Id, Name FROM Account];
    }

    // Method to update a specific account
    public void updateAccount(Account acc) {
        try {
            update acc; // This will respect sharing rules because of 'with sharing'
        } catch (DmlException e) {
            System.debug('Error updating account: ' + e.getMessage());
        }
    }
    
    // Method to delete a specific account
    public void deleteAccount(Id accountId) {
        Account accToDelete = [SELECT Id FROM Account WHERE Id = :accountId];
        try {
            delete accToDelete; // This will also respect sharing rules
        } catch (DmlException e) {
            System.debug('Error deleting account: ' + e.getMessage());
        }
    }
}
