//
//  FirstPostCell.swift
//  networkingExamples
//
//  Created by fedir on 28.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class FirstPostCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func conFigureCell(_ post: Post){
        
        titleLabel.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        titleLabel.textColor = .white
        titleLabel.text = post.title
        bodyView.text = post.body 
        bodyView.textColor = .red
    }

  
    
}
