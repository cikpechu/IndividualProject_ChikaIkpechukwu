//
//  Cereal.swift
//  Cereals
//
// Created by Chika Ikpechukwu on 4/30/20.
//  Copyright © 2020 Chika Ikpechukw. All rights reserved.

import Foundation

struct Cereal: Codable, Comparable {
    
    static func < (lhs: Cereal, rhs: Cereal) -> Bool {
        return lhs.name ?? "" < rhs.name ?? ""
    }
    
    static func == (lhs: Cereal, rhs: Cereal) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String?
    var calories: Int = 0
    var serving: String?
    
    init() { }
    
    init(_ name: String?, calories: Int, serving: String?) {
        self.name = name
        self.calories = calories
        self.serving = serving
    }
}


