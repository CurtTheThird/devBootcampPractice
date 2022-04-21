@isTest 
public class OpportunityServiceTest {
    @TestSetup
    private static void createTestData(){
        Account[] accList = TestDataFactory.createAccounts(5, true);
        Opportunity[] oppList = TestDataFactory.createOpportunities(accList, 6, true);
        Integer accNum = [SELECT COUNT() FROM Account];
        Integer oppNum = [SELECT COUNT(Opportunity) FROM Account];
        System.assertEquals(5, accNum,'Count of records should be equal account input.');
        System.assertEquals(30, oppLNum,'Count of records should be equal to opps per acc x # of accounts.');
    }
    @isTest
    private static void getOpportunitiesById(){
        
    }
}
