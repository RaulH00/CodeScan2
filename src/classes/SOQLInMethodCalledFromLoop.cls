public class SOQLInMethodCalledFromLoop {
    public void loop(List<Id> ids) {
        for (Id id : ids) {
            fetch(id);
        }
    }

    public void fetch(Id id) {
        Account a = [SELECT Name FROM Account WHERE Id = :id];
    }
}
