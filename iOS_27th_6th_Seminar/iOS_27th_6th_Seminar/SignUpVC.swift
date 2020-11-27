//
//  SignUpVC.swift
//  iOS_27th_6th_Seminar
//
//  Created by 장서현 on 2020/11/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func touchUpSignup(_ sender: Any) {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text,
              let userNameText = usernameTextField.text else{
            return
        }
        print(emailText, passwordText, userNameText)
        AuthService.shared.signUp(email: emailText, password: passwordText, userName: userNameText) { (networkResult) in
            switch networkResult {
            case .success(let data):
                if let data = data as? SignUpData {
                    self.simpleAlert(title: "회원가입 성공", message: "\(data.userName)님 회원가입 성공!")
                    UserDefaults.standard.set(data.userName, forKey: "userName")
                }
                print("success")
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "회원가입 실패", message: message)
                }
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
}
