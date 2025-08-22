public class SOQLInMethodNotCalledFromLoop {
    public void execute() {
        Account a = [SELECT Name FROM Account LIMIT 1];
    }
}
