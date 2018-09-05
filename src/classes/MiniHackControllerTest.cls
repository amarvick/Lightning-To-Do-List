@isTest
public class MiniHackControllerTest {
    public static testMethod void testMyController() {
            PageReference pageRef = Page.MiniHack;
            Test.setCurrentPage(pageRef);
          
            MiniHackController controller = new MiniHackController();
            boolean testBool = controller.cbox1;
           
            System.assertEquals(true, testBool);
        
            controller.cbox1 = false;
            controller.refresh();
            testBool = controller.cbox1;
        
            System.assertEquals(false, testBool);
        }
        
}