//
//  ViewController.swift
//  PocketMoneyCounter
//
//  Created by Kim Alkalay on 18.05.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
// not sure I understand UITextFieldDelegate
// added ? to AVAudioPlayer, remind myself why later (or ask)
  var player: AVAudioPlayer?
  
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var deductButton: UIButton!
  @IBOutlet weak var budgetAmount: UILabel!
  @IBOutlet weak var moneyInputField: UITextField!

  
  override func viewDidLoad() {
    super.viewDidLoad()
 
  // gotta remind myself about "self" (or ask)
    moneyInputField.delegate = self
  
  }
  
  // does my input field need an IBAction too? it seems to be responsive already
  
  @IBAction func deductButtonTapped(_ sender: UIButton) {
    hideKeyBoard()
    calculateBudgetDeduct()
    //I want to change the button animation eventually
    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
       sender.alpha = 1.0
      
      
   }
  }
  
  @IBAction func addButtonTapped(_ sender: UIButton) {
    hideKeyBoard()
    calculateBudgetAdd()
    //I want to change the button animation eventually
    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
       sender.alpha = 1.0
   }
  }
  
  @IBAction func pigNoseTapped(_ sender: UIButton) {
    
    oinkSoundPlayed()
    
    //I want to change the button animation eventually
    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
       sender.alpha = 1.0
  }
    
    
    
    
    
    func oinkSoundPlayed(){
let url = Bundle.main.url(forResource: "oink", withExtension: "wav")
      player = try! AVAudioPlayer(contentsOf: url!)
player?.play()
  }
 }
  //func I copied from the internet to add a "done" to my keypad and it failed
  func addDoneButtonOnKeyboard() {
      let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
      doneToolbar.barStyle = UIBarStyle.default
    let flexSpace  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ViewController.doneButtonAction))

      var items = [UIBarButtonItem]()
      items.append(flexSpace)
      items.append(done)

      doneToolbar.items = items
      doneToolbar.sizeToFit()

      self.moneyInputField.inputAccessoryView = doneToolbar
  }

  @objc func doneButtonAction() {
      self.moneyInputField.resignFirstResponder()
  }
  func calculateBudgetAdd() {
     let addSubtotal = Float(moneyInputField.text! + budgetAmount.text!)
  }
  func calculateBudgetDeduct() {
     let deductSubtotal = Float(budgetAmount.text! - moneyInputField.text!)
  }
  //func for as long as I don't have "done" button, maybe even after, I'll think about it
  func hideKeyBoard() {
    moneyInputField.resignFirstResponder()
  }
}

// copied extention from the internet, don't understand everything (yet)
extension ViewController : UITextViewDelegate {
 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
   textField.resignFirstResponder()
   return true

}
}

