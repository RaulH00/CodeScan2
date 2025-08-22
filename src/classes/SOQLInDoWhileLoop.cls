public class SOQLInDoWhileLoop {
    public void fetchDoWhile(List<Id> ids) {
        Integer i = 0;
        do {
            Account a = [SELECT Name FROM Account WHERE Id = :ids[i]];
            i++;
        } while (i < ids.size());
    }
}
