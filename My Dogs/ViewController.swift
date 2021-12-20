//
//  ViewController.swift
//  My Dogs
//
//  Created by admin on 18/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mycollectionView: UICollectionView!
    
    var dogsArray : [dogsStruct] = [dogsStruct(dogsName: "a", dogsColor: "red", dogsFavTreat: "ball", dogImage: UIImage(named: "dogs")),
                                    dogsStruct(dogsName: "a", dogsColor: "red", dogsFavTreat: "ball", dogImage: UIImage(named: "dogs")),
                                    dogsStruct(dogsName: "a", dogsColor: "red", dogsFavTreat: "ball", dogImage: UIImage(named: "dogs"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        mycollectionView.delegate = self
        mycollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {
            let destintion = segue.destination as! AddDogViewController
            destintion.delegate = self
        } else if sender is IndexPath {
            let destintion = segue.destination as! EditDogViewController
            destintion.delegate = self
            let indexPAth = sender as! NSIndexPath
            destintion.dogObj = dogsArray[indexPAth.row]
            destintion.indexPath = indexPAth
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ColViewCell
        cell.lblDogName.text = dogsArray[indexPath.row].dogsName
        if let dogImage =  dogsArray[indexPath.row].dogImage {
            cell.dogImageView.image = dogImage
        }else {
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEditDog", sender: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.49 , height: self.view.frame.width * 0.49)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
}

extension ViewController: AddEditDogsDelegates {
    func editDogDelegates(dogObj: dogsStruct, indexPath: NSIndexPath) {
        print("enter vc edit")
        dogsArray[indexPath.row] = dogObj
        mycollectionView.reloadData()
    }
    
    func deleteDogDelegates(indexPath: NSIndexPath) {
        print("enter vc del")
        dogsArray.remove(at: indexPath.row)
        mycollectionView.reloadData()
    }
    
    
    func addDogDelegates(dogObj: dogsStruct) {
        print("enter vc")
        dogsArray.append(dogObj)
        mycollectionView.reloadData()
    }
}

struct dogsStruct {
    var dogsName:String
    var dogsColor:String
    var dogsFavTreat:String
    var dogImage:UIImage?
}

