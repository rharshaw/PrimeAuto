//
//  VehicleSearchView.swift
//  PrimeAuto
//
//  Created by Rian Harshaw on 5/28/22.
//

import SwiftUI

struct VehicleSearchView: View {
    @State private var input = ""
    @State private var showVehicleInfo = false
    
    var body: some View {
        VStack {
            Text("Search By VIN")
                .bold()
                .font(.title3)
            TextField("Enter VIN", text: $input)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button(action: { showVehicleInfo.toggle() }) {
                Text("Search")
                    .bold()
            }
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(.blue)
            .cornerRadius(50)
        }
        .sheet(isPresented: $showVehicleInfo) {
            VehicleInfoView(input: $input)
        }
    }
}

struct VehicleSearchView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleSearchView()
    }
}
