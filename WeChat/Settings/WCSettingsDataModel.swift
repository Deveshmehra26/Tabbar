//
//  WCSettingsDataModel.swift
//  WeChat
//
//  Created by Devesh on 26/04/24.
//

import Foundation

struct SettingSection: Codable {
    let name:String
    let imageName: String
    let isBarCodeAvailable: Bool
    let status: String?
}
struct SettingSectionData: Codable {
    let data: [SettingSection]
}

struct WCSettingsDataModel: Codable {
    let id: String
    let title: String 
    let timeStamp: Int 
    let sections: SettingSectionData
}
