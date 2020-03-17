//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Vapor

struct OrderInput: Content {
    var totalAmount: Int
    var firstname: String
    var lastname: String
    var street: String
    var zip: String
    var city: String
    var items:[OrderItemInput]
}
