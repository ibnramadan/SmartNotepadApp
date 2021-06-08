//
//  NoteDetailsViewController+ImagePickerDelegate.swift
//  SmartNotepadApp
//
//  Created by iMac on 07/06/2021.
//

import Foundation
import UIKit
import RealmSwift
extension NoteDetailsViewController  : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.\
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imagePickerManager?.saveToImagelocalStorage(image: image) { (imageName: String, imageURL: URL, imageSize: Double) in

             showSelectedImage(file: imageURL)
               
            }
            //dismiss(animated: true, completion: nil)
            picker.dismiss(animated: true, completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
//     func setNoteImage(imagePath:URL){
//        let noteImagePath = imagePath.absoluteString
//        let imageData:NSData = NSData(contentsOf: imagePath)!
//        let imageView = UIImageView(image: UIImage(data: imageData as Data))
//        imageView.frame = CGRect(x: 60, y: 10, width: 200, height: 100)
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.cornerRadius = 5
//        addPhotoView.addSubview(imageView)
//    }
    
    func showSelectedImage(file: Any){
        guard let url = file as? URL else { return }
            let imagePath = url.absoluteString
            //Getting Image Name
            let imageName = imagePath.components(separatedBy: "/").last ?? ""
        var finalURL = ""
        let realm = try! Realm()
            //Converting the RealmFile Path into Array of String to get the Path where realm file being saved in
            if let realmPathFile = realm.configuration.fileURL?.absoluteString.components(separatedBy: "/") {
                //Getting The Path without the realm file and append the image name so image wont be deleted during rebuild the app from Xcode
                let realmImagePath = Array(realmPathFile[0...realmPathFile.count - 2]).joined(separator: "/")
                finalURL = "\(realmImagePath)/\(imageName)"
                    print("Image Path: \(self.note?.imageURL ?? "")")
                }
           
            
            let size = CGSize(width: 200, height: 200)
            guard let imageURL = URL(string: finalURL) else { return }
            let downsampleImage = UIImage().downsample(imageAt: imageURL, to: size, scale: 1)
            self.noteImageView.image = downsampleImage
            self.noteImageView.isHidden = false
           self.noteImageBtn.isHidden = true
            self.noteURL  = finalURL
     
    }
}
