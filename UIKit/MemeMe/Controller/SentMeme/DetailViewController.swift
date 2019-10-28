//
//  DetailViewController.swift
//  MemeMe
//
//  Created by David Chea on 14/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    // MARK: Properties
    
    var memedImage: UIImage!
    
    // MARK: Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailImageView.image = memedImage
    }
}
