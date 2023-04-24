//
//  ContentView.swift
//  hw-4_CountryCapital_ZO
//
//  Created by Zack O'Brien on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    @State var showWeb: Bool = false
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(VM.country_capitals){ cap in
                        NavigationLink{
                            //CapitalView(cap: cap)
                            MapView(cap: cap, showWeb: $showWeb)
                                .ignoresSafeArea()
                        } label: {
                            HStack{
                                Text("\(cap.country_name)")
                                if cap.favorite ?? false{
                                  Image(systemName: "heart.fill")
                                  .foregroundColor(.red)
                                }
                            }
                            .foregroundColor(.black)
                            .padding()
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Country Capitals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
