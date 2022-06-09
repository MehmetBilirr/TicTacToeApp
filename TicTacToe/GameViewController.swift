//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Mehmet Bilir on 10.06.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var computerScoreLbl: UILabel!
    @IBOutlet weak var playerScoreLbl: UILabel!
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    @IBOutlet weak var box5: UIImageView!
    @IBOutlet weak var box6: UIImageView!
    @IBOutlet weak var box7: UIImageView!
    @IBOutlet weak var box8: UIImageView!
    @IBOutlet weak var box9: UIImageView!
    var playerName: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = playerName {
            playerNameLbl.text = name + ":"
        }
        // Do any additional setup after loading the view.
        
        
    }
    

    @IBAction func closedBtnClicked(_ sender: UIButton) {
    }
    

}
