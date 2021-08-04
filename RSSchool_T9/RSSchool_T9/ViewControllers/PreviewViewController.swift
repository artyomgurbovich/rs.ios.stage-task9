//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class PreviewViewController: UIViewController, UIScrollViewDelegate {
    
    var image = UIImage(named: "minsk-0")!
    let scrollView = UIScrollView()
    let imageView = UIImageView()
    let closeButton = UIButton()
    var tapGestureRecognizer: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
        tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .black
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        imageView.image = image
        view.addSubview(closeButton)
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
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
        ])
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = scrollView.minimumZoomScale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapped() {
        closeButton.isHidden.toggle()
    }
}
