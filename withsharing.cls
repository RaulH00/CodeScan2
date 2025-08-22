public with sharing class AccountController {
    
    // Method to get accounts visible to the current user
    public List<Account> getAccounts() {

        // This query will respect the current user's sharing rules
        return [SELECT Id, Name FROM Account];

    }
    
    // Method to update an account
    public void updateAccount(Account acc) {
        try {
            update acc; // This update operation will respect the current user's sharing rules
        } catch (DmlException e) {
            System.debug('Error updating account: ' + e.getMessage());
        }
    }

    public List<Account> getAccounts1() {

            // This query will respect the current user's sharing rules
            return [SELECT Id, Name FROM Account];

        }
}
 public void deleteAccount(Id accountId) {
        Account accToDelete = [SELECT Id FROM Account WHERE Id = :accountId];
        try {
            delete accToDelete; // This delete operation will bypass the current user's sharing rules
        } catch (DmlException e) {
            System.debug('Error deleting account: ' + e.getMessage());
        }
    }
}
