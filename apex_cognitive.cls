public class OpportunityProcessor {
    public void processOpportunities(List<Opportunity> opportunities) {
        for (Opportunity opp : opportunities) {
            processOpportunity(opp);
        }
    }

    private void processOpportunity(Opportunity opp) {
        if (isValidOpportunity(opp)) {
            updateOpportunityStage(opp);
            assignToOwner(opp);
        } else {
            handleInvalidOpportunity(opp);
        }
    }

    private Boolean isValidOpportunity(Opportunity opp) {
        return opp.Amount > 0 && opp.CloseDate != null;
    }

    private void updateOpportunityStage(Opportunity opp) {
        if (opp.StageName == 'Prospecting') {
            opp.StageName = 'Qualification';
        } else if (opp.StageName == 'Qualification') {
            opp.StageName = 'Needs Analysis';
        }
    }

    private void assignToOwner(Opportunity opp) {
        if (opp.OwnerId == null) {
            opp.OwnerId = getDefaultOwnerId();
        }
    }

    private void handleInvalidOpportunity(Opportunity opp) {
        // Handle invalid opportunities (e.g., log an error, send a notification, etc.)
        System.debug('Invalid Opportunity: ' + opp.Id);
    }

    private Id getDefaultOwnerId() {
        // Return the default owner Id for unassigned opportunities
        User defaultOwner = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];
        return defaultOwner.Id;
    }
}
