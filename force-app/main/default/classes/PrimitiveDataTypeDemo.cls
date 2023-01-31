public class PrimitiveDataTypeDemo {
    public void printBasicDataType(){
        string batchName = 'Batch 13';
        integer totalCandidates = 50;
        boolean isAdminCompleted = true;

        string batchDescription = batchName + ' are the best, yes?';
        system.debug(batchDescription);
        system.debug('total candidates ' + totalCandidates);
        Decimal dec = 55.49;
        system.debug('decimal value => ' + dec);

        Long lng = 154987464L;
        system.debug('long value => ' + lng);

        Object obj1 = 'this is string';
        Object obj2 = 55;
        Object obj3 = true;
        system.debug('obj1 value => ' + obj1);

        ID conId = '0038d00000OtDjvAAF';
        system.debug('id is ' + conId);
    }
}