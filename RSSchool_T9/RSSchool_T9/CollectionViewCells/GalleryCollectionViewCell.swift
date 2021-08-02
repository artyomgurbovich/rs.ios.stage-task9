//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    var galleryImageView = UIImageView(image: UIImage(named: "minsk-0"))
    var titleLabel = UILabel()
    var typeLabel = UILabel()
    
    private lazy var gradientLayer : CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.74, 1.0]
        galleryImageView.layer.insertSublayer(gradient, at: .zero)
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func awakeFromNib() {
        print("123")
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.addSubview(galleryImageView)
        galleryImageView.contentMode = .scaleAspectFill
        galleryImageView.clipsToBounds = true
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.layer.cornerRadius = 10
        galleryImageView.layer.borderWidth = 1
        galleryImageView.layer.borderColor = UIColor.black.cgColor
        NSLayoutConstraint.activate([
            galleryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            galleryImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            galleryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            galleryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        galleryImageView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.numberOfLines = .zero
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: galleryImageView.leadingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: galleryImageView.trailingAnchor, constant: -15),
            typeLabel.bottomAnchor.constraint(equalTo: galleryImageView.bottomAnchor, constant: -13),
            typeLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
        typeLabel.textColor = UIColor(white: 0.712, alpha: 1.0)
        typeLabel.text = "Type"
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: 12.0)!
        galleryImageView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = .zero
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: galleryImageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: galleryImageView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -3),
            titleLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        titleLabel.textColor = .white
        titleLabel.text = "Title"
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 16.0)!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = galleryImageView.bounds
    }
}
