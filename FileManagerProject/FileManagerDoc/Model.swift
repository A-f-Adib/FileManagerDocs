//
//  Model.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/2/24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    
//saving the asset image in file manager by passing it to viewModel
    func saveImage(name : String, image : UIImage) {
        
        guard let data = image.jpegData(compressionQuality: 0.8 ),
              let path = getImagePath(name: name)
        else {
            print("Error getting data")
            return
        }
        
     
        do {
            try  data.write(to: path)
            print("Save Success!")
        } catch let error {
            print("Error saving... \(error)")
        }
    }
    
  
    
    //getting the path where the img is saved in file manager
    func getImagePath(name: String) -> URL? {
        
        guard let path = FileManager
                 .default
                 .urls(for: .documentDirectory, in: .userDomainMask)
                 .first?
                 .appendingPathComponent("\(name).jpg") else {
                     print("Error getting path")
                     return nil
                 }
         return path
    }
    
    
    
    //getting the saved image from file manager by viewmodel
    func getImage(name: String) -> UIImage? {
        guard let path = getImagePath(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
                  print("Error getting file")
                  return nil
              }
        return UIImage(contentsOfFile: path)
    }
    
    
    func deleteImage(name: String) {
        //same as getImage
        guard let path = getImagePath(name: name),
              FileManager.default.fileExists(atPath: path.path) else {
                  print("File alredy deleted")
                  return
        }
        //extra code for delete
        do {
            try FileManager.default.removeItem(at: path)
            print("Deleted Successfully")
        } catch let error {
            print("Error deleting file")
        }
    }
    
    
}


