//
//  ViewController.swift
//  FoodTracker
//
//  Created by Alex on 17/02/2020.
//  Copyright © 2020 Alex Sykes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
    }
    
    //Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Update information - https://stackoverflow.com/questions/51342028/cannot-subscript-a-value-of-type-string-any-with-an-index-of-type-uiimage
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. Use the original one.
        
        guard let selectedImage = info[.originalImage] as? UIImage else { fatalError("Expected a dictionary containing an image, but was provided with the following: \(info)") }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
        
    //Mark: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerControler is a view controller that lets a user pick an image from their photo library
        let imagePickerController = UIImagePickerController()
        
        // Only allow images to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when an image is picked
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

}
