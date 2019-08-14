//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by David Chea on 13/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    
    var memes: [Meme]!
    
    // MARK: Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memes = (UIApplication.shared.delegate as! AppDelegate).memes
        tableView.reloadData()
    }
    
    // MARK: Protocol methods
    
    // Tell the data source to return the number of rows in the screen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    // Fill all rows in the screen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")!
        
        // Get the appropriate Meme object
        let meme = memes[(indexPath as NSIndexPath).row]
        
        // Fill the cell
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = "\(meme.topText)... \(meme.bottomText)"
        
        return cell
    }
    
    // Tell the delegate that the specified row is now selected and display the related meme
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the view controller that will display the meme
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        
        // Set the meme to this view controller
        detailViewController.memedImage = memes[(indexPath as NSIndexPath).row].memedImage
        
        // Display the view
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
