//
//  hw_4_CountryCapital_ZOApp.swift
//  hw-4_CountryCapital_ZO
//
//  Created by Zack O'Brien on 10/10/22.
//

import SwiftUI

@main
struct hw_4_CountryCapital_ZOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
