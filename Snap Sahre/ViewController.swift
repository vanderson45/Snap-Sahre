//
//  ViewController.swift
//  Snap Sahre
//
//  Created by Victoria Anderson on 9/28/17.
//  Copyright © 2017 Students. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    var images = [UIImage]() //empty array capable of having UI Images
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Snap Share"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(importPicture))
        
    }
    
    @objc func importPicture()
    {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self //refers to the collection view controller. it is supposed to report to this view controller
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            dismiss(animated: true, completion: nil)
            images.insert(image, at: 0)
            collectionView?.reloadData()
             
        }
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Image View", for: indexPath)
        if let imageView = cell.viewWithTag(100) as? UIImageView
        {
            imageView.image = images[indexPath.item]
            
        }
            return cell
    }
    



}




