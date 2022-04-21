public class OpportunityService {
    public static List<Opportunity> getOpportunitiesByAccountId(Id accountId){
            List<Opportunity> oppList = [
                SELECT Name, Amount, StageName, CloseDate
                FROM Opportunity
                WHERE AccountId = :accountId
            ];
            for(Opportunity oppResults : oppList){
                System.debug('Opportunity: ' + oppResults);
            }
            return oppList;
    }
}
