public void correct() {
        String name = '\\'DEV\\' OR Name LIKE \\'INT%\\''; // includes SOQL injection
 
        String baseQuery = 'SELECT Id, Name FROM copado__Environment__c  WHERE Name = ';
        String safeName = '\\''+String.escapeSingleQuotes(name)+'\\'';
        String query3 = baseQuery+safeName;  // This protects against SOQL injection
        System.debug('selectByName2: query3='+query3);
        List<copado__Environment__c> records3 = Database.query(query3); // CORRECT - This is safe
        System.debug('selectByName2: records3='+records3.size());
        List<copado__Environment__c> records3a = Database.query(baseQuery+name); // CORRECT SOQL Injection possiblecodescan(sf:SOQLInjection)
        System.debug('selectByName2: records3a='+records3a.size());
    }  
 
    public void falseNegative() {
        String name = '\\'DEV\\' OR Name LIKE \\'INT%\\''; // includes SOQL injection
 
        String baseQuery = 'SELECT Id, Name FROM copado__Environment__c  WHERE Name = ';
        String safeName = '\\''+String.escapeSingleQuotes(name)+'\\'';
        String safeQuery = baseQuery+safeName;  // This protects against SOQL injection
        System.debug('selectByName2: safeQuery='+safeQuery);
        List<copado__Environment__c> records3 = Database.query(safeQuery); // CORRECT - this is safe
        System.debug('selectByName2: records3='+records3.size());
        List<copado__Environment__c> records3a = Database.query(baseQuery+name); // FALSE NEGATIVE
        System.debug('selectByName2: records3a='+records3a.size());
 
    }  

     // Dynamic query with FFLIB - FALSE POSITIVE FOR SOQL INJECTION
    public List<copado__Environment__c> selectByName2() {
        // String name= 'Derek';
        String name = '\\'DEV\\' OR Name LIKE \\'INT%\\''; // includes SOQL injection
        sbgplatform.fflib_QueryFactory fieldQueryFactory = newQueryFactory (
            false, // Include Field Set Fields
            true, // Enforce CRUD
            true // Enforce FLS
        );
        fieldQueryFactory.setCondition('Name = \\''+String.escapeSingleQuotes(name)+'\\'');  // This protects against SOQL injection
 
        String safeQuery = FieldQueryFactory.toSOQL();
        List<copado__Environment__c> records = Database.query(safeQuery); // FALSE POSITIVE - SOQL Injection possiblecodescan(sf:SOQLInjection)
        System.debug('selectbyName2: records='+records.size());
 
        return null;
    }

