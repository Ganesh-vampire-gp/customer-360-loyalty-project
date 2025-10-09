public class OrderTriggerHandler {

    public static void handleAfterUpdate(List<Order> newOrders, Map<Id, Order> oldOrderMap) {
        List<Loyalty_Member__c> membersToUpdate = new List<Loyalty_Member__c>();
        List<Loyalty_Points_History__c> historyToInsert = new List<Loyalty_Points_History__c>();

        // Collect Contact IDs from Orders (custom field)
        Set<Id> contactIds = new Set<Id>();
        for(Order ord : newOrders){
            Order oldOrd = oldOrderMap.get(ord.Id);

            // Only process if status changed to Activated
            if(ord.Status == 'Activated' && oldOrd.Status != 'Activated' && ord.Contact__c != null){
                contactIds.add(ord.Contact__c);
            }
        }

        // Fetch Loyalty Members linked to these contacts
        Map<Id, Loyalty_Member__c> contactToMember = new Map<Id, Loyalty_Member__c>();
        for(Loyalty_Member__c lm : [
            SELECT Id, Contact__c, Loyalty_Points_Balance__c 
            FROM Loyalty_Member__c 
            WHERE Contact__c IN :contactIds
        ]){
            contactToMember.put(lm.Contact__c, lm);
        }

        // Process orders
        for(Order ord : newOrders){
            Order oldOrd = oldOrderMap.get(ord.Id);

            if(ord.Status == 'Activated' && oldOrd.Status != 'Activated' && ord.Contact__c != null){
                Integer pointsToAdd = (ord.TotalAmount != null) ? Integer.valueOf(Math.floor(ord.TotalAmount / 100)) : 0;

                // If Loyalty Member exists
                if(contactToMember.containsKey(ord.Contact__c)){
                    Loyalty_Member__c member = contactToMember.get(ord.Contact__c);
                    member.Loyalty_Points_Balance__c = (member.Loyalty_Points_Balance__c != null ? member.Loyalty_Points_Balance__c : 0) + pointsToAdd;
                    membersToUpdate.add(member);

                    // Create History record
                    Loyalty_Points_History__c history = new Loyalty_Points_History__c(
                        Loyalty_Member__c = member.Id,
                        Points_Added__c = pointsToAdd,
                        Order__c = ord.Id,
                        Reason__c = 'Order Activated'
                    );
                    historyToInsert.add(history);
                }
            }
        }

        if(!membersToUpdate.isEmpty()){
            update membersToUpdate;
        }
        if(!historyToInsert.isEmpty()){
            insert historyToInsert;
        }
    }
}