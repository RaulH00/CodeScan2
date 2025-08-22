public class SOQLInTryCatchInLoop {
    public void tryCatchTest(List<Id> ids) {
        for (Id id : ids) {
            try {
                Account a = [SELECT Name FROM Account WHERE Id = :id];
            } catch (Exception e) {
                System.debug('Error');
            }
        }
    }
}
