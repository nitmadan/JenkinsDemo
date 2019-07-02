public class accountController {
	@AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id, Name FROM Account];
    }
}