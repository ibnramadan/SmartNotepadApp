//
//  NoteDetailsViewController.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import UIKit
import CoreLocation
class NoteDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTView: UITextView!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var noteImageBtn: UIButton!
    @IBOutlet weak var noteImageView: UIImageView!
    
    var presenter: NoteDetailsPresenter!
    var note:NoteModel?
    var noteLat:Double?
    var noteLong:Double?
    var noteURL:String?
    var noteAddress:String?
    var locationManager = CLLocationManager()
    var imagePickerManager: ImagePickerManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = NoteDetailsPresenter(view: self)
        configureView()
    }
    
    @IBAction func addLocationBtnPressed(_ sender: Any) {
        setupLocation()
    }
    
    @IBAction func addPhotoBtnPressed(_ sender: Any) {
        self.imagePickerManager?.checkPhotoLibraryPermission()
    }
    
    
    @IBAction func saveNoteBtnPressed(_ sender: Any) {
        
        if note == nil {
            
            guard let noteTitle =  titleTF.text , !noteTitle.isEmpty , let noteBody =  bodyTView.text , !(noteBody == "Note Body Here") else {
                let alert = UIAlertController(title: "Error", message: "Please fill all fiedls", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            presenter.addNote(noteTitle: self.titleTF.text ?? "", notebody: self.bodyTView.text ?? "", lat: noteLat ?? 0.0, long: noteLong ?? 0.0, noteAddress: noteAddress ?? "", noteImageURL: noteURL ?? "")
            
            
        }else {
            presenter.editNote(noteTitle: self.titleTF.text ?? "", notebody: self.bodyTView.text ?? "", lat: noteLat ?? 0.0, long: noteLong ?? 0.0, noteAddress: noteAddress ?? "", noteImageURL: noteURL ?? "" , createdAt: self.note?.createdAt ?? Date())
        }
    }
    
    
    
    @IBAction func deleteNoteBtnPressed(_ sender: Any) {
        presenter.deleteNote(note: note!)
        
    }
}


extension NoteDetailsViewController {
    
    
    
    func configureView() {
        self.imagePickerManager = ImagePickerManager(imagePickerController: UIImagePickerController(), viewController: self, delegate: self)
        if note != nil {
            titleTF.text = note?.title
            bodyTView.text = note?.body
            if let location = note?.locationAddress {
                locationBtn.setTitle(location, for: .normal)
            }
            if let path = note?.imageURL, let url = URL(string: path) {
                self.showSelectedImage(file: url)
            }
        }else {
            bodyTView.delegate = self
            bodyTView.textColor = .lightGray
            self.navigationItem.rightBarButtonItems?[1] = UIBarButtonItem()
            
        }
    }
}


// MARK: - UITextViewDelegate
extension NoteDetailsViewController:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Note Body Here" && textView.textColor == UIColor.lightGray {
            textView.text = nil
        }
        textView.textColor = UIColor.black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Note Body Here"
            textView.textColor = UIColor.lightGray
        }
    }
}
