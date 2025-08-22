
public class StringReplaceExample {
    public static void main(String[] args) {
        String init = "Bob is a Bird... Bob is a Plane... Bob is Superman!";
String changed = init.replaceAll("Bob is", "It's"); // Noncompliant
changed = changed.replaceAll("\\.\\.\\.", ";"); // Noncompliant
        String original = "Hello, 123, world!";
        String replaced1 = original.replace("123", "Java");
        System.out.println(replaced); // Output: "Hello, Java, world!"
    }
}   

