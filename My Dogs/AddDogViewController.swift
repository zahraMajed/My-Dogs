//
//  AddEditDogViewController.swift
//  My Dogs
//
//  Created by admin on 19/12/2021.
//

import UIKit

class AddDogViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
  
    @IBOutlet weak var dogImageView: UIImageView!
    
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogColorTextField: UITextField!
    @IBOutlet weak var dogFavTreatTextField: UITextField!
    var delegate: AddEditDogsDelegates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func adddogBtnPressed(_ sender: Any) {
        if let dogName = dogNameTextField.text , !dogName.isEmpty,
           let dogColor = dogColorTextField.text, !dogColor.isEmpty,
           let dogFavTreat = dogFavTreatTextField.text, !dogFavTreat.isEmpty {
            print("enter if")
            delegate?.addDogDelegates(dogObj: dogsStruct(dogsName: dogName, dogsColor: dogColor, dogsFavTreat: dogFavTreat, dogImage: dogImageView.image))
            navigationController?.popViewController(animated: true)
            print("end if")
        }else {
            print("missing entries")
        }
    }
    
    @IBAction func addChangePhotoBtnPressed(_ sender: Any) {
        getPhoto()
    }
    
    func getPhoto() {
        print("inside getPhoto()")
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       dismiss(animated: true, completion: nil)
        if let img = info[.originalImage] as? UIImage {
            dogImageView.image = img
            print("img assigned")
        }else {
            print("img not found")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
