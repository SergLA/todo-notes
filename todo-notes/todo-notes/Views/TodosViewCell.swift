//
//  TodosViewCell.swift
//  todo-notes
//
//  Created by Sergey Lantratov on 06/12/16.
//  Copyright © 2016 Sergey Lantratov. All rights reserved.
//

import UIKit

class TodosViewCell: UITableViewCell
{
    static private let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func Setup(item: TodoItem)
    {
        self.titleLabel.text = item.title;
        if (item.date != nil)
        {
            self.dateLabel.text = TodosViewCell.dateFormatter.stringFromDate(item.date!);
        }
        else
        {
            self.dateLabel.text = "Undefined";
        }
        
        self.dateLabel.text = item.notes;
    }
}
