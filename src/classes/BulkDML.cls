public class BulkDmlAsSystem {
    public static void runAll() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Bulk Account 1'),
            new Account(Name = 'Bulk Account 2')
        };

        INSERT AS SYSTEM accounts;

        for (Account acc : accounts) {
            acc.Name += ' - Updated';
        }

        UPDATE AS SYSTEM accounts;
        DELETE AS SYSTEM accounts;
        UNDELETE AS SYSTEM accounts;
    }
}

