//
//  ListCell.swift
//  d02
//
//  Created by Suliac LE-GUILLOU on 3/29/18.
//  Copyright © 2018 Suliac LE-GUILLOU. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var item: Target? {
        didSet {
            label.text = "\(item!.name), \(item!.date)"
            deathcription.text = "\(item!.desc)"
        }
    }
    
    private let label:UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let deathcription: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(label)
        addSubview(deathcription)
        
        label.adjustsFontSizeToFitWidth = true
        deathcription.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        deathcription.adjustsFontSizeToFitWidth = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
