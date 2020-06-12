//
//  AddBookVC.swift
//  bookstore
//
//  Created by Foo Chi Siong on 12/06/2020.
//  Copyright © 2020 Foo Chi Siong. All rights reserved.
//

import UIKit
import RealmSwift

class AddBookVC: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnDone(_ sender: Any) {
        let newBookItem = Book()
        
        newBookItem.title = txtTitle.text!
        newBookItem.author = txtAuthor.text!
        newBookItem.desc = txtDesc.text!
        newBookItem.photo = "photopath"
        
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(newBookItem) 
        }
        
        
        let books = realm.objects(Book.self)
             
        
        print("Add book result: " + books.description)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
