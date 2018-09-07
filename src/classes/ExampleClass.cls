public class ExampleClass {

    public String theStringMethod { get; set; }
    public String theString    {get; set;}
    
    public ExampleClass() {
        this.theString = 'This is a string';
    }
    
    public static void main() {
        Book__c book1 = new Book__c();
        book1.Author__c = 'Alex Marvick';
        book1.Name = 'The Book';
        
        insert book1;
        update book1;
        delete book1;
    }
    
    public String theStringMethod() {
        String theString = 'This is a string';
        return theString;
    }
}