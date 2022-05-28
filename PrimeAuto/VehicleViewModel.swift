//
//  VehicleViewModel.swift
//  PrimeAuto
//
//  Created by Rian Harshaw on 5/28/22.
//

import Foundation

class VehicleViewModel: ObservableObject {
    
    @Published var vehicle: Vehicle?
    @Published var image: VehicleImage?
    
    func fetch(vin: String) {
        
        guard vin.count == 17 else { return }
        
        let url = URL(string: "https://api.carmd.com/v3.0/decode?vin=\(vin)")
        
        guard let urlString = url else { return }
        
        var request = URLRequest(url: urlString)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Basic YjcxZDA2YjMtZDJjMy00ZTM4LTg0OTAtOTNiY2ZmOTUxZTUw", forHTTPHeaderField: "authorization")
        request.setValue("e25abe3d0b8f4eaca15d7ab8702cb58f", forHTTPHeaderField: "partner-token")
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(Vehicle.self, from: data)
                DispatchQueue.main.async {
                    self?.vehicle = result
                }
            } catch {
                print("DEBUG: Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func fetchImage(vin: String) {
        guard vin.count == 17 else { return }
        
        let url = URL(string: "https://api.carmd.com/v3.0/image?vin=\(vin)")
        
        guard let urlString = url else { return }
        
        var request = URLRequest(url: urlString)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("Basic YjcxZDA2YjMtZDJjMy00ZTM4LTg0OTAtOTNiY2ZmOTUxZTUw", forHTTPHeaderField: "authorization")
        request.setValue("e25abe3d0b8f4eaca15d7ab8702cb58f", forHTTPHeaderField: "partner-token")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            print("DEBUG: \(data)")
            do {
                let image = try JSONDecoder().decode(VehicleImage.self, from: data)
                DispatchQueue.main.async {
                    self?.image = image
                }
            } catch {
                print("DEBUG: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
