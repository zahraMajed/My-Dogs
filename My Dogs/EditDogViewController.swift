//
//  EditDogViewController.swift
//  My Dogs
//
//  Created by admin on 19/12/2021.
//

import UIKit

class EditDogViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogColorTextField: UITextField!
    @IBOutlet weak var dogFavTreatTextField: UITextField!
    
    var delegate: AddEditDogsDelegates?
    var dogObj: dogsStruct?
    var indexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogNameTextField.text = dogObj?.dogsName
        dogColorTextField.text = dogObj?.dogsColor
        dogFavTreatTextField.text = dogObj?.dogsFavTreat
        dogImageView.image = dogObj?.dogImage
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        if let dogName = dogNameTextField.text , !dogName.isEmpty,
           let dogColor = dogColorTextField.text, !dogColor.isEmpty,
           let dogFavTreat = dogFavTreatTextField.text, !dogFavTreat.isEmpty {
            print("enter if edit ")
            delegate?.editDogDelegates(dogObj: dogsStruct(dogsName: dogName, dogsColor: dogColor, dogsFavTreat: dogFavTreat, dogImage: dogImageView.image), indexPath: indexPath!)
            navigationController?.popViewController(animated: true)
            print("end if edit ")
        }else {
            print("missing entries")
        }
    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changePhotoBtnPressed(_ sender: Any) {
        getPhoto()
    }
    
    @IBAction func deleteDogBtnPressed(_ sender: Any) {
        delegate?.deleteDogDelegates(indexPath: indexPath!)
        navigationController?.popViewController(animated: true)
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
