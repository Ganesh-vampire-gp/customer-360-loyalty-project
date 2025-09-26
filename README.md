🛒 MyEcommerce Customer-360-loyatly Salesforce Project



📖 Table of Contents

Overview

Tech Stack

Project Architecture

Features by Phase

Setup Instructions

Usage Guide

Reports & Dashboards

Testing

Screenshots

Future Roadmap

Contributors

📌 Overview

The MyEcommerce Salesforce Project is a Salesforce CRM implementation designed to simulate an E-commerce Loyalty Program.

It demonstrates Admin + Developer skills including:
✔ Data modeling with custom objects
✔ Record-triggered automation using Flows
✔ Approval processes for sensitive actions
✔ Validation rules for data integrity
✔ Apex triggers & classes for advanced logic
✔ Reports & dashboards for business insights
✔ Deployment & version control via VS Code + GitHub

🛠 Tech Stack

Salesforce Platform

Apex (Triggers, Classes, Test Cases)

Salesforce Flows

Approval Processes

Validation Rules

Reports & Dashboards

Salesforce CLI (sfdx/sf)

Visual Studio Code

GitHub

🏗 Project Architecture
graph TD
    A[Contact] -->|Related To| B[Loyalty Member__c]
    B --> C[Loyalty Points History__c]
    B --> D[Reward Redemption__c]
    B --> E[Loyalty Transaction__c]
    F[Order] -->|Triggers Loyalty Points| B
    G[Error Log__c] -->|Stores Flow Errors| Admin

🚀 Features by Phase
Phase 1: Data Model

Custom Objects: Loyalty_Member__c, Reward_Redemption__c, Loyalty_Points_History__c, Loyalty_Transaction__c, Error_Log__c

Custom Fields: Loyalty Points Balance, Tier, Reward Name, Amount, etc.

Phase 2: Flows & Automation

Order Activation → Loyalty Points Flow

Reward Claim Portal Flow

Inactive Customer Reengagement Flow

Sync Loyalty Tier to Contact Flow

Error Logging Flow

Phase 3: Validation Rules

Prevent negative loyalty points.

Tier required if points exist.

Redemption amount > 0.

Phase 4: Approval Processes

Contact → Manager Approval.

High-Value Reward Redemption → Approval required.

Phase 5: Apex Development

OrderTriggerHandler.cls → Handles loyalty point calculation.

OrderTrigger.trigger → Fires when Orders are activated.

OrderTriggerHandlerTest.cls → Unit testing (≥ 75% coverage pending).

Phase 6: Profiles & Permission Sets

Support Agent Profile

Support Manager Profile

Permission Sets: Case Team Lead Access, Experience Profile Manager

Phase 7: Support Agent Console

Console workspace for agents.

Tabs: Cases, Orders, Loyalty Members.

Record detail + related lists configured.

Phase 8: Reports & Dashboards

Reports: Inactive Customers, Reward Redemptions, Loyalty Points by Member, Orders Driving Points, Loyalty Members by Tier.

Dashboard: Loyalty Program Dashboard.

Phase 9: Deployment & GitHub

Metadata retrieved using Salesforce CLI.

Code and config stored in GitHub repo under force-app/main/default/.

Phase 10: Testing & Validation

Debugged all flows.

Tested approvals.

Validation rules working.

Apex test classes partially complete.

⚙️ Setup Instructions

Clone Repo

git clone <your-repo-url>
cd MyEcommerceProject


Authenticate Org

sf org login web --alias mySandbox --set-default


Deploy Metadata

sf project deploy start --target-org mySandbox


Assign Permissions

Support Agent Profile → Agents.

Support Manager Profile → Managers.

Activate Flows

Navigate to Setup → Flows → Activate required flows.

📘 Usage Guide

Create an Order → Loyalty points are added automatically.

Use Claim Reward Portal Flow → Redeem rewards if points are sufficient.

Inactive Customer Flow → Sends re-engagement emails.

Managers can approve/reject reward redemptions.

📊 Reports & Dashboards

Reports Folder: Public Reports

Dashboard Folder: Private Dashboards

Key Reports:

Loyalty Points Balance by Member

Orders Driving Loyalty Points

Reward Redemptions by Status

Dashboard: Loyalty Program Dashboard

🧪 Testing

Run Apex Test Classes from Developer Console:

OrderTriggerHandlerTest

Debug Flows via Flow Builder → Debug.

Check Error_Log__c records for failures.

📷 Screenshots

(Place actual screenshots here once captured)

Data Model (Schema Builder)

Loyalty Member Record Page

Reward Redemption Approval Screen

Inactive Customer Reengagement Flow Debug

Loyalty Program Dashboard

🔮 Future Roadmap

✅ Add more unit tests for > 90% coverage

✅ Add CI/CD pipeline with GitHub Actions

✅ Enhance dashboards with drill-down reports

✅ Multi-level approvals for redemptions

👨‍💻 Contributors

Ganesh (Lead Developer & Salesforce Admin)

Built & tested all project phases

Configured flows, approvals, dashboards, and triggers
