//
//  PAM.swift
//  IEPAM-App
//
//  Created by Sergio on 13/10/22.
//

import SwiftUI

struct PAM: Identifiable {
    
    var id: Int
    var name: String
    var gender_id: Int
    var gender: String
    var birth_date: Date
    var height: Float
    var weight: Float
    var blood_type: String
    var chapel_id: Int
    var chapel: String
    var church_id: Int
    var church: String
    var deanship_id: Int
    var deanship: String
    var zone_id: Int
    var zone: String
    var city_id: Int
    var city: String
    var state_id: Int
    var state: String
    var state_code: String
    var zip_code: String
    var suburb: String

}

extension PAM {
    
    static let emptyPAM = PAM(id: 1, name: "empty", gender_id: 1, gender: "Male", birth_date: Date(), height: 1.80, weight: 90, blood_type: "A+", chapel_id: 0, chapel: "NO-ABP", church_id: 0, church: "NO-ABP", deanship_id: 0, deanship: "NO-ABP", zone_id: 0, zone: "NO-ABP", city_id: 39, city: "Monterrey", state_id: 19, state: "Nuevo León", state_code: "NL", zip_code: "64920", suburb: "")
}
