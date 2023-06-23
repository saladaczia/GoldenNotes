//
//  ViewerController.swift
//  GoldenNotes
//
//  Created by Maciej Sołoducha on 23/06/2023.
//

import UIKit

class ViewerController: UIViewController {

    var titleView: String?
    var descriptionView: String?
    
    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var descriptionViewLabel: UITextView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        titleViewLabel.text = titleView
        descriptionViewLabel.text = descriptionView

    }
    

}
