//
//  DogCollectionViewController.swift
//  myDogs
//
//  Created by Omar Ihmoda on 1/21/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit


class DogCollectionViewController: UICollectionViewController, AddDogDelegate {
    
var photos: [DogRecord] = []
fileprivate let reuseIdentifier = "dogCell"
fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
fileprivate let itemsPerRow: CGFloat = 2

}

// MARK: - UICollectionViewDataSource
extension DogCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! dogPhotoCellCollectionViewCell
    
        cell.backgroundColor = UIColor.white
        //3
        cell.dogPhoto.image = photos[indexPath.row].photo
        cell.dogLabel.text = photos[indexPath.row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is NSIndexPath {
            let indexPath = sender as! NSIndexPath
            let nav = segue.destination as! UINavigationController
            let destination = nav.topViewController as! EditViewController
            destination.delegate = self
            destination.name = photos[indexPath.row].name!
            destination.color = photos[indexPath.row].color!
            destination.treat = photos[indexPath.row].treat!
            destination.indexPath = indexPath
        } else {
            let destination = segue.destination as! ViewController
            destination.delegate = self
        }
    }
    
    func addDog(by: ViewController, image: UIImage?, name: String?, color: String?, treat: String?) {
        if let new_image: UIImage = image {
            let new_record = DogRecord()
            new_record.photo = image
            new_record.name = name
            new_record.color = color
            new_record.treat = treat
            self.photos.append(new_record)
            self.collectionView?.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "editItemSegue", sender: indexPath)
        
    }
    
    
}

extension DogCollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension DogCollectionViewController: EditDogDelegate {
    func deleteDog(by: EditViewController, indexPath: NSIndexPath) {
        self.photos.remove(at: indexPath.row)
        self.collectionView?.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func editDog(by: EditViewController, photo: UIImage, name: String?, color: String?, treat: String?, indexPath: NSIndexPath?) {
        print("test")
        dismiss(animated: true, completion: nil)
        let edit_dog = photos[indexPath!.row]
        edit_dog.name = name!
        edit_dog.color = color!
        edit_dog.treat = treat!
        self.collectionView?.reloadData()
    }
    
}
