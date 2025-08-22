public class Foo
{
    public void openIfElse (Integer x)     //This does not have any logic to handle more than 2 cases of x
    {
        if (x == 0)
        {
            doSomeStuff ();
        }
        else if (x == 1)
        {
            doSomeOtherStuff ();
        }
    }
    public void handledIfElse (Integer x)     //This will allow any value of x to be handled
    {
        if (x == 0)
        {
            doSomeStuff ();
        }
        else if (x == 1)
        {
            doSomeOtherStuff ();
        }
        else
        {
            handleTheUnexpectedResult ();
        }
    }
}
