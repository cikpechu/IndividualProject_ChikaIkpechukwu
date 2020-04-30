//
//  Archiver.swift
//  Cereals
//
// Created by Chika Ikpechukwu on 4/30/20.
//  Copyright © 2020 Chika Ikpechukw. All rights reserved.
//

import Foundation

class Archiver {
    
    static func saveCereals(_ item: Cereal) {
        do {
            var cereals = getCereals()
            cereals.append(item)
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(cereals)
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "Cereals")
        } catch {
            print("Failed to save cereals.: ", error.localizedDescription)
        }
        
    }
    
    static func getCereals() -> [Cereal] {
        do {
            if let cerealData = UserDefaults.standard.object(forKey: "Cereals") as? Data {
                let decoder = JSONDecoder()
                let loadedCereals = try decoder.decode([Cereal].self, from: cerealData)
                return loadedCereals
            }
        } catch {
            print("Couldn't read cereals: ", error.localizedDescription)
            return []
        }
        return []
    }
    
    static func findAndReplace(old: Cereal, replace new: Cereal) {
        do {
            var cereals = getCereals()
            if let index = cereals.firstIndex(of: old) {
                cereals[index] = new
            }
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(cereals)
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "Cereals")
        } catch {
            print("Failed to save cereals.: ", error.localizedDescription)
        }
    }
    
    static func delete(_ item: Cereal) {
        do {
            var cereals = getCereals()
            if let index = cereals.firstIndex(of: item) {
                cereals.remove(at: index)
            }
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(cereals)
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "Cereals")
        } catch {
            print("Failed to save cereals.: ", error.localizedDescription)
        }
    }
    
}
