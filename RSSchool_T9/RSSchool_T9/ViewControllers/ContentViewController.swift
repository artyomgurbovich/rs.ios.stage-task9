//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ContentViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.51, 1.0]
        mainImageView.layer.insertSublayer(gradient, at: .zero)
        return gradient
    }()
    
    let closeButton = UIButton()
    let mainImageView = UIImageView()
    let titleLabel = UILabel()
    let typeLabel = UILabel()
    let lineView = UIView()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setupScrollView()
        setupBaseUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
        gradientLayer.frame = mainImageView.bounds
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func setupBaseUI() {
        contentView.backgroundColor = .black
        contentView.addSubview(closeButton)
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(stackView)
        
        closeButton.addTarget(self, action: #selector(closeTapped), for: UIControl.Event.touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .white
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 20
        closeButton.layer.borderWidth = 1
        closeButton.layer.borderColor = UIColor.white.cgColor
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
        ])
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.image = UIImage(named: "minsk-0")!
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 8
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.white.cgColor
        NSLayoutConstraint.activate([
            mainImageView.widthAnchor.constraint(equalTo: mainImageView.heightAnchor, multiplier: 0.748),
            mainImageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 48)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = .zero
        titleLabel.text = "Title"
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 58),
            titleLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -30),
            titleLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -55)
        ])
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
        typeLabel.textColor = .white
        typeLabel.numberOfLines = .zero
        typeLabel.clipsToBounds = true
        typeLabel.layer.cornerRadius = 8
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.borderColor = UIColor.white.cgColor
        typeLabel.text = "\tType\t"
        typeLabel.backgroundColor = .black
        NSLayoutConstraint.activate([
            typeLabel.heightAnchor.constraint(equalToConstant: 40),
            typeLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -20),
            typeLabel.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor),
        ])
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .white
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5169),
            lineView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 58),
            lineView.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor),
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
        ])
    }
    
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
}
