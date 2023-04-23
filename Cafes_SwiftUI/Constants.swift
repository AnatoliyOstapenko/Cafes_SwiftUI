//
//  Constants.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import Foundation

enum Constants {
    static let emptyMainStatement = "Sorry! No results found..."
    static let emptySubStatement = "Please try a different search request or browse businesses from the list"
}

enum MockData {
    // Mocked model
    static var mockVendor = Vendor(id: 001,
                                  company_name: "North St. Butchery",
                                  area_served: "City of London",
                                  shop_type: "Cafe & Restaurant",
                                  favorited: false,
                                  follow: false,
                                  business_type: "physical",
                                  cover_photo: CoverPhoto(id: 002,
                                                          media_url: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9",
                                                          media_type: "image"),
                                  categories: [Category(id: 002,
                                                        name: "Butchery",
                                                        image: Category.ImageData(id: 003,
                                                                                  media_url: "www",
                                                                                  media_type: "image"))],
                                  tags: [Tag(id: 004,
                                             name: "Butchery",
                                             purpose: "Cafe")])
    
    
    // Mocked network layer:
    static let jsonString = """
        {
          "vendors": [
            {
              "id": 99,
              "company_name": "Florists + Fashion",
              "area_served": "Newry",
              "shop_type": "Bike Shop",
              "favorited": false,
              "follow": false,
              "business_type": "virtual",
              "cover_photo": {
                "id": 984,
                "media_url": "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9",
                "media_type": "image"
              },
              "categories": [
                {
                  "id": 40,
                  "name": "Florists",
                  "image": {
                    "id": 1348,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                },
                {
                  "id": 41,
                  "name": "Fashion Accessories",
                  "image": {
                    "id": 1366,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                },
                {
                  "id": 42,
                  "name": "Garden",
                  "image": {
                    "id": 1348,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                },
                {
                  "id": 43,
                  "name": "Home",
                  "image": {
                    "id": 1366,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                }
              ],
              "tags": [
                {
                  "id": 99,
                  "name": "BMX",
                  "purpose": "shop"
                },
                {
                  "id": 100,
                  "name": "Giant",
                  "purpose": "shop"
                },
                {
                  "id": 101,
                  "name": "Cycle",
                  "purpose": "shop"
                },
                {
                  "id": 102,
                  "name": "BMX",
                  "purpose": "shop"
                },
                {
                  "id": 103,
                  "name": "Giant",
                  "purpose": "shop"
                },
                {
                  "id": 104,
                  "name": "Cycle",
                  "purpose": "shop"
                }
              ]
            },
            {
              "id": 1,
              "company_name": "Cafe & Restaurant",
              "area_served": "Ukraine",
              "shop_type": "Flowers",
              "favorited": true,
              "follow": false,
              "business_type": "virtual",
              "cover_photo": {
                "id": 980,
                "media_url": "https://i.imgur.com/OnwEDW3.jpg",
                "media_type": "image"
              },
              "categories": [
                {
                  "id": 53,
                  "name": "Cafe & Restaurant",
                  "image": {
                    "id": 1344,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                }
              ],
              "tags": [
                {
                  "id": 85,
                  "name": "Cafe",
                  "purpose": "shop"
                }
              ]
            },
            {
              "id": 8,
              "company_name": "Pets",
              "area_served": "Dnipro",
              "shop_type": "Bar",
              "favorited": false,
              "follow": false,
              "business_type": "physical",
              "cover_photo": {
                "id": 1381,
                "media_url": "https://i.imgur.com/CzXTtJV.jpg",
                "media_type": "image"
              },
              "categories": [
                {
                  "id": 54,
                  "name": "Pets",
                  "image": {
                    "id": 1345,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                },
                {
                  "id": 55,
                  "name": "Home",
                  "image": {
                    "id": 1345,
                    "media_url": "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg",
                    "media_type": "image"
                  }
                }
              ],
              "tags": [
                {
                  "id": 60,
                  "name": "New",
                  "purpose": "shop"
                },
                {
                  "id": 86,
                  "name": "Test",
                  "purpose": "shop"
                }
              ]
            }
          ]
        }
    """
}
