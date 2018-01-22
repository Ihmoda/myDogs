//
//  EditDogDelegate.swift
//  myDogs
//
//  Created by Omar Ihmoda on 1/21/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

protocol EditDogDelegate: class {
    func editDog(by: EditViewController, photo: UIImage, name: String?, color: String?, treat: String?, indexPath: NSIndexPath?)
    func deleteDog(by: EditViewController, indexPath: NSIndexPath)
}
