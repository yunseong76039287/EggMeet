//
//  SignUpSelfIntroduceViewController.swift
//  EggMeet
//
//  Created by asong on 2022/01/01.
//

import Foundation
import UIKit

class SignUpSelfIntroduceVC: UIViewController {
    @IBOutlet weak var selfIntroduceTextView: UITextView!
    @IBOutlet weak var textViewCountLabel: UILabel!
    let selfIntroduceKey = "description"
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextViewStyle()
        self.navigationItem.title = "자기 소개";
        self.navigationController?.navigationBar.tintColor = .black
        selfIntroduceTextView.layer.borderColor = UIColor.systemGray4.cgColor
        selfIntroduceTextView.layer.cornerRadius = 10
        self.navigationController?.navigationBar.topItem?.title = ""
        selfIntroduceTextView.delegate = self
    }
    
    @IBAction func windSignUpMentoAreaSelectionView(_ sender: Any){
        ud.set(self.selfIntroduceTextView.text, forKey: selfIntroduceKey)
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpMentoAreaSelectionVC") as? SignUpMentoAreaSelectionVC else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func skipAndWindSignUpMentoAreaSelectionView(_ sender: Any){
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpMentoAreaSelectionVC") as? SignUpMentoAreaSelectionVC else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func setTextViewStyle(){
        self.selfIntroduceTextView.layer.borderWidth = 1.0
        self.selfIntroduceTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.selfIntroduceTextView.endEditing(true)
        }
}

extension SignUpSelfIntroduceVC : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.textViewCountLabel.text = "\(self.selfIntroduceTextView.text.count)/500"
        if selfIntroduceTextView.text.count != 0 {
            // enable image
        } else {
            // disable image
        }
        if selfIntroduceTextView.text.count > 500{
            self.selfIntroduceTextView.deleteBackward()
        }
    }
}
