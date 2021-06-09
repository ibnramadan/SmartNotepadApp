//
//  NoteCell.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//


import UIKit

class NoteCell: UITableViewCell  , NoteCellView{
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var bodyL: UILabel!
    @IBOutlet weak var nearestL: UILabel!
    @IBOutlet weak var locationImageV: UIImageView!
    @IBOutlet weak var noteImageV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func displayNoteTitle(title: String) {
        titleL.text = title
    }
    
    func displayNoteBody(body: String) {
        bodyL.text =  body
    }
    
    func displayNoteNearestL() {
        nearestL.isHidden = false
    }
    
    func displayNoteLocationImage() {
        locationImageV.isHidden = false
    }
    
    func displayNoteImage() {
        noteImageV.isHidden = false
    }
    
}
