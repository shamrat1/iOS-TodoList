//
//  NewTaskViewController.swift
//  TodoList
//
//  Created by Mac on 1/27/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
extension UIViewController{
    func hideKeyboardOnTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
class NewTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var editText: UITextField!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var datePickerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var doneButtonOutlet: UIBarButtonItem!
    
    var dueDate = Date()
    var reminder = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        editText.becomeFirstResponder()
        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-mm-dd hh:mm"
        datePickerView.isHidden = true
        datePickerLabel.text = dateFormatter.string(from: dueDate)
    }
    
    
    // MARK:- Text Field Delegate Start
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let oldText = editText.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)

            if newText.isEmpty {
            doneButtonOutlet.isEnabled = false
            } else {
            doneButtonOutlet.isEnabled = true
            }
            return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneButtonOutlet.isEnabled = false
        return true
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        print("\(dueDate) \n \(reminder) \n \(editText.text!)")
        
        scheduleNotification()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onChangeDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-mm-dd hh:mm"
        datePickerLabel.text = dateFormatter.string(from: sender.date)
        dueDate = sender.date
    }
    
    @IBAction func reminderSwich(_ sender: UISwitch) {
        if sender.isOn == true {
            datePickerView.isHidden = false
            reminder = true
        }else{
            datePickerView.isHidden = true
            reminder = false
        }
    }
    
    func scheduleNotification(){
        if reminder && dueDate > Date(){
            print("Scheduling Notification")
            let content = UNMutableNotificationContent()
            content.title = "You've a task in pending."
            content.body = "You're task is : \(editText.text!)"
            content.sound = UNNotificationSound.default
            
            let calender = Calendar(identifier: .gregorian)
            let components = calender.dateComponents([.year,.month,.day,.hour,.minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "MyReminder", content: content, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.add(request)
            print("added")
        }
    }
    

}
