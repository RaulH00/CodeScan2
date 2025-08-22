{ public with sharing class ContactAccessWithSharing \{\
\
    public static void updateMobileNumbers() \{\
        // Accessing sensitive field without FLS check\
        List<Contact> contacts = [\
            SELECT Id, FirstName, LastName, MobilePhone\
            FROM Contact\
            WHERE MobilePhone != null\
        ];\
\
        for (Contact con : contacts) \{\
            // Direct access without checking field-level security\
            con.MobilePhone = '999-999-9999';\
        \}\
\
        update contacts;\
    \}\
\}\
}