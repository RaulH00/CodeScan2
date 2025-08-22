    static String getToken() {
        Application_Settings__c appSetting = Application_Settings__c.getInstance('ZoomApplicationId');
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Zoom_OAuth');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setHeader('Host', 'zoom.us');
        request.setHeader('Authorization', 'Basic {!$Credential.AuthorizationHeaderValue}');
try {
    // Your code that might throw an exception
    Integer result = 10 / 0; // This will throw an ArithmeticException
} catch (ArithmeticException e) {
    // Catching and handling a specific exception
    System.debug('ArithmeticException occurred: ' + e.getMessage());
} catch (Exception e) {
    // Catching other exceptions
    System.debug('An exception occurred: ' + e.getMessage());
} finally {
    // Code that will always execute, regardless of whether an exception occurred or not
    System.debug('Finally block executed');
}

    }
