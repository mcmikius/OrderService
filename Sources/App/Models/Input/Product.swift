//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Vapor

struct Product: Content {
    var id: Int
    var unitPrice: Int
    var tax: Decimal
}
