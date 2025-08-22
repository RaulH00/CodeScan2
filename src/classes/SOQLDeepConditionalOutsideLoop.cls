public class SOQLDeepConditionalOutsideLoop {
    public void fetch(Boolean condition) {
        if (condition) {
            if (true) {
                if ('x' == 'x') {
                    Account a = [SELECT Name FROM Account LIMIT 1];
                }
            }
        }
    }
}
