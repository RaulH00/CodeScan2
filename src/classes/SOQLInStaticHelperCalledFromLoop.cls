public class SOQLInStaticHelperCalledFromLoop {
    public static void execute(List<Id> ids) {
        for (Id id : ids) {
            Helper.getAccount(id);
        }
    }

    public class Helper {
        public static Account getAccount(Id id) {
            return [SELECT Name FROM Account WHERE Id = :id];
        }
    }
}
