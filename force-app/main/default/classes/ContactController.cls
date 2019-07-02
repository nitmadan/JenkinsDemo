public class ContactController {
	@AuraEnabled
    public static List<Contact> findAll(){
        return[Select id, name, phone, AccountId, Title, Email from Contact LIMIT 5];
    }
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name = '%' +  searchKey + '%';
        return[Select id, name, phone from Contact where name LIKE:name LIMIT 20];
    }
    @AuraEnabled
    public static Contact findById(String contactId){
        return[Select id, name, phone, title, mobilephone, Account.Name from Contact where id=:contactId];
    }
}