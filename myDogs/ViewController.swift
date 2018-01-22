//
//  ViewController.swift
//  myDogs
//
//  Created by Omar Ihmoda on 1/21/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: AddDogDelegate?
    let imagePicker = UIImagePickerController()
    var pickedImage: UIImage?
    var name: String?
    var color: String?
    var treat: String?
    
    @IBOutlet weak var dogNameLabel: UITextField!
    @IBOutlet weak var dogColorLabel: UITextField!
    @IBOutlet weak var dogTreatLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let new_image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage {
            pickedImage = new_image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddDogButtonPressed(_ sender: UIButton) {
        self.name = self.dogNameLabel.text
        self.color = self.dogColorLabel.text
        self.treat = self.dogTreatLabel.text
        self.delegate?.addDog(by: self, image: self.pickedImage, name: self.name, color: self.color, treat: self.treat)
    }
    

}
