public without sharing class Feb001 extends Feb2 {
    // Constructor
    public Feb001() {
        // Initialization code (if needed)
    }

    // Sample method to get a greeting
    public String getGreeting(String name) {
        return 'Hello, ' + name + '!';
    }

    // Sample method to perform a calculation
    public Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }

    // Example of an overridden method from Feb2 (if applicable)
    // Assuming Feb2 has a method called displayInfo
    public override String displayInfo() {
        return 'This is Feb001 extending Feb2.';
    }
}
