//
//  ViewModel.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import Foundation

protocol ViewModel {
    func getData(completion: @escaping () -> Void)
}
