import Foundation

let jsonString = """
{
    "id": "506c2f30-9517-4e61-81ad-0257f6bfd8ea",
    "name": "Monzo",
    "balance": {
        "minor_units": 100,
        "exponent": 2,
        "currency": "GBP"
    }
}
"""

let jsonData = jsonString.data(using: .utf8)!

func decode(data: Data) -> <#Type#> {
    fatalError()
}
