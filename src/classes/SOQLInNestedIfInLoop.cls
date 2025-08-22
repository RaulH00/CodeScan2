public class SOQLInNestedIfInLoop {
    public void process(List<Id> ids, Boolean flag) {
        for (Id id : ids) {
            if (flag) {
                if (id != null) {
                    Account a = [SELECT Name FROM Account WHERE Id = :id];
                }
            }
        }
    }
}
