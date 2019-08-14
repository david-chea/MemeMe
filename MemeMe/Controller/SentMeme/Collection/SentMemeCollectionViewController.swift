//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by David Chea on 13/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: Properties
    
    var memes: [Meme]!
    
    // MARK: Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memes = (UIApplication.shared.delegate as! AppDelegate).memes
        collectionView.reloadData()
    }
    
    // MARK: Controller methods
    
    // Tell the data source to return the number of items in the screen
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    // Fill all items in the screen
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
        
        // Get the appropriate Meme object
        let meme = memes[(indexPath as NSIndexPath).row]
        
        // Fill the cell
        cell.collectionImageView.image = meme.memedImage
        
        return cell
    }
    
    // Tell the controller that the specified item is now selected so it will display the related meme
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Get the view controller that will display the meme
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        
        // Set the meme to this view controller
        detailViewController.memedImage = memes[(indexPath as NSIndexPath).row].memedImage
        
        // Display the view
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
