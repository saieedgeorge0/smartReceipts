//
//  Data.swift
//  iReceipts
//
//  Created by George Saieed on 4/16/16.
//  Copyright © 2016 George Saieed. All rights reserved.
//

import UIKit
var data: [[String:AnyObject]] = [
    [
        "id": 1,
        "receiptImage": UIImage(),
        "receiptType": "Business Purchase",
        "receiptBackground" : "business",
        "receiptPageBackground": "business",
        "receiptCost": "1000.00",
        "purchaseMethod": "Cash",
        "cardType": "",
        "purchaseDate": "4/16/2016",
        "returnBy":"5/16/2016",
        "returnTime": "10",
        "keeping": "Keeping it",
        "noKeepSwitch": false,
        "reminders": true,
        "purchasedAt":"Best Buy",
        "address":"430 Home Dr. Pittsburgh, PA 15275",
        "partOfTrip":false,
        "nameOfTrip":"",
        "receiptName": "Lenovo Yoga 13",
        "items": [
            [
                "id": 1,
                "name": "Apple",
                "price": 5.00
            ],
            [
                "id": 2,
                "name": "Orange",
                "price": 3.00
            ]
        ]
    ],
    [
        "id": 2,
        "receiptImage": UIImage(),
        "receiptType": "Personal Purchase",
        "receiptBackground" : "personal",
        "receiptPageBackground": "personal",
        "receiptCost": "100.00",
        "purchaseMethod": "Cash",
        "cardType": "",
        "purchaseDate": "2/16/2016",
        "returnBy":"3/16/2016",
        "returnTime": "0",
        "keeping": "Returning it",
        "noKeepSwitch": true,
        "reminders": true,
        "purchasedAt":"Walmart",
        "address":"Make It Kinda Long As Possible to Test Address Length",
        "partOfTrip":false,
        "nameOfTrip":"",
        "receiptName": "Groceries",
        "items": [
            [
                "id": 1,
                "name": "Apple",
                "price": 5.00
            ],
            [
                "id": 2,
                "name": "Orange",
                "price": 3.00
            ]
        ]
    ]

    
]
