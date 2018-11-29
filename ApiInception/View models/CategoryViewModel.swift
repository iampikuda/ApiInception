//
//  CategoryViewModel.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation

class CategoryViewModel: ViewModel {

    let apiCaller = ApiHelper()
    var categoryList = [String]()
    let title = "Categories"

    func getData(completion: @escaping () -> Void) {
        apiCaller.getFrom(urlString: CATEGORYLIST)
        { [weak self] response in

            guard let strongSelf = self else {
                completion()
                return
            }

            do {
                let categoryList = try JSONSerialization.jsonObject(with: response, options: []) as! [String]
                strongSelf.categoryList = categoryList
            } catch {
                print("CategoryViewModel Error: \(error.localizedDescription)")
            }
            completion()
        }
    }
}
