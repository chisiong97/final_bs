//
//  BookTableVC.swift
//  bookstore
//
//  Created by Foo Chi Siong on 12/06/2020.
//  Copyright © 2020 Foo Chi Siong. All rights reserved.
//

import UIKit
import Realm

class BookTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
}

class BookTableVC: UITableViewController {
    
    var books : RLMResults<AnyObject> {
        get{
            return Book.allObjects()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Int(books.count)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell

        // Configure the cell...
        let index = UInt(indexPath.row)
        let bookItem = books.object(at: index) as! Book
        
        cell.lblTitle.text = bookItem.title
        cell.lblAuthor.text = bookItem.author
        cell.imgPhoto.image = UIImage(contentsOfFile: bookItem.photo as String)
        
        return cell
    }

}
