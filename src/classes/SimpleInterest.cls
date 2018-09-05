public class SimpleInterest 
{
	public static void simpleInterest() 
    {
        integer principal;
        double simple, rate, year;
        
        principal = 1000;
        rate = 0.1;
        year = 2;
        simple = (principal * rate * year);
        
        System.debug('Simple Interest = ' + simple);
    }
}