public class SOQLInConstructorCalledFromLoop {
    public SOQLInConstructorCalledFromLoop(Id id) {
        Account a = [SELECT Name FROM Account WHERE Id = :id];
    }

    public static void create(List<Id> ids) {
        for (Id id : ids) {
            new SOQLInConstructorCalledFromLoop(id);
        }
    }
}
