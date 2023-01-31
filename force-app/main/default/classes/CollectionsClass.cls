public class CollectionsClass {
    public static string listaAssignment(integer a){
        List<string> LstMonth = new List<string>();
        LstMonth.add('January');
        LstMonth.add('February');
        LstMonth.add('March');
        LstMonth.add('April');
        LstMonth.add('May');
        LstMonth.add('June');
        LstMonth.add('July');
        LstMonth.add('August');
        LstMonth.add('September');
        LstMonth.add('October');
        LstMonth.add('November');
        LstMonth.add('December');

        string outputMonth = '';
        if (a >= 0 && a < LstMonth.size()) {
            outputMonth = LstMonth[a];
        } else {
            outputMonth = 'Not a valid month';
        }
        return outputMonth;
    }
}