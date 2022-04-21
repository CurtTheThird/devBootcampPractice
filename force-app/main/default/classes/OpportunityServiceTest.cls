@isTest
private class OpportunityServiceTest {
    @TestSetup
    private static void createTestData(){
        Account[] accList = TestDataFactory.createAccounts(5, true);
        Opportunity[] oppList = TestDataFactory.createOpportunities(accList, 6, true);
        Integer accNum = [SELECT COUNT() FROM Account];
        Integer oppNum = [SELECT COUNT() FROM Opportunity];
        System.assertEquals(5, accNum,'Count of records should be equal account input.');
        System.assertEquals(30, oppNum,'Count of records should be equal to opps per acc x # of accounts.');
    }

    @isTest private static void getOpportunitiesById(){
        List<Account> oppsFromAcc = [
            SELECT Name, Id, (SELECT Name, StageName, CloseDate FROM Opportunities ORDER BY StageName, CloseDate DESC)
            FROM Account
            LIMIT 1
        ];
        System.assert(oppsFromAcc.size() == 1, 'Confirming only 1 Account');
        List<Opportunity> oppListFromAcc = OpportunityService.getOpportunitiesByAccountId(oppsFromAcc[0].Id);
        System.assertEquals(oppsFromAcc[0].Opportunities.size(), oppListFromAcc.size(), 'Confirming test and get count of accounts are equal');
        for(Integer i=0; i<oppListFromAcc.size(); i++){
            System.assertEquals(oppsFromAcc[0].Id, oppListFromAcc[i].AccountId, 'Expecting AccountId to match');
            System.assertEquals(oppsFromAcc[0].Opportunities[i].StageName, oppListFromAcc[i].StageName, 'Expecting StageName to match');
            System.assertEquals(oppsFromAcc[0].Opportunities[i].CloseDate, oppListFromAcc[i].CloseDate, 'Expecting CloseDate to match');
        }
    }
}