public class AtLeastOneConstructorViolation {

    public void calculateTotal(Integer a, Integer b) {
        Integer total = a + b;
        System.debug('Total: ' + total);
    }

    public String greetUser(String name) {
        return 'Hello, ' + name;
    }
}
