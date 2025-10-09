# 🧠 Customer 360 Loyalty Project

## 📘 Overview
The **Customer 360 Loyalty Platform** connects multiple customer communication channels (WhatsApp, Email, etc.) with Salesforce to provide agents a complete 360° customer profile, streamline query handling, and automate loyalty management.

---

## 🧩 Design Overview

### 🕓 **As-Is Process (Current State)**
- Customer raises query via **email or WhatsApp**  
- Agent opens **separate systems** (email system, order system)  
- Agent manually searches for order details  
- Agent logs the case in a ticketing tool  
- Agent replies manually  
- ❌ **No loyalty or customer context available**

---

### 🚀 **To-Be Process (Future State)**
- Customer message arrives via **WhatsApp**  
- **Platform ingests** message into **Salesforce**  
- **Omni-Channel** routes case to **Agent Anjali**  
- Agent sees **360° Customer View** (Orders + Loyalty) in **Service Console**  
- Agent **resolves quickly**  
- ✅ **Loyalty points automatically awarded** on order activation

---

### 🎯 **Business Impact**

| Aspect | As-Is | To-Be |
|--------|--------|--------|
| Agent Workflow | Manual, disjointed | Unified, automated |
| Tools Used | Multiple systems | Salesforce Service Console |
| Customer Experience | Slow, contextless | Fast, personalized |
| Loyalty Management | Absent | Automated |
| Efficiency | Low | High |

---

## 🧱 Architecture Snapshot
> **Customer Channels (Email / WhatsApp)** → **Salesforce Omni-Channel** → **Service Console (360° View)** → **Loyalty Engine (Auto Points Update)**

---

## 🖼️ Visual Representation
![As-Is vs To-Be Flow](./A_flowchart-style_digital_illustration_compares_cu.png)
