public with sharing class OpportunityService {
    public static List<Opportunity> getOpportunitiesByAccountId(Id accountId){
            List<Opportunity> oppList = [
                SELECT Name, AccountId, Amount, StageName, CloseDate
                FROM Opportunity
                WHERE AccountId = :accountId
                ORDER BY StageName, CloseDate DESC
            ];
            for(Opportunity oppResults : oppList){
                System.debug('Opportunity: ' + oppResults);
            }
            return oppList;
    }
}