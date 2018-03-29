//
//  EditControler.swift
//  d02
//
//  Created by Suliac LE-GUILLOU on 3/28/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

protocol EditDelegate: class {
    func addDeath(_ t: Target )
    func editDeath(_ t: Target, id: Int )
}

class EditController: UIViewController {
    
    var item: Int? {
        didSet {
            if item == nil {
                self.title = "New"
                
                print("IS NOT SET")
            } else {
                self.title = "Edit"
                print("IS SET")
            }
        }
    }
    
    let namePicker: UITextField = {
        let field = UITextField()
        field.placeholder = "name"
        field.backgroundColor = .orange
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.minimumDate = Date()
        dp.backgroundColor = .green
        dp.translatesAutoresizingMaskIntoConstraints = false
        
        return dp
    }()
    
    let descPicker: UITextField = {
        let field = UITextField()
        field.placeholder = "How ?"
        field.backgroundColor = .red
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    weak var delegate: EditDelegate?
    
    private func setupConstraint() {
        namePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        namePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        namePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        namePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        datePicker.topAnchor.constraint(equalTo: namePicker.bottomAnchor).isActive = true
        
        descPicker.topAnchor.constraint(equalTo: datePicker.bottomAnchor).isActive = true
        descPicker.heightAnchor.constraint(equalToConstant: 500).isActive = true
        descPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        descPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneButton
        
        view.addSubview(namePicker)
        view.addSubview(datePicker)
        view.addSubview(descPicker)
        
        setupConstraint()
    }
    
    @objc func handleDone() {
        let target: Target = Target(name: namePicker.text!, date: datePicker.date, desc: descPicker.text!)
        
        if target.name != "" {
            if item == nil {
                delegate?.addDeath(target)
            } else {
                delegate?.editDeath(target, id: item!)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
