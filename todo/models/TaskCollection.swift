//
//  TaskCollection.swift
//  todo
//
//  Created by 奥城健太郎 on 2019/01/19.
//  Copyright © 2019 奥城健太郎. All rights reserved.
//

import Foundation

protocol TaskCollectionDelegate: class {
    func saved()
}

class TaskCollection{

    static  let shared = TaskCollection()
    let userDefaults = UserDefaults.standard
    
    weak var delegate: TaskCollectionDelegate?
    
    var tasks: [Task] = []
    
    init(){
        self.load()
    }
    
    func addTask(title: String) {
        let task = Task()
        task.title = title
        self.tasks.append(task)
        save()
    }
    
    func save() {
        ///シリアル化
        let data = try! PropertyListEncoder().encode(tasks)
        userDefaults.set(data, forKey: "tasks")
        delegate?.saved()
    }
    
    func load() {
        if let data = userDefaults.data(forKey: "tasks"){
            let tasks = try! PropertyListDecoder().decode([Task].self, from:data)
            self.tasks = tasks
        }
        
    }

}

