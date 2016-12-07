//
//  TodosViewController.swift
//  todo-notes
//
//  Created by Sergey Lantratov on 06/12/16.
//  Copyright © 2016 Sergey Lantratov. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated);
        
        TodosDataSource.sharedInstance.subscribe(#selector(reloadDataOnUpdate));
        reloadDataOnUpdate();
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        TodosDataSource.sharedInstance.unsubscribe(#selector(reloadDataOnUpdate));
        
        super.viewWillDisappear(animated);
    }
    
    // MARK: UITableViewDataSource metods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TodosDataSource.sharedInstance.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodosViewCell", forIndexPath: indexPath) as! TodosViewCell;
        
        cell.Setup(TodosDataSource.sharedInstance.items[indexPath.row]);
        
        return cell;
    }
    
    // MARK: UITableViewDelegate metods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("NavigateFromTodosToTodoDetails", sender: self);
    }
    
    // MARK: Actions
    
    @IBAction func addNewAction(sender: UIBarButtonItem)
    {
        let newItem = TodoItem();
        newItem.title = NSDate().description;
        newItem.date = NSDate();
        newItem.state = 1;
        
        TodosDataSource.sharedInstance.add(newItem);
    }
    
    func reloadDataOnUpdate()
    {
        tableView.reloadData();
    }
}

