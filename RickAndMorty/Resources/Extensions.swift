//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Marcela Hernández on 10/5/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

