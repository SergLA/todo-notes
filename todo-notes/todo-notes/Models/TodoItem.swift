//
//  TodoItem.swift
//  todo-notes
//
//  Created by Sergey Lantratov on 06/12/16.
//  Copyright © 2016 Sergey Lantratov. All rights reserved.
//

import UIKit
import RealmSwift

class TodoItem: Object
{
    dynamic var title: String = "";
    dynamic var date: NSDate?;
    dynamic var state: Int = 0;
    dynamic var notes: String = "";
}
