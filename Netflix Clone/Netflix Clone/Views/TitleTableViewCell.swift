//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Usr_Prime on 19/04/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titlesPosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    private func applyConstraints() {
        let titlesPosterImageViewConstraints = [
            titlesPosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterImageView.trailingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width/3)*2),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlesPosterImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.titlesPosterImageView.image = UIImage(data: imageData)
            }
        }
        titleLabel.text = model.titleName
    }
}
