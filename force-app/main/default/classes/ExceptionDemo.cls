public class ExceptionDemo {
    public static void divideNumbers() {
        try {
            Integer num = 10;
            Integer result = num / 0;
            System.debug('Result: ' + result);
        }
        catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            System.debug('Type: ' + e.getTypeName());
        }
    }
}