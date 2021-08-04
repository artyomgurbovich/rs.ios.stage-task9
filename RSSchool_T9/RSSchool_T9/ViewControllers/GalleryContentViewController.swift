//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryContentViewController: ContentViewController {
    
    var gallery: Gallery!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = gallery.coverImage
        titleLabel.text = gallery.title
        typeLabel.text = "\t\(gallery.type)\t"
        stackView.spacing = 20
        for image in gallery.images {
            let containerView = UIView()
            containerView.layer.cornerRadius = 8
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.white.cgColor
            stackView.addArrangedSubview(containerView)
            let button = UIButton()
            button.setImage(image, for: .normal)
            button.setImage(image, for: .highlighted)
            containerView.addSubview(button)
            button.backgroundColor = .red
            containerView.translatesAutoresizingMaskIntoConstraints = false
            button.translatesAutoresizingMaskIntoConstraints = false
            button.imageView?.contentMode = .scaleAspectFill
            button.clipsToBounds = true
            button.layer.cornerRadius = 4
            NSLayoutConstraint.activate([
                containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1.366),
                button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
                button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
                button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
                button.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -20)
            ])
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    @objc func buttonTapped(_ button: UIButton) {
        let previewViewController = PreviewViewController()
        previewViewController.modalPresentationStyle = .fullScreen
        previewViewController.image = button.image(for: .normal)!
        present(previewViewController, animated: true)
    }
}
