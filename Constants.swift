//
//  Constants.swift
//  Corona App
//
//  Created by Johnny Cheng on 17/04/20.
//  Copyright © 2020 Johnny Jafar. All rights reserved.
//

import Foundation

var todoList:[String]?

func saveData(todoList:[String]) {
    UserDefaults.standard.set(todoList, forKey: "todoList")
}

func fetchData() ->[String]? {
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String] {
        return todo
    } else {
        return nil
    }
}
