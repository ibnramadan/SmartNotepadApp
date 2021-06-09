//
//  NotesViewController.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import UIKit
import RealmSwift
import CoreLocation
class NotesViewController: UIViewController {
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var NotesTableView: UITableView!
    @IBOutlet weak var backGroundView: UIView!
    
    var presenter: NotesViewControllerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter = NotesViewControllerPresenter(view: self)
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.viewDidLoad()
    }
    
    @IBAction func addNewNoteBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "NoteDetailsViewController") as! NoteDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

// MARK: - CLLocationManagerDelegate
extension NotesViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            presenter.sortNotes(location: locations.first!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
