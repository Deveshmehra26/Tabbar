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
    
    deinit {
        print("deinit - WCSettingsViewModel")
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
    
    func numberOfSections() -> Int {
        return settingsData?.sections.count ?? 0
    }
    
    func numberOfRows(sectionIndex: Int) -> Int {
        guard let sections = settingsData?.sections, sectionIndex < sections.count else {
            return 0
        }
        let section = sections[sectionIndex]
        return section.sectionData.count
    }
    
    func dataAtIndex(index: IndexPath) -> SettingSection? {
        guard let sections = settingsData?.sections, index.section < sections.count else {
            return nil
        }
        let section = sections[index.section]
        if index.row < section.sectionData.count {
            return section.sectionData[index.row]
        }
        return nil
    }
}
