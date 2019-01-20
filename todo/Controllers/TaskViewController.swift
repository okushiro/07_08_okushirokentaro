//
//  TaskViewController.swift
//  todo
//
//  Created by 奥城健太郎 on 2019/01/19.
//  Copyright © 2019 奥城健太郎. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    let taskCollection = TaskCollection.shared

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        userDefaults.set("piyo", forKey: "hogehoge")
//
//        let hoge = userDefaults.string(forKey: "hogehoge")
//        print(hoge)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchSaveButton(_ sender: Any) {
        guard let title = titleTextField.text else{
            return
        }
        
        if title.isEmpty{
            showAlert("タイトルを入力してください")
            return
        }
        
        taskCollection.addTask(title: title)
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(_ text: String){
        let alertController = UIAlertController(title: text, message: nil , preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) -> Void in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
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
