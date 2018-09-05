public virtual class Animal
{
    public String name;
    public String breed;
    public integer age;

    public void run()
    {
        System.debug(name + ' is running!');
    }

    public Virtual void speak()  
    {
        System.debug(name + ' is speaking');
    }
}