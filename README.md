MyEcommerce Customer-360-Loyalty Salesforce Project
📌 Overview

The MyEcommerce Salesforce Project is a complete Salesforce CRM implementation that simulates an e-commerce loyalty program.
It covers end-to-end flows, automation, and console experience for Support Agents and Managers.

This project was built as part of a Salesforce training/learning journey and demonstrates:

Custom Objects & Relationships

Flows & Automations

Validation Rules

Approval Processes

Reports & Dashboards

Apex Triggers and Classes

VS Code & GitHub Integration

🚀 Features Implemented
🔹 Phase 1: Data Model & Custom Objects

Created Loyalty_Member__c, Reward_Redemption__c, Loyalty_Points_History__c, Loyalty_Transaction__c, Error_Log__c.

Added custom fields like Loyalty_Points_Balance__c, Reward_Name__c, Amount__c, etc.

Established relationships with Contact & Order.

🔹 Phase 2: Flows & Automations

Add Loyalty Points on Order Activation (Record-Triggered Flow).

Claim Reward Portal Flow for users to redeem points.

Inactive Customer Reengagement Flow with email alerts.

Sync Loyalty Tier to Contact Flow.

Error Logging Flow to capture flow errors.

🔹 Phase 3: Validation Rules

Prevent negative loyalty points.

Require tier when points exist.

Redemption amount must be positive.

🔹 Phase 4: Approval Processes

Contact Manager Approval (Contact object).

High-Value Reward Redemption Approval (Reward_Redemption__c object).

🔹 Phase 5: Apex Code

OrderTriggerHandler.cls → Adds loyalty points when orders are activated.

OrderTrigger.trigger → Calls handler logic.

Unit tests created for trigger handler.

🔹 Phase 6: Profiles & Permission Sets

Support Agent Profile → Access to case & loyalty management.

Support Manager Profile → Additional approval permissions.

Case Team Lead Access Permission Set.

Experience Profile Manager Permission Set.

🔹 Phase 7: Support Agent Console

Configured a Console App with:

Orders, Loyalty Members, Cases.

Related lists and record detail views.

🔹 Phase 8: Reports & Dashboards

Reports created:

Inactive Customers Reengaged

Reward Redemptions by Status

Loyalty Points Balance by Member

Orders Driving Loyalty Points

Loyalty Members by Tier

Loyalty Program Dashboard created to visualize KPIs.

🔹 Phase 9: Deployment & GitHub

Project metadata retrieved with VS Code & Salesforce CLI.

Source organized under force-app/main/default/.

Stored on GitHub repository for version control.

🔹 Phase 10: Testing & Validation

Debugged and tested flows.

Unit tests written (pending full coverage).

Validation rules confirmed.

⚙️ Setup Instructions

Clone the repository:

git clone <your-repo-url>
cd MyEcommerceProject


Authenticate with Salesforce org:

sf org login web --set-default --alias mySandbox


Push metadata to org:

sf project deploy start --target-org mySandbox


Assign Profiles & Permission Sets to test users.

Test Flows & Approvals inside Salesforce.

📊 Reports & Dashboards

Navigate to App Launcher → Dashboards → Loyalty Program Dashboard.

Navigate to Reports → Public Reports to see all reports.

✅ Testing

Activate flows before testing.

Run OrderTriggerHandlerTest from Developer Console.

Check Error_Log__c object for flow execution errors.

📌 Future Enhancements

Improve test coverage to >75%.

Add more granular dashboards.

Extend approval process to include multi-level approvals.

Integration with external systems for loyalty redemption.

👨‍💻 Contributors

Ganesh (Lead Developer & Admin)

Guided Salesforce phases: Data Modeling, Flows, Apex, Reports, Console
