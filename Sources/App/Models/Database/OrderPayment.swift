//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Fluent
import Vapor

final class OrderPayment: Model, Content {
    static let schema = "orderPayments"
    
    @ID(key: "id")
    var id: Int?
    
    @Field(key: "totalAmount")
    var totalAmount: Int
    
    @Parent(key: "orderId")
    var order: Order
    
    @Field(key: "method")
    var method: String
    
    // 0 = initiated
    // 1 = authorized
    // 2 = rejected
    // 3 = charged
    @Field(key: "status")
    var status: Int
    
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
        method: String,
        order: Order) {
        self.id = id
        self.totalAmount = totalAmount
        self.method = method
        self.order = order
    }
}
