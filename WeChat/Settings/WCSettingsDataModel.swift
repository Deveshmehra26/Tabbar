//
//  WCSettingsDataModel.swift
//  WeChat
//
//  Created by Devesh on 26/04/24.
//

import Foundation
/**
 class
 structure
 enum
 anchor
 
 
 Custom Data Types
 
 
 
 class ajshdfkjashdfjasdfjkashdfkasdjhfkajsdh {
 
 }
 
 typealias Simple = ajshdfkjashdfjasdfjkashdfkasdjhfkajsdh 
 */
enum SettingCellType: Int, Codable {
    case profile = 1
    case other = 2
}

struct SettingSection: Codable {
    let type: SettingCellType
    let name: String
    let imageName: String
    let isBarCodeAvailable: Bool?
    let status: String?
    var showDisclosure: Bool? = true
}

struct SettingSectionData: Codable {
    let sectionData: [SettingSection]
}

struct WCSettingsDataModel: Codable {
    let id: String
    let title: String  // "5"
    let timeStamp: Int
//    let sections: [SettingSectionData]
    let sections: Array<SettingSectionData>
}
