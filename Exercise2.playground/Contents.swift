import Foundation

let exampleJSONData = """
 {
   "fundingSources": [
     {
       "id": "74009ff5-6d22-4f16-9904-3003335a2f21",
       "name": "Monzo",
       "balance": {
         "minor_units": 100,
         "currency": "GBP",
         "exponent": 2
       }
     },
     {
       "id": "7d216a27-c705-4111-813b-20d20231046d",
       "name": "Commonwealth Bank",
       "balance": {
         "minor_units": 100,
         "currency": "AUD",
         "exponent": 2
       }
     },
     {
       "id": "4ab00269-71f6-4a24-bdc1-c284be6f0f72",
       "name": "Revolut"
     }
   ]
 }
""".data(using: .utf8)!

let jsonURL = URL(string: "https://jsonkeeper.com/b/SQGA")!

// GET -> api.curve.com/fundingsources
/* Model
    FundingSource {
        id
        name
        balance
    }
*/
