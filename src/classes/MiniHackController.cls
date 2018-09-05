public class MiniHackController {
    
    public Boolean cbox1 {get; set;}
    public Boolean cbox2 {get; set;}
    
    public MiniHackController() {
        
        cbox1 = true;
        cbox2 = false;
    }
    
    public PageReference refresh() {
        return null;
    }
    
}