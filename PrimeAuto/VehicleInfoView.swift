//
//  VehicleInfoView.swift
//  PrimeAuto
//
//  Created by Rian Harshaw on 5/28/22.
//

import SwiftUI

struct VehicleInfoView: View {
    @StateObject var viewModel = VehicleViewModel()
    @Binding var input: String
    
    var body: some View {
        VStack {
            VStack(spacing: 50) {
            
                Image(systemName: "car")
                    .resizable()
                    .frame(width: 100, height: 70)
                VStack(spacing: 10) {
                    Text("\(viewModel.vehicle?.data.year ?? 0)".replacingOccurrences(of: ",", with: ""))
                    Text("\(viewModel.vehicle?.data.make ?? "N/A")")
                    Text("\(viewModel.vehicle?.data.model ?? "N/A")")
                    Text("\(viewModel.vehicle?.data.trim ?? "N/A")")
                    Text("\(viewModel.vehicle?.data.engine ?? "N/A")")
                    Text("\(viewModel.vehicle?.data.transmission ?? "N/A")")
                }
            }
            Button(action: {}) {
                Text("Add")
            }
        }
        .onAppear {
            viewModel.fetchImage(vin: input)
        }
    }
}

struct VehicleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleInfoView(input: .constant("5FNRL384X7B049757"))
    }
}
