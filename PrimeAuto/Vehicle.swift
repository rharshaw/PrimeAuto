//
//  Vehicle.swift
//  PrimeAuto
//
//  Created by Rian Harshaw on 5/28/22.
//

import Foundation
import SwiftUI

struct Vehicle: Codable {
    let message: MessageCode
    let data: VehicleData
    
    
    struct MessageCode: Codable {
        let code: Int
        let message: String
        let credentials: String
        let version: String
        let endpoint: String
        let counter: Int
    }
    struct VehicleData: Codable {
        let year: Int
        let make: String
        let model: String
        let manufacturer: String
        let engine: String
        let trim: String
        let transmission: String
    }
}

struct VehicleImage: Codable {
    let message: Messages
    let data: [VehicleImageData]
    
    struct Messages: Codable {
        let code: Int
        let message: String
        let credentials: String
        let version: String
        let endpoint: String
        let counter: Int
    }
    
    struct VehicleImageData: Codable {
        let image: String
    }
}

