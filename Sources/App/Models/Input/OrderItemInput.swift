//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Vapor

struct OrderItemInput: Content {
    var productId: Int
    var unitPrice: Int
    var quantity: Int
}
