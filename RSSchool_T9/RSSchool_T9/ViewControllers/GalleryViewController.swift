//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 31.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

final class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    let data = FillingData.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCellIdentifier")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.contentInset = UIEdgeInsets(top: 40, left: 20, bottom: 50, right: 20)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 56.0) / 2.0
        let height = width * (220.0 / 179.0)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCellIdentifier", for: indexPath) as! GalleryCollectionViewCell
        switch data[indexPath.row] {
        case .story(let story):
            cell.galleryImageView.image = story.coverImage
            cell.titleLabel.text = story.title
            cell.typeLabel.text = story.type
        case .gallery(let gallery):
            cell.galleryImageView.image = gallery.coverImage
            cell.titleLabel.text = gallery.title
            cell.typeLabel.text = gallery.type
        }
        return cell
    }
}
