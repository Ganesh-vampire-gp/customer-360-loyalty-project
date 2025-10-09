@isTest
public class OrderTriggerHandlerTest {

    @testSetup
    static void setupData() {
        // Create Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Create Contact
        Contact con = new Contact(
            LastName = 'Ramesh',
            Email = 'ramesh@example.com',
            AccountId = acc.Id
        );
        insert con;

        // Create Loyalty Member linked to Contact
        Loyalty_Member__c member = new Loyalty_Member__c(
            Contact__c = con.Id,
            Loyalty_Points_Balance__c = 0
        );
        insert member;

        // Create Product
        Product2 prod = new Product2(Name = 'Test Product', IsActive = true);
        insert prod;

        // Get Standard Pricebook
        Pricebook2 pb = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];

        // Create Pricebook Entry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = pb.Id,
            Product2Id = prod.Id,
            UnitPrice = 100,
            IsActive = true
        );
        insert pbe;

        // Create Order
        Order ord = new Order(
            AccountId = acc.Id,
            Status = 'Draft',
            EffectiveDate = Date.today(),
            Contact__c = con.Id
        );
        insert ord;

        // Add Order Item to calculate TotalAmount
        OrderItem oi = new OrderItem(
            OrderId = ord.Id,
            PricebookEntryId = pbe.Id,
            Quantity = 20,
            UnitPrice = 100
        );
        insert oi;
    }

    @isTest
    static void testOrderActivationUpdatesLoyalty() {
        Order ord = [SELECT Id, Status, Contact__c FROM Order LIMIT 1];
        ord.Status = 'Activated';
        update ord;

        Loyalty_Member__c member = [SELECT Id, Loyalty_Points_Balance__c FROM Loyalty_Member__c WHERE Contact__c = :ord.Contact__c LIMIT 1];
        System.assertEquals(20, member.Loyalty_Points_Balance__c, 'Loyalty points should be updated (2000/100 = 20).');

        Loyalty_Points_History__c hist = [SELECT Id, Points_Added__c, Reason__c FROM Loyalty_Points_History__c WHERE Loyalty_Member__c = :member.Id LIMIT 1];
        System.assertEquals(20, hist.Points_Added__c, 'History should log same points.');
        System.assertEquals('Order Activated', hist.Reason__c, 'Reason should match.');
    }

    @isTest
    static void testNoUpdateWhenNotActivated() {
        Order ord = [SELECT Id, Status, Contact__c FROM Order LIMIT 1];
        ord.Status = 'Draft';
        update ord;

        Loyalty_Member__c member = [SELECT Id, Loyalty_Points_Balance__c FROM Loyalty_Member__c WHERE Contact__c = :ord.Contact__c LIMIT 1];
        System.assertEquals(0, member.Loyalty_Points_Balance__c, 'Points should not change if status not Activated.');
    }
}