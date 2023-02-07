//
//  ViewController.swift
//  WelcomeScreenUI
//
//  Created by sixpep on 06/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    var checkBox = CheckBoxButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        confCheckBox()
    }
    
    func configureUI(){
        view.layer.addSublayer(background)
        view.addSubview(welcomeLabel)
        view.addSubview(signInLabel)
        view.addSubview(imageView)
        view.addSubview(userName)
        view.addSubview(passwordName)
        view.addSubview(rememberLabel)
        view.addSubview(forgotPassword)
    }
    
    var background:CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemGreen.cgColor,
            UIColor.systemBlue.cgColor]
        view.layer.addSublayer(gradientLayer)
        return gradientLayer
    }
    
    var welcomeLabel:UILabel{
        let welcomeLabel = UILabel(frame: CGRect(x: (view.frame.width - 250)/2, y: view.frame.height * 0.15, width: 250, height: 40))
        //welcomeLabel.center = CGPoint(x: 190, y: 220)
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 50)
        welcomeLabel.text = "Welcome"
        welcomeLabel.textColor = UIColor.white
        return welcomeLabel
    }
    
    var signInLabel:UILabel{
        let signInLabel = UILabel(frame: CGRect(x: (view.frame.width - 250)/2, y: welcomeLabel.frame.maxY + 8, width: 250, height: 20))
        signInLabel.textAlignment = .center
        signInLabel.font = UIFont.boldSystemFont(ofSize: 17)
        signInLabel.text = "sign in to continue"
        signInLabel.textColor = UIColor.white
        return signInLabel
    }
    var imageView:UIImageView{
        let imageView = UIImageView(frame: CGRect(x: (view.frame.width - 120) / 2, y: signInLabel.frame.maxY + 50, width: 120, height: 120))
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .gray
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        return imageView
    }
    
    var userName:UITextField{
        let userName = addTextField(placeHolder: "     Username", leftImageStr: "person.fill")
        userName.frame = CGRect(x: (view.frame.width/2)*0.25, y: imageView.frame.maxY+20, width: view.frame.width*0.75, height: 50)
        return userName
        
    }
    var passwordName:UITextField{
        let passwordName = addTextField(placeHolder: "     Password", leftImageStr: "lock")
        passwordName.frame = CGRect(x: (view.frame.width/2)*0.25, y: userName.frame.maxY+20, width: view.frame.width*0.75, height: 50)
        passwordName.isSecureTextEntry = true
        return passwordName
        
    }
    var forgotPassword:UILabel{
        let forgotPassLabel = UILabel(frame: CGRect(x: (view.frame.width/2)*1.20, y: passwordName.frame.maxY + 10, width: 100, height: 20))
        forgotPassLabel.font = UIFont.boldSystemFont(ofSize: 9)
        forgotPassLabel.text = "Forgot Password?"
        forgotPassLabel.textColor = UIColor.white
        return forgotPassLabel
    }
    
    var rememberLabel:UILabel{
        let RememberLabel = UILabel(frame: CGRect(x: (view.frame.width/2)*0.40, y: passwordName.frame.maxY + 10, width: 80, height: 20))
        RememberLabel.font = UIFont.boldSystemFont(ofSize: 9)
        RememberLabel.text = "Remember me"
        RememberLabel.textColor = UIColor.white
        return RememberLabel
    }
    
    func confCheckBox(){
        
        checkBox = CheckBoxButton(frame: CGRect(x: rememberLabel.frame.minX-20, y: rememberLabel.frame.midY-5, width: 15, height: 15))
        checkBox.layer.cornerRadius = 2
        view.addSubview(checkBox)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox))
        checkBox.addGestureRecognizer(gesture)
    }
    
   
    
    func addTextField(placeHolder:String,leftImageStr:String)->UITextField{
        let TextField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width*0.75, height: 50))

        let leftImg = UIImageView(frame: CGRect(x: 0, y: 0, width: TextField.frame.height, height: TextField.frame.height))
        leftImg.image = UIImage(systemName: leftImageStr)
        leftImg.contentMode = .scaleAspectFit
        TextField.leftView = leftImg
        TextField.leftView?.tintColor = .white
        TextField.leftView?.backgroundColor = .gray
        TextField.leftViewMode = .always
        TextField.layer.cornerRadius = 5
        TextField.clipsToBounds = true
        TextField.placeholder = placeHolder
        TextField.backgroundColor = .systemGray5
        
        leftImg.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint(item: leftImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: TextField.frame.height+5)
        let widthConstraint = NSLayoutConstraint(item: leftImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: TextField.frame.height)
        leftImg.addConstraints([heightConstraint, widthConstraint])
        view.addSubview(TextField)
        return TextField
        
    }
    @objc func didTapCheckBox(){
       checkBox.toggle()
    }
}

class CheckBox: UIButton {
    
    // Images
    let checkedImage = UIImage(systemName: "checkmark")
    let uncheckedImage = UIImage(systemName: "square")
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
