//
//  StatusComponents.swift
//  Status of Github Menu App
//
//  Created by Thomas Prezioso Jr on 4/1/22.
//

import Foundation

struct StatusComponent: Identifiable, Codable {
    var id: String
    var name: String
    var status: String

}

struct StatusComponents: Codable {
    var components: [StatusComponent]
}
