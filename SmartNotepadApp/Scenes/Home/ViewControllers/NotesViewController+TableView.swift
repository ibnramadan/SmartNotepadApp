//
//  NotesViewController+TableView.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import UIKit
// MARK: - UITableView Delegate
extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupTableView() {
        NotesTableView.delegate = self
        NotesTableView.dataSource = self
        NotesTableView.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNotesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell
        
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell
        presenter.didSelectRow(cell: cell, for: indexPath.row)
    }
    
    
}
