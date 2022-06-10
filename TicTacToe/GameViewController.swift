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
    var lastValue = "o"
    var playerChoices : [Box] = []
    var computerChoices : [Box] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTap(imageView: box1, box: .one)
        createTap(imageView: box2, box: .two)
        createTap(imageView: box3, box: .three)
        createTap(imageView: box4, box: .four)
        createTap(imageView: box5, box: .five)
        createTap(imageView: box6, box: .six)
        createTap(imageView: box7, box: .seven)
        createTap(imageView: box8, box: .eight)
        createTap(imageView: box9, box: .nine)
        
        
        

        if let name = playerName {
            playerNameLbl.text = name + ":"
        }
        // Do any additional setup after loading the view.
        
        
    }
    func createTap(imageView:UIImageView, box:Box) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(boxClicked(_:)))
        tap.name =  box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func boxClicked(_ sender: UITapGestureRecognizer) {
        let selectedBox = getBox(name: sender.name!)
        makeChoice(selectedBox)
        playerChoices.append(Box(rawValue: sender.name!)!)
        checkIfWon()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.computerPlay()
        }
        
        
    }
    
    func makeChoice(_ selectedBox:UIImageView) {
        
        guard selectedBox.image == nil else {return}
        
        if lastValue == "x" {
            selectedBox.image = UIImage(named: "oh")
            lastValue = "o"
        }else {
            selectedBox.image = UIImage(named: "ex")
            lastValue = "x"
        }
        
        //check if this is the winning move
        
        //check if there are more options available
    }
    
    func checkIfWon() {
        var correct = [[Box]]()
        let firstRow :[Box] = [.one,.two,.three]
        let secondRow :[Box] = [.four,.five,.six]
        let thirdRow :[Box] = [.seven,.eight,.nine]
        
        let firstCol :[Box] = [.one,.four,.seven]
        let secondCol :[Box] = [.two,.five,.eight]
        let thirdCol :[Box] = [.three,.six,.nine]
        
        let backwardSlash :[Box] = [.one,.five,.nine]
        let forwardSlash :[Box] = [.three,.five,.seven]
        correct.append(firstRow)
        correct.append(secondRow)
        correct.append(thirdRow)
        correct.append(firstCol)
        correct.append(secondCol)
        correct.append(thirdCol)
        correct.append(backwardSlash)
        correct.append(forwardSlash)
        for valid in correct {
            let userMatch = playerChoices.filter { valid.contains($0)}.count
            let computerMatch = computerChoices.filter { valid.contains($0)}.count
            
            if userMatch == valid.count{
                playerScoreLbl.text = String((Int(playerScoreLbl.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            }else if computerMatch == valid.count {
                computerScoreLbl.text = String((Int(computerScoreLbl.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            }else if computerChoices.count + playerChoices.count == 9 {
                resetGame()
                break
            }
            
        }
        
        
        
    }
    func resetGame(){
        for name in Box.allCases {
            let box = getBox(name: name.rawValue)
            box.image = nil
        }
        lastValue = "o"
        playerChoices = []
        computerChoices = []
    }
    
    func computerPlay() {
        var availableSpaces = [UIImageView]()
        var availableBoxes = [Box]()
        for name in Box.allCases {
            let box = getBox(name: name.rawValue)
            if box.image == nil {
                availableSpaces.append(box)
                availableBoxes.append(name)
                
                
            }
        }
        
        guard availableBoxes.count > 0 else {return}
        let randIndex = Int.random(in: 0 ..< availableSpaces.count)
        makeChoice(availableSpaces[randIndex] )
        computerChoices.append(availableBoxes[randIndex])
        checkIfWon()
    }
    
    
    func getBox(name:String) -> UIImageView {
        let box = Box(rawValue: name) ?? .one
        switch box {
        case .one:
            return box1
        case .two:
            return box2
        case .three:
            return box3
        case .four:
            return box4
        case .five:
            return box5
        case .six:
            return box6
        case .seven:
            return box7
        case .eight:
            return box8
        case .nine:
            return box9
       
        }
    }
    

    @IBAction func closedBtnClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
enum Box:String, CaseIterable {
     case one, two, three, four, five, six, seven, eight, nine
}
