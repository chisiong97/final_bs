//
//  BookTableVC.swift
//  bookstore
//
//  Created by Foo Chi Siong on 12/06/2020.
//  Copyright © 2020 Foo Chi Siong. All rights reserved.
//

import UIKit
import RealmSwift

class BookTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
}

class BookTableVC: UITableViewController {
    
    var realm : Realm!
    
    var books: Results<Book> {
      get {
        return realm.objects(Book.self)
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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
        // Configure the cell...
        
        let bookItem = books[indexPath.row]
        cell.lblTitle?.text = bookItem.title
        cell.lblAuthor?.text = bookItem.author
        cell.imgPhoto.image = UIImage(contentsOfFile: bookItem.photo as String)
        print("Cell: " + bookItem.title)
       
        
        return cell
    }

}
