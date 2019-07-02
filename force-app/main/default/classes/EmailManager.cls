public class EmailManager {
	//public method
    public static void sendMail(String address, String subject, String body){
        //create and email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built in sendEmail method of the messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail });
        // call a helper method to inspect the returned results
        inspectResults(results);
    }
    
    // Helper Method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        
        //sendEmail returns an array of results objects.
        //Iterate through the list of inspect result
        //In this class, the methods only send one email.
        //so we should have only one result.
        
        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                System.debug('Email sent successfully');
            }
            else{
                sendResult = false;
                System.debug('The following errors occurred');
            }
        }
        
        return sendResult;
    }
}