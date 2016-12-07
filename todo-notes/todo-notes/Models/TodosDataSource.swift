//
//  TodosDataSource.swift
//  todo-notes
//
//  Created by Sergey Lantratov on 06/12/16.
//  Copyright © 2016 Sergey Lantratov. All rights reserved.
//

import Foundation
import RealmSwift

//typealias DataChangeEvent: (_) -> _

class TodosDataSource
{
    static let sharedInstance = TodosDataSource();
    
    private let realm = try! Realm()
    private var realmNotificationToken: NotificationToken!
    private var eventList: Array<Selector> = []
    
    var items: Results<TodoItem> {
        get {
            return realm.objects(TodoItem);
        }
    };
    
    init()
    {
        self.realmNotificationToken = realm.addNotificationBlock { (notification, realm) in
            for callBack in self.eventList
            {
                callBack;
            }
        }
    }
    
    deinit
    {
        self.realmNotificationToken.stop();
    }
    
    
    // MARK: - Events handling
    
    func subscribe(callBack: Selector)
    {
        eventList.append(callBack);
    }
    
    func unsubscribe(callBack: Selector)
    {
        if let index = eventList.indexOf(callBack)
        {
            eventList.removeAtIndex(index);
        }
    }
    
    // MARK: - CRUD
    
    func add(item: TodoItem)
    {
        do
        {
            try realm.write {
                realm.add(item);
            }
            
            throw NSError(domain: "Some domain", code: 10, userInfo: nil);
        }
        catch let e as NSError
        {
            print("Error while TODO data adding: \(item), Error: \(e)");
        }
    }
    
    func delete(item: TodoItem)
    {
        do
        {
            try realm.write {
                realm.delete(item);
            }
        }
        catch let e as NSError
        {
            print("Error while TODO data removig: \(item), Error: \(e)");
        }
    }
}
