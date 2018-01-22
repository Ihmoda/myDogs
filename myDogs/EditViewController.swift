//
//  EditViewController.swift
//  myDogs
//
//  Created by Omar Ihmoda on 1/21/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit



class EditViewController: UIViewController {
    
    weak var delegate: EditDogDelegate?
    var name: String = ""
    var color: String = ""
    var treat: String = ""
    var indexPath: NSIndexPath?
    let imagePicker = UIImagePickerController()
    var picked_image: UIImage?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var treatTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        self.nameTextField.text = self.name
        self.colorTextField.text = self.color
        self.treatTextField.text = self.treat

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        self.name = self.nameTextField.text!
        self.color = self.colorTextField.text!
        self.treat = self.treatTextField.text!
        
        self.delegate?.editDog(by: self, photo: self.picked_image!, name: self.name, color: self.color, treat: self.treat, indexPath: self.indexPath!)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
       self.delegate?.deleteDog(by: self, indexPath: indexPath!)
    }
    
    @IBAction func changePhotoButtonPressed(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let new_image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage {
            self.picked_image = new_image
            print("found image")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
