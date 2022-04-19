@isTest public class TestDataFactory{
    public static List<Account> createAccounts(integer creaAcc, boolean doInsert){
        List<Account> newAccoun = new List<Account>();
        for(integer i=1; i<=creaAcc; i++){
            Account a = new Account(name = 'Factory Account #' + i);
            newAccoun.add(a);
        }
        if(doInsert){
            insert newAccoun;
        }
        return newAccoun;
    }
    public static void createOpportunities(List<Account> accList, Integer oppCount, Boolean doInsert){
        List<Opportunity> listOpp = new List<Opportunity>();
        for(Account acc : accList){
            for(Integer i=1; i<=oppCount; i++){
                Opportunity opp = new Opportunity();
                opp.name = acc.name + ' Opportunity #' + i;

            }
        }
    }
}
