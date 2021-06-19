//
//  ViewController.swift
//  Corona App
//
//  Created by Johnny Cheng on 15/04/20.
//  Copyright © 2020 Johnny Jafar. All rights reserved.
//

import UIKit

var randomNumber = Int.random(in: 0...5)

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var quoteController: UILabel!
    var quotes = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: "\(randomNumber)")
        quotes.append("Have a productive and fun day")
        quotes.append("Stay motivated and have fun")
        quotes.append("Make someone smile and laugh today")
        quotes.append("Be productive instead of being busy")
        quotes.append("Make today worthwhile")
        quotes.append("Stay positive")
        quoteController.text = quotes[randomNumber]
        Thread.sleep(forTimeInterval: 0.5)
        }
}

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var backgroundImageView2: UIImageView!
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        backgroundImageView2.image = UIImage(named: "\(randomNumber)")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = todoList{
            return list.count
        } else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.font = UIFont(name:"Futura", size:22)
        cell.contentView.backgroundColor = UIColor.white
        cell.textLabel?.textColor = UIColor.black
        if let list = todoList{
            cell.textLabel?.text = list[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoList?.remove(at: indexPath.row)
                tableView.reloadData()
            }
    }
    @IBAction func cancelTask(_ segue: UIStoryboardSegue){
    }
 
}


class ViewControllerNotification: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBAction func addPressed(_ sender: UIButton) {
        if(textView.text != nil) && textView.text != ""{
            todoList?.append(textView.text)
            textView.text = ""
        }
    }
    @IBOutlet weak var backgroundImageViewNotification: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.delegate = self
        backgroundImageViewNotification.image = UIImage(named: "\(randomNumber)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}



