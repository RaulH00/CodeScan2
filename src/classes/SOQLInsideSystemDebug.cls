public class SOQLInsideSystemDebug {
    public void debugInsideLoop(List<Id> ids) {
        for (Id id : ids) {
            System.debug([SELECT Name FROM Account WHERE Id = :id]);
        }
    }
}
