//
//  NoteCell.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit

class NoteCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
