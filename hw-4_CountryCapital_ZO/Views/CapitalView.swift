//
//  CapitalView.swift
//  hw-4_CountryCapital_ZO
//
//  Created by Zack O'Brien on 10/11/22.
//

import SwiftUI

struct CapitalView: View {
    
    @EnvironmentObject var VM: ViewModel
    var cap = CountryCapital()
    
    var body: some View {
        VStack{
            Text("\(cap.country_name)")
                .font(.largeTitle)
                .padding()
            VStack(alignment: .leading){
                Text("country code: \(cap.country_code ?? "-")")
                Text("capital name: \(cap.capital_name ?? "-")")
                Text("continent name: \(cap.continent_name)")
                Text("capital at lat: \(cap.capital_latitude) lot: \(cap.capital_longitude)")
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding()
            Button {
                VM.changeFav(cap: cap)
            } label: {
                Image(systemName: cap.favorite ?? false ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 55.0, height: 55.0)
                    .accentColor(.red)
            }
            .padding(.bottom, 335)
        }
    }
}

struct CapitalView_Previews: PreviewProvider {
    static var previews: some View {
        CapitalView(cap: CountryCapital())
            .environmentObject(ViewModel())
    }
}
