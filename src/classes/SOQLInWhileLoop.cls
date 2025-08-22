public class SOQLInWhileLoop {
    public void fetchWhile(List<Id> ids) {
        Integer i = 0;
        while (i < ids.size()) {
            Account a = [SELECT Name FROM Account WHERE Id = :ids[i]];
            i++;
        }
    }
}
