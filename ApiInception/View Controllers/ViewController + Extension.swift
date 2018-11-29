//
//  CustomViewController.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

extension UIViewController {
    func showSimpleAlert(with message: String) {
        let alert = UIAlertController(title: "Alert",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
