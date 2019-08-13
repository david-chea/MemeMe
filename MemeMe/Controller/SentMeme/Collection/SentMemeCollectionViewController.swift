//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by David Chea on 13/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController {
    
    var memes = (UIApplication.shared.delegate as! AppDelegate).memes
}
