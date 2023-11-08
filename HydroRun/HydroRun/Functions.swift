//
//  Functions.swift
//  HydroRun
//
//  Created by Antonio Tridente on 08/11/23.
//

import Foundation

func saveData<T: Encodable>(array: T, key: String){
    
    let data = try! JSONEncoder().encode(array)
    UserDefaults.standard.setValue(data, forKey: key)
    
}

func loadData<T: Decodable>(type: T.Type, key: String) -> T? {
    
    if let data = UserDefaults.standard.data(forKey: key) {
        return try! JSONDecoder().decode(type, from: data)
    } else {
        return nil
    }
    
}
