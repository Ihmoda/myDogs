//
//  AddDogDelegate.swift
//  myDogs
//
//  Created by Omar Ihmoda on 1/21/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

protocol AddDogDelegate: class {
    func addDog(by: ViewController, image: UIImage?, name: String?, color: String?, treat: String?)
}
