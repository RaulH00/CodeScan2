public class StringExample {

    public static void demonstrateStringOperations() {
        // Initialize a string
        String greeting = 'Hello, Salesforce!';

 //  String concatenation
        String name = 'John';
        String personalizedGreeting = greeting + ' Welcome, ' + name + '!';
        System.debug('Personalized Greeting: ' + personalizedGreeting);
}
