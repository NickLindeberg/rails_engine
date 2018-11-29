## Welcome to Rails (Rales) Engine

Rales Engine
Project Description
In this project, you will use Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema.

The project requirements are listed below:

Learning Goals
Technical Expectations
Check-ins
Evaluation
Learning Goals
Learn how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
Learn how to use controller tests to drive your design.
Use Ruby and ActiveRecord to perform more complicated business intelligence.
Technical Expectations
All endpoints will expect to return JSON data
All endpoints should be exposed under an api and version (v1) namespace (e.g. /api/v1/merchants.json)
JSON responses should include ids only for associated records unless otherwise indicated (that is, don’t embed the whole associated record, just the id)
Prices are in cents, therefore you will need to transform them in dollars. (12345 becomes 123.45)
Remember that for a JSON string to be valid, it needs to contain a key and a value.
API will be compliant to the JSON API spec. Documentation
Data Importing
You will create an ActiveRecord model for each entity included in the sales engine data.
Your application should include a rake task which imports all of the CSV’s and creates the corresponding records.
Record Endpoints
Index of Record
Each data category should include an index action which renders a JSON representation of all the appropriate records:

Request URL
GET /api/v1/merchants.json

JSON Output
(The following is an example of a response if only three records were saved in the database)

{
  "data": [
  {
    "id": "1",
      "type": "merchant",
      "attributes": {
        "name": "Mike's Awesome Store",
      }
  },
  {
    "id": "2",
    "type": "merchant",
    "attributes": {
      "name": "Store of Fate",
    }
  },
  {
    "id": "3",
    "type": "merchant",
    "attributes": {
      "name": "This is the limit of my creativity",
    }
  }
  ]
}

#### Show Record

Each data category should include a `show` action which
renders a JSON representation of the appropriate record:

##### Request URL

`GET /api/v1/merchants/1.json`

##### JSON Output

```json
{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Store Name"
    }
  }
}
Single Finders
Each data category should offer find finders to return a single object representation. The finder should work with any of the attributes defined on the data type and always be case insensitive.

Request URL
GET /api/v1/merchants/find?parameters
Request Parameters
parameter	description
id	search based on the primary key
name	search based on the name attribute
created_at	search based on created_at timestamp
updated_at	search based on updated_at timestamp
JSON Output
GET /api/v1/merchants/find?name=Schroeder-Jerde

{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Schroeder-Jerde"
    }
  }
}
Multi-Finders
Each category should offer find_all finders which should return all matches for the given query. It should work with any of the attributes defined on the data type and always be case insensitive.

Request URL
GET /api/v1/merchants/find_all?parameters

Request Parameters
parameter	description
id	search based on the primary key
name	search based on the name attribute
created_at	search based on created_at timestamp
updated_at	search based on updated_at timestamp
JSON Output
GET /api/v1/merchants/find_all?name=Cummings-Thiel

{
  "data":
  [
  {
    "id": "4",
    "type": "merchant",
    "attributes": {
      "name": "Cummings-Thiel"
    }
  }
  ]
}
Note: Although this search returns one record, it comes back in an array.

Random
Request URL
Returns a random resource.

api/v1/merchants/random.json

{
  "data": {
    "id": "23",
    "type": "merchant",
    "attributes": {
      "name": "Thing Thingers"
    }
  }
}
Relationship Endpoints
In addition to the direct queries against single resources, we would like to also be able to pull relationship data from the API.

We’ll expose these relationships using nested URLs, as outlined in the sections below.

Merchants
GET /api/v1/merchants/:id/items returns a collection of items associated with that merchant
GET /api/v1/merchants/:id/invoices returns a collection of invoices associated with that merchant from their known orders
Invoices
GET /api/v1/invoices/:id/transactions returns a collection of associated transactions
GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items
GET /api/v1/invoices/:id/items returns a collection of associated items
GET /api/v1/invoices/:id/customer returns the associated customer
GET /api/v1/invoices/:id/merchant returns the associated merchant
Invoice Items
GET /api/v1/invoice_items/:id/invoice returns the associated invoice
GET /api/v1/invoice_items/:id/item returns the associated item
Items
GET /api/v1/items/:id/invoice_items returns a collection of associated invoice items
GET /api/v1/items/:id/merchant returns the associated merchant
Transactions
GET /api/v1/transactions/:id/invoice returns the associated invoice
Customers
GET /api/v1/customers/:id/invoices returns a collection of associated invoices
GET /api/v1/customers/:id/transactions returns a collection of associated transactions
Business Intelligence Endpoints
We want to maintain the original Business Intelligence functionality of SalesEngine, but this time expose the data through our API.

Remember that ActiveRecord is your friend. Much of the complicated logic from your original SalesEngine can be expressed quite succinctly using ActiveRecord queries.

All Merchants
GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue
GET /api/v1/merchants/most_items?quantity=x returns the top x merchants ranked by total number of items sold
GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants
Assume the dates provided match the format of a standard ActiveRecord timestamp.

Single Merchant
GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across successful transactions
GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
NOTE: Failed charges should never be counted in revenue totals or statistics.

NOTE: All revenues should be reported as a float with two decimal places.

Items
GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated
GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold
GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.
Customers
GET /api/v1/customers/:id/favorite_merchant returns a merchant where the customer has conducted the most successful transactions
Code Expectations
Controller Actions
It’s expected that you limit your controller actions to only the standard Rails actions. For endpoints such as GET /api/v1/merchants/find?parameters the initial thought might be to do something like this:

module Api
module V1
class MerchantsController
# code omitted
def find
# code omitted
end
end
end
end
This approach can lead to large controllers. For more info on the reasons why, check out this blog post.

Instead try something like this which adheres to the above approach of only using RESTful actions:

module Api
module V1
module Merchants
class SearchController
def show
# code omitted
end
end
end
end
end
Milestones & Feedback
Milestones
The organization of this project spec is by feature type. However, much of the unfamiliar or more difficult work is in the business intelligence portion of the project. To the degree possible instructors encourage you to use an agile approach to completing this assignment. Furthermore, we encourage you review the work and develop estimated milestones before you begin. Any good set of milestones will allow for some slippage before the project is due.

There is an Advanced ActiveRecord class scheduled for Wednesday. We highly encourage you to have attempted some of the business intelligence queries before that class.

What to expect from instructors
There will not be formal check-ins for this project. Instructors will generally be available during scheduled work time to discuss issues absent other commitments. Students should also view this as an opportunity to practice discussing code on GitHub, and instructors will prefer reviewing PRs to discussing code on Slack.

In their reviews, instructors will go over whatever technical, planning or other challenges you’re having. They also may give you feedback, or suggest a different path than the one you’re on.

Evaluation
Blog Post Deliverable

At the end of this project, write a reflection on what you learned and implemented. This will help you review your own code and gain practice explaining/talking through the code and the process/decisions that were made along the way. Include code snippets from the project in your explanations.

We reccommend writing your blog on Medium, but if you have a blog site that you already use that is okay too. However, it must be publically accessible and the link should be submitted to your instructors via Direct Message.

Here are some questions to think about as you write your post:

How did you approach this project? What sort of planning did you do?
What was the most challenging part of the project? How did you deal with that challenge? Were you able to overcome it? If yes, how did you overcome it? If no, what do you think is the reason for not being able to and what would you do differenlty?
What did you enjoy most about the project?
What part of the project are you most proud of and why?
If you had to do this project again, what would you want to change? (This could be your process, organization of code, particular piece of code that you would want to write differently etc.)
What is one specific thing that you want to take from this project and implement in your next project? (This could be something that worked well for you or something that didn’t go well, but you learned from it.)
Feature Delivery
Feature completeness will be determined using the spec harness

1. Completion

4: Project completes all base requirements according to the spec harness.
3: Project completes most requirements but fails 4 or fewer spec harness tests.
2: Project completes most requirements but fails 5-8 spec harness tests.
1: Project fails more than 9 spec harness tests.
Technical Quality
1. Test-Driven Development

4: Project demonstrates high test coverage (>90%) and tests at the controller and unit levels.
3: Project demonstrates high test coverage (>80%) and tests at the controller and unit levels.
2: Project demonstrates high test coverage (>70%) but does not adequately balance controller and unit tests.
1: Project does not have 70% test coverage.
2. Code Quality

4: Project demonstrates exceptionally well factored code.
3: Project demonstrates solid code quality and MVC principles.
2: Project demonstrates some gaps in code quality and/or application of MVC principles.
1: Project demonstrates poor factoring and/or understanding of MVC.
3. API Design

4: Project exemplifies API design idioms, with consistent and coherent response structures, serializers to format JSON data, and effective request format handling.
3: Project uses strong and consistent data formats throughout, while relying mostly on standard Rails JSON features.
2: Project has inconsistencies or gaps in how its JSON data is organized or formatted.
1: Project’s API is not fully functional or has significant confusion around request formats.
4. Queries

4: Project makes great use of ActiveRecord relationships and queries, including some advanced query functionality such as joins and select to create virtual attributes.
3: Project makes good use of ActiveRecord, but drops to ruby enumerables for some query methods.
2: Project has some gaps in ActiveRecord usage, including numerous business methods that rely on ruby enumerables to find the appropriate data.
1: Project struggles to establish a coherent ActiveRecords schema, including missing relationships or dysfunctional queries.
