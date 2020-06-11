//
//  Book.swift
//  bookstore
//
//  Created by Foo Chi Siong on 12/06/2020.
//  Copyright © 2020 Foo Chi Siong. All rights reserved.
//

import UIKit
import Realm

class Book: RLMObject {
    dynamic var title = ""
    dynamic var author = ""
    dynamic var desc = ""
    dynamic var photo = ""
}
