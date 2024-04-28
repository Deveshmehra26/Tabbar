//
//  WCSettingsViewModel.swift
//  WeChat
//
//  Created by Devesh on 26/04/24.
//

import Foundation

class WCSettingsViewModel {
    
    var settingsData: WCSettingsDataModel?
    
    init() {
        settingsData = nil
    }
    
    // closure (or block)
    // Error handling
    // 4 type
        /// 1. do - catch
    func getSettingsData(completion: (Result<Bool, Error>) -> Void) {
        if let fileUrl = Bundle.main.url(forResource: "SettingsData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                settingsData = try JSONDecoder().decode(WCSettingsDataModel.self, from: data)

                completion(.success(true))
            } catch(let error) {
                print("error:\(error)")
            }
        }
    }
}
