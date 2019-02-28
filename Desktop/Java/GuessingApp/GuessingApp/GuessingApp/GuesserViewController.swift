//
//  FirstViewController.swift
//  GuessingApp
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//
import UIKit

class GuesserViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var guessTF: UITextField!
    @IBOutlet weak var resultLBL: UILabel!
    @IBAction func btn1(_ sender: Any) {
        if let ans = Int(guessTF.text!){
            let result = Guesser.shared.amIRight(guess: Int(ans))
            resultLBL.text = result.rawValue
            if result == Result.correct{
                resultLBL.textColor = UIColor.green
                displayMessage()
                Guesser.shared.createNewProblem()
            }else if result == Result.tooHigh || result == Result.tooLow{
                 resultLBL.textColor = UIColor.red
            }
        }
    }
    @IBAction func btn2(_ sender: Any) {
        resultLBL.text = ""
        guessTF.text = ""
        Guesser.shared.createNewProblem()
    }
   
    
    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

