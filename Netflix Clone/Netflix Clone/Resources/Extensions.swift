//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Usr_Prime on 19/04/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
