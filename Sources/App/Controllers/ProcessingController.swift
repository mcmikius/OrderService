//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Fluent
import Vapor

final class ProcessingController {
    
    let productServiceUrl:String
    
    init(_ productServiceUrl: String) {
        self.productServiceUrl = productServiceUrl
    }
    
    func getOrders(status: Int = 0, on app: Application) throws -> EventLoopFuture<[Order]> {
        return Order.query(on: app.db).filter(\Order.$status == status).all()
    }

    func processOrderInformation(_ order: Order, on app: Application) -> EventLoopFuture<Bool> {
        let productIds:[Int] = order.items.map { $0.productId }
        
        let expectedTotal = order.totalAmount
        
        return self.getProductInformation(productIds: productIds, client: app.client).flatMap { (products:[Product]) -> EventLoopFuture<Bool> in
            var total = 0
            var totalTax = 0
            for item in order.items {
                for product in products {
                    if product.id == item.productId {
                        total = total + product.unitPrice * item.quantity
                        totalTax = totalTax + (product.unitPrice * product.tax * item.quantity)
                    }
                }
            }
            if total != expectedTotal {
                return app.make(EventLoop.self).makeFailedFuture(OrderError.totalsNotMatching)
            }
            order.totalTax = totalTax
            order.totalAmount = total
            order.status = 1
            return order.save(on: app.db).transform(to: true)
        }
    }
    
    
    func getProductInformation(productIds: [Int], client: Client) -> EventLoopFuture<[Product]> {
        return client.get(URI(string: self.productServiceUrl+productIds.map { String($0) }.joined(separator: ",")), headers: ["Content-Type": "application/json"]).flatMapThrowing { (response:ClientResponse) in
            return try response.content.decode([Product].self)
        }
    }

}
