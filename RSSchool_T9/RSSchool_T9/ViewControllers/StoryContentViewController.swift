//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryContentViewController: ContentViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var story: Story!
    var collectionView: UICollectionView!
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = story.coverImage
        titleLabel.text = story.title
        typeLabel.text = "\t\(story.type)\t"
        stackView.spacing = 40
        textView.text = story.text
        textView.textColor = .white
        textView.font = UIFont(name: "Rockwell-Regular", size: 24)
        textView.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.borderWidth = 1
        textView.isEditable = false
        let collectionViewFlowControl = UICollectionViewFlowLayout()
        collectionViewFlowControl.scrollDirection = .horizontal
        collectionViewFlowControl.minimumLineSpacing = 100
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowControl)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCellIdentifier")
        collectionView.delegate = self
        collectionView.dataSource = self
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(textView)
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return story.paths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCellIdentifier", for: indexPath)
        if cell.layer.sublayers!.count > 1 {
            cell.layer.sublayers![1].removeFromSuperlayer()
        }
        cell.layer.addSublayer(createAnimation(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell.layer.sublayers!.count > 1 {
            cell.layer.sublayers![1].removeFromSuperlayer()
        }
        cell.layer.addSublayer(createAnimation(index: indexPath.row))
    }
    
    func createAnimation(index: Int) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.path = story.paths[index]
        shape.strokeColor = UIColor(named: UserDefaults.standard.value(forKey: "currentColor") as! String)!.cgColor
        shape.lineWidth = 0.5
        shape.fillColor = nil
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration =  UserDefaults.standard.bool(forKey: "drawStories") ? 3.0 : 0.0
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        shape.add(pathAnimation, forKey: "strokeEnd")
        return shape
    }
}
