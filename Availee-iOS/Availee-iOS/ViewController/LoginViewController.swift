//
//  LoginViewController.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import UIKit
import ImagePicker

class LoginViewController: UIViewController {
    var imagePickerController: ImagePickerController!
  
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var IconImageView: UIImageView!
    
    @IBAction func setIcon(_ sender: Any) {
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController = ImagePickerController(configuration: imagePickerConfiguration())
        imagePickerController.delegate = self
//        present(imagePickerController, animated: true, completion: nil)
        IconImageView.layer.cornerRadius = IconImageView.frame.size.width / 2
        IconImageView.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func imagePickerConfiguration() -> Configuration {
        var config = Configuration()
        config.allowMultiplePhotoSelection = false
        config.mainColor = #colorLiteral(red: 0.137254902, green: 0.8666666667, blue: 0.6980392157, alpha: 1)
        return config
    }
    

}

extension LoginViewController: ImagePickerDelegate{
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true) {
            self.IconImageView.image = images.first
        }
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
