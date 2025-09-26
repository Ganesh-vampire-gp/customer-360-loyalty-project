| ID    | Requirement                                                                      | Priority (Must/Should/Could) | Acceptance Criteria                                                  |
| ----- | -------------------------------------------------------------------------------- | ---------------------------: | -------------------------------------------------------------------- |
| FR-01 | System must create a unified customer profile with Orders, Cases, Loyalty points |                         Must | Contact page shows last 5 orders, current loyalty tier, points       |
| FR-02 | System must assign incoming WhatsApp messages to queues by product category      |                         Must | Message routed to queue within 2 mins; message record linked to Case |
| FR-03 | System must add loyalty points on Order activation: 1 point per ₹100             |                         Must | After Order Status = Activated, Loyalty\_Member.Points increased     |
| FR-04 | System should auto-send cart-abandonment email after 24 hours                    |                       Should | Email sent within 24–26h, link with UTM for tracking                 |
| FR-05 | System could show CLV score on Contact record                                    |                        Could | CLV\_Score\_\_c calculated nightly and visible on Contact            |

Non-functional requirements — examples

NFR-01: Case response time SLA: < 5 minutes for queue assignment.

NFR-02: Data retention: order logs retained for 5 years.

NFR-03: Performance: page load for Contact record < 2s (target).

NFR-04: Security: PII fields encrypted or masked in logs.

NFR-05: Availability: System should be available 99.9% (excluding maintenance).


FR-03: When Order.Status becomes Activated, the system shall add loyalty points to the Loyalty Member record at the rate of 1 point per ₹100 of Order.TotalAmount. Acceptance: Points balance increases and PointsHistory record is created.