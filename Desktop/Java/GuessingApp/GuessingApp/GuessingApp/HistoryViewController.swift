//
//  SecondViewController.swift
//  GuessingApp
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numGuesses()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history")!
        cell.textLabel?.text = "Correct Answer: " + String(Guesser.shared[indexPath.row].correctAnswer)
        cell.detailTextLabel?.text = "# Attempts: " + String(Guesser.shared[indexPath.row].numAttemptsRequired)
        return cell
    }
    @IBOutlet weak var SecondTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        SecondTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SecondTableView.dataSource = self
        SecondTableView.delegate = self
    }


}

