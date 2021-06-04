//
//  NotesViewController.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import UIKit

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
