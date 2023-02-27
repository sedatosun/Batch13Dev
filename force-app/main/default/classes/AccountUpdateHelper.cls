public class AccountUpdateHelper {
    //invocableMethod annotation helps us to call apex via flows or PB
    @InvocableMethod
    public static void updateWebsite(list<id> accountIds) {
        list<account> listAccounts = [select id, website from account where id in: accountIds];
        for (account eachAcc : listAccounts) {
            eachAcc.Website = 'www.softinnovas.com';
        }
        update listAccounts;
    }
}