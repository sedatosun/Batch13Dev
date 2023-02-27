@isTest //this is FOR CLASS
public class CalculatorAgainTest {
    //Test class can be public or private.
    //Test class MUST BE VOID.
    //void mandatory.
    //NO parameters. None.
    //@isTest annotation

    @isTest //THIS IS FOR METHOD
    private static void testMethod1() {
        //we can call a parameterized method of other class.
        CalculatorAgain c = new CalculatorAgain();
        c.welcomeMessage();
        c.printNewMessage('print this from test class');
    }
    @isTest
    private static void testAdd1() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(10, 8);
        //asserts, assertion
        system.assertEquals(18, sum);
    }
    @isTest
    private static void testAdd2() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(10, 8, 10);
        //asserts, assertion
        system.assertEquals(28, sum);
    }
    @isTest
    private static void testMethod2() {
        CalculatorAgain c = new CalculatorAgain();
        string msg = c.printAndReturnMessage('Annotations');
        system.assertEquals('Annotations...ok cool', msg);
    }
}