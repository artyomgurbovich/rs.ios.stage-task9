//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Artyom Gurbovich
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation

struct AdditionalData {
    static let data: [ContentType] = [
        .story(Story(coverImage: .init("story-5"),
                     title: "Norway",
                     text: "Norway, officially the Kingdom of Norway, is a Nordic country in Northern Europe whose mainland territory comprises the western and northernmost portion of the Scandinavian Peninsula. The remote Arctic island of Jan Mayen and the archipelago of Svalbard also form part of Norway. Bouvet Island, located in the Subantarctic, is a dependency of Norway; it also lays claims to the Antarctic territories of Peter I Island and Queen Maud Land.",
                     paths: [.story5path1])),
        .story(Story(coverImage: .init("story-6"),
                     title: "Solar System",
                     text: "The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets, with the remainder being smaller objects, the dwarf planets and small Solar System bodies. Of the objects that orbit the Sun indirectly—the natural satellites—two are larger than the smallest planet, Mercury.",
                     paths: [.story6path1])),
        .gallery(Gallery(coverImage: .init("forest-0"),
                         title: "Forest",
                         images: .init(base: "forest",
                         count: 3))),
        .gallery(Gallery(coverImage: .init("art-0"),
                         title: "Art",
                         images: .init(base: "art",
                         count: 3))),
    ]
}

extension CGPath {
    static let story5path1: CGPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 60, y: 60))
        path.addCurve(to: CGPoint(x: 60, y: 60), controlPoint1: CGPoint(x: 60, y: 60), controlPoint2: CGPoint(x: 10, y: 10))
        path.close()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: 10, y: 10), controlPoint2: CGPoint(x: 60, y: 60))
        path.close()
        return path.cgPath
    }()
    
    static let story6path1: CGPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: 60, y: 60), controlPoint2: CGPoint(x: 10, y: 10))
        path.close()

        return path.cgPath
    }()
}


