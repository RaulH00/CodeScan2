public interface SOQLInterface {
    Account getAccount();
}

public class SOQLInterfaceImpl implements SOQLInterface {
    public Account getAccount() {
        return [SELECT Name FROM Account LIMIT 1];
    }
}
