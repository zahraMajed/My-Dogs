//
//  dogsDelegates.swift
//  My Dogs
//
//  Created by admin on 19/12/2021.
//

import Foundation

protocol AddEditDogsDelegates {
    func addDogDelegates(dogObj: dogsStruct)
    func editDogDelegates(dogObj: dogsStruct, indexPath:NSIndexPath)
    func deleteDogDelegates(indexPath: NSIndexPath)
}
