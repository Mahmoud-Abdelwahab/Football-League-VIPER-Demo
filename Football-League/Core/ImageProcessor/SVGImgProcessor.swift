//
//  SVGImgProcessor.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import UIKit
import Kingfisher
import SVGKit

public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.mahoudabdelwahab199390.Football-League.Football-League"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
