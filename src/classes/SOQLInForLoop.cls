public class SOQLInForLoop {
    public void fetchAccounts(List<Id> ids) {
        for (Id id : ids) {
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :id];
        }
    }
}
