public class HighCognitiveComplexity {
    public static void complexMethod(String input) {
        // Initialize variables
        List<Map<String, List<Map<String, Object>>>> complexList = new List<Map<String, List<Map<String, Object>>>>();
        Map<String, List<Map<String, Object>>> mapItem;
        List<Map<String, Object>> nestedList;
        Map<String, Object> innerMap;

        // Populate the complex data structure
        for (Integer i = 0; i < 5; i++) {
            mapItem = new Map<String, List<Map<String, Object>>>();
            nestedList = new List<Map<String, Object>>();
            for (Integer j = 0; j < 3; j++) {
                innerMap = new Map<String, Object>();
                for (Integer k = 0; k < 4; k++) {
                    innerMap.put('Key' + k, i * j * k == 0 ? 'A' : i * j * k);
                }
                nestedList.add(innerMap);
            }
            mapItem.put('OuterKey' + i, nestedList);
            complexList.add(mapItem);
        }

        // Process the complex data structure
        Integer sum = 0;
        for (Map<String, List<Map<String, Object>>> outerMap : complexList) {
            for (String outerKey : outerMap.keySet()) {
                List<Map<String, Object>> innerList = outerMap.get(outerKey);
                for (Map<String, Object> innerMapItem : innerList) {
                    for (String innerKey : innerMapItem.keySet()) {
                        Object value = innerMapItem.get(innerKey);
                        if (value instanceof Integer && (Integer)value % 2 == 0) {
                            sum += (Integer)value;
                        } else if (value instanceof String) {
                            sum += ((String)value).length();
                        }
                    }
                }
            }
        }

        // Additional processing using switch and ternary operator
        Integer finalResult;
        switch on input {
            when 'ADD' {
                finalResult = sum + 10;
            }
            when 'SUBTRACT' {
                finalResult = sum - 10;
            }
            when else {
                finalResult = sum * 2;
            }
        }

        // Recursive method call
        Integer recursiveResult = recursiveSum(finalResult, 3);

        // Complex ternary operations and nested conditional logic
        String resultMessage = (recursiveResult > 50) 
            ? (recursiveResult % 2 == 0 
                ? 'Result is greater than 50 and even' 
                : 'Result is greater than 50 and odd') 
            : (recursiveResult % 2 == 0 
                ? 'Result is 50 or less and even' 
                : 'Result is 50 or less and odd');

        System.debug(resultMessage + ': ' + recursiveResult);
    }

    // Recursive method to add complexity
    public static Integer recursiveSum(Integer value, Integer times) {
        if (times == 0) {
            return value;
        } else {
            return value + recursiveSum(value, times - 1);
        }
    }
}
