public class SOQLInTryCatchOutsideLoop {
    public void fetch() {
        try {
            Account a = [SELECT Name FROM Account LIMIT 1];
        } catch (Exception e) {
            System.debug(e);
        }
    }
}
