//
//  ViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/16/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Night sky-png")!)
        
        loadQuizData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadQuizData() {
        
    //Multiple Choice Data
        
        if let pathMC = Bundle.main.path(forResource: "MultipleChoice", ofType: "plist") {
            if let dictMC = NSDictionary(contentsOfFile: pathMC) as? [String: AnyObject] {
                mcArray = dictMC["Questions"] as? Array
            }
        }
        
    //Single Choice Data
        
        if let pathSC = Bundle.main.path(forResource: "SingleChoice", ofType: "plist") {
            if let dictSC = NSDictionary(contentsOfFile: pathSC) as? [String: AnyObject] {
                scArray = dictSC["Questions"] as? Array
            }
        }
    //Right Or Wrong Data

        if let pathROW = Bundle.main.path(forResource: "RightOrWrong", ofType: "plist") {
            if let dictROW = NSDictionary(contentsOfFile: pathROW) as? [String: AnyObject] {
                rowArray = dictROW["Questions"] as? Array
            }
        }

    //Image Quiz Data

        if let pathIMG = Bundle.main.path(forResource: "ImageQuiz", ofType: "plist") {
            if let dictIMG = NSDictionary(contentsOfFile: pathIMG) as? [String: AnyObject] {
                imgArray = dictIMG["Questions"] as? Array
            }
        }
        
        check()
    }
    
    func check() {
        print(mcArray as Any)
        print(scArray as Any )
        print(imgArray as Any)
        print(rowArray as Any)
    }


}

