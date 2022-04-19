//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Usr_Prime on 19/04/22.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .darkGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    func configureCell(with link: String) {
        guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(link)") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let imageEnd = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.posterImageView.image = imageEnd
            }
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
