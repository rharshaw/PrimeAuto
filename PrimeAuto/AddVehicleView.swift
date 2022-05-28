//
//  AddVehicleView.swift
//  PrimeAuto
//
//  Created by Rian Harshaw on 5/28/22.
//

import SwiftUI

struct AddVehicleView: View {
    @State private var showVINSearch = false
    
    var body: some View {
        Button(action: { showVINSearch.toggle() }) {
            HStack {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 70, height: 70)
                    Image(systemName: "car.fill")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 90, height: 70)
                    }
            Text("Add Vehicle")
                    .font(.title2)
                    .bold()
            }
        }.sheet(isPresented: $showVINSearch) {
            VehicleSearchView()
        }
    }
}

struct AddVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        AddVehicleView()
    }
}
