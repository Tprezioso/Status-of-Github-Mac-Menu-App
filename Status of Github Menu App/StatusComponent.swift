//
//  StatusComponents.swift
//  Status of Github Menu App
//
//  Created by Thomas Prezioso Jr on 4/1/22.
//

import Foundation

struct StatusComponents: Identifiable, Decodable {
    var id = UUID()
    var name: String
    var status: String

}
