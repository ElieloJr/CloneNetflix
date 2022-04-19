//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Usr_Prime on 19/04/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    
    private let titlesPosterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    
}
