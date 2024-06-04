# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?
```
For retaining changes (Type 2 Slowly Changing Dimension):

**Type 2 CUSTOMER_ADDRESS Table:**
- customer_address_id (Primary Key)
- customer_id (Foreign Key)
- address
- city
- state
- zip_code
- start_date
- end_date

In this architecture, when a customer's address changes, a new record is inserted into the CUSTOMER_ADDRESS table with the updated address information. The start_date column indicates when the address became effective, and the end_date column indicates when the address was superseded by a new one. This approach allows for historical tracking of customer addresses, preserving the history of changes over time.

For overwriting changes (Type 1 Slowly Changing Dimension):

**Type 1 CUSTOMER_ADDRESS Table:**
- customer_address_id (Primary Key)
- customer_id (Foreign Key)
- address
- city
- state
- zip_code

In this architecture, when a customer's address changes, the existing record in the CUSTOMER_ADDRESS table is simply updated with the new address information. There is no historical tracking of changes, and the previous address information is overwritten. This approach is simpler and more efficient but does not preserve historical data.

In a Type 2 architecture where changes are retained, there is a longer-term storage of historical address data. This can potentially increase the risk of data exposure if proper measures are not taken to securely store and manage this historical data.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
The AdventureWorks schema is designed for a large enterprise, with various aspects such as sales, production, human resources, and purchasing. In contrast, the proposed ERD for a small bookstore is relatively simple and focused primarily on sales, inventory management, and customer relationships. The AdventureWorks schema is much larger and more complex compared to the small bookstore ERD, reflecting the different scopes of the businesses they serve.
Regarding potential changes to the proposed ERD for the small bookstore, one consideration could be to include additional entities or attributes that capture more detailed information about customers, products, or sales. For example, incorporating a product category or genre entity could provide more insights into sales trends and customer preferences. Similarly, including attributes such as customer demographics or purchase history could enhance the bookstore's ability to personalize marketing efforts and improve customer satisfaction.

```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `June 1, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
