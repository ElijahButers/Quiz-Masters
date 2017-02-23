//
//  SettingsViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/20/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var gameModeButtons: [UIButton]!
    
    @IBAction func gameModeButtonHadler(_ sender: UIButton) {
        
        for button in gameModeButtons {
            if sender != button {
                button.alpha = 0.7
            } else {
                button.alpha = 1.0
                gameMode = button.tag
            }
        }
    }
    @IBAction func playButtonHandler(_ sender: UIButton) {
        
        var vc: UIViewController?
        switch gameMode {
        case 0:
            vc = storyboard?.instantiateViewController(withIdentifier: "multipleChoiceViewController") as! MultipleChoiceViewController
            break
        case 1:
            vc = storyboard?.instantiateViewController(withIdentifier: "rightOrWrongViewController") as! RightOrWrongViewController
            break
        case 2:
            vc = storyboard?.instantiateViewController(withIdentifier: "inputViewController") as! InputViewController
            break
        case 3:
            vc = storyboard?.instantiateViewController(withIdentifier: "imageViewController") as! ImageViewController
            break
        default:
            break
        }
        
        if vc != nil {
        navigationController?.pushViewController(vc!, animated: true)
        }
    }

    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Night sky-png")!)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        for (idx, button) in gameModeButtons.enumerated() {
            button.tag = idx
            if button.tag != 0 {
                button.alpha = 0.7
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
