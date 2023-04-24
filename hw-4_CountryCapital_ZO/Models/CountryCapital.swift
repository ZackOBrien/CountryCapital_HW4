//
//  CountryCapital.swift
//  hw-4_CountryCapital_ZO
//
//  Created by Zack O'Brien on 10/10/22.
//

import Foundation

struct AllCountryCapital : Decodable{
    var country_count = 0
    var results : [CountryCapital]
}

struct CountryCapital : Identifiable, Decodable{
    var id: UUID?
    var capital_latitude = 0.0
    var capital_longitude = 0.0
    var capital_name: String? = nil
    var continent_name = ""
    var country_code: String? = nil //nullable
    var country_name = ""
    var favorite: Bool? = nil
}
