//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mehmet Bilir on 10.06.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var enterView: UIView!
    @IBOutlet weak var nameFld: UITextField!
    @IBOutlet weak var startBtn: UIButton!
    var playerName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        startBtn.layer.cornerRadius = 10
        enterView.layer.cornerRadius = 10
        enterView.layer.shadowOpacity = 0.4
        enterView.layer.shadowColor = UIColor.black.cgColor
        enterView.layer.shadowRadius = 10
        enterView.layer.shadowOffset = .zero
    }
    @IBAction func startBtnClicked(_ sender: Any) {
        guard !nameFld.text!.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        let controller = storyboard?.instantiateViewController(withIdentifier: "gameScene") as! GameViewController
        controller.playerName = nameFld.text
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    
    
    
    
    
}

