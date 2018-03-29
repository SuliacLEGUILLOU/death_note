//
//  ViewController.swift
//  d02
//
//  Created by Suliac LE-GUILLOU on 3/28/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, EditDelegate {

    let editController = EditController()
    
    /*let button: UIButton = {
        let button = UIButton()
        button.setTitle("PUSH", for: .normal)
        button.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        button.titleLabel?.textColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()*/
    
    private let reuseid = "reussi"
    
    var deathList: [Target] = [
        Target(name: "bob", date: Date(), desc: "Mort de deces"),
        Target(name: "bob1", date: Date(), desc: "Mort de deces"),
        Target(name: "bob2", date: Date(), desc: "Mort de deces lorem lipsum est macarena del patator je sais pas")
    ]
    
    private func setupConstraint() {
        /*button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Death List"

        //view.addSubview(button)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItem = addButton
        
        print("HALLO")
        
        tableView.register(ListCell.self, forCellReuseIdentifier: reuseid)
        
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        editController.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deathList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.frame.height / 8)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseid, for: indexPath) as! ListCell
        
        cell.item = deathList[indexPath.item]
        print("Added cell")
        return cell
    }
    
    @objc func handleAdd() {
        editController.item = nil
        navigationController?.pushViewController(editController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editController.item = indexPath.item
        navigationController?.pushViewController(editController, animated: true)
    }
    
    func addDeath(_ t: Target) {
        self.deathList.append(t)
        tableView.reloadData()
    }
    
    func editDeath(_ t: Target, id: Int) {
        deathList[id] = t
        tableView.reloadData()
    }
    
}

