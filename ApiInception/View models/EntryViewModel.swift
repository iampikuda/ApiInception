//
//  EntryViewModel.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation

class EntryViewModel: ViewModel {

    let apiCaller = ApiHelper()
    var category = ""
    var entries = [Entry]()

    func getData(completion: @escaping () -> Void) {

        let wordArray = category.components(separatedBy: " ")

        guard let formatedCategory = wordArray.first else {
            completion()
            return
        }

        apiCaller.getFrom(urlString: SINGLECATEGORY + formatedCategory) {[weak self] response in
            guard let strongSelf = self else {
                completion()
                return
            }
            do {
                let decoder = JSONDecoder()
                let entryObject = try decoder.decode(EntryObject.self, from: response)
                strongSelf.entries = entryObject.entries
            } catch {
                print("EntryViewModel Error: \(error.localizedDescription)")
            }
            completion()
        }
    }
}
