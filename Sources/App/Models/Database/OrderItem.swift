//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Fluent
import Vapor

final class OrderItem: Model, Content {
    static let schema = "orderItems"
    
    @ID(key: "id")
    var id: Int?

    @Field(key: "unitPrice")
    var unitPrice: Int

    @Field(key: "totalAmount")
    var totalAmount: Int
    
    @Field(key: "taxAmount")
    var taxAmount: Int
    
    @Field(key: "productId")
    var productId: Int

    @Field(key: "quantity")
    var quantity: Int
    
    @Parent(key: "orderId")
    var order: Order

    @Timestamp(key: "createdAt", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updatedAt", on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: "deletedAt", on: .delete)
    var deletedAt: Date?
    
    init() { }

    init(
        id: Int? = nil,
        totalAmount: Int,
        unitPrice: Int,
        quantity: Int,
        order: Order) {
        self.id = id
        self.totalAmount = totalAmount
        self.unitPrice = unitPrice
        self.quantity = quantity
        self.order = order
    }
}
