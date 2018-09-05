public class StringArrayTest {
    public static String[] generateStringArray(integer length) {
        String[] values = new List<String>();
        for (integer i = 0; i < length; i++) {
            values.add('Test ' + i);
        }   
        return values;
    }
}