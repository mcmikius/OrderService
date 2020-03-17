//
//  File.swift
//  
//
//  Created by Mykhailo Bondarenko on 17.03.2020.
//

import Vapor

enum OrderError: Error {
    case totalsNotMatching
    case paymentMissing
    case overpayment
    case orderNotFound
}
