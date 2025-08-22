public class BulkifiedSOQLOutsideLoop {
    public void fetch(List<Id> ids) {
        Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :ids]);
        for (Id id : ids) {
            System.debug(accMap.get(id));
        }
    }
}
