//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Vapor

struct PaymentInput: Content {
    var orderId: Int
    var method: String
    var totalAmount: Int
}
