//
//  StatisticsViewController.swift
//  GuessingApp
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var MinLBL: UILabel!
    @IBOutlet weak var MaxLBL: UILabel!
    @IBOutlet weak var MeanLBL: UILabel!
    @IBOutlet weak var StdDevLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MinLBL.text = String(Guesser.shared.minimumNumAttempts())
        MaxLBL.text = String(Guesser.shared.maximumNumAttempts())
        var mean: Double = 0.0
        var total: Int = 0
        for i in 0..<Guesser.shared.numGuesses(){
            total = total + Guesser.shared.guess(index: i).numAttemptsRequired
        }
        if Guesser.shared.numGuesses() != 0{
            mean = Double(total)/Double(Guesser.shared.numGuesses())
        }
        MeanLBL.text = String(format: "%.2f", mean)
        StdDevLBL.text = String(format: "%.2f", Guesser.shared.stdDev())
    }
    
    @IBAction func ClearBtn(_ sender: Any) {
        MinLBL.text = "0"
        MaxLBL.text = "0"
        MeanLBL.text = "0"
        StdDevLBL.text = "0"
        Guesser.shared.clearStatistics()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
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
