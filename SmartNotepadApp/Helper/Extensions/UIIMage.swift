//
//  UIIMage.swift
//  SmartNotepadApp
//
//  Created by iMac on 08/06/2021.
//

import UIKit
extension UIImage {
    func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) -> UIImage {
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        
        if let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions) {
            let maxDimentionInPixels = max(pointSize.width, pointSize.height) * scale
            
            let downsampledOptions = [kCGImageSourceCreateThumbnailFromImageAlways: true,
                                      kCGImageSourceShouldCacheImmediately: false,
                                      kCGImageSourceCreateThumbnailWithTransform: true,
                                      kCGImageSourceThumbnailMaxPixelSize: maxDimentionInPixels] as CFDictionary

            guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampledOptions) else { return #imageLiteral(resourceName: "image")}
            
            return UIImage(cgImage: downsampledImage)
        } else {
            return #imageLiteral(resourceName: "icons8-full_image")
        }
        
        
    }
}
