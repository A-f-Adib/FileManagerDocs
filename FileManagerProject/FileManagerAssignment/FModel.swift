//
//  FModel.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/3/24.
//

import Foundation
import SwiftUI

class FileManagerModel {
    
    static let instance = FileManagerModel()
    
    
    func saveImage ( image: UIImage, name: String) {
        guard let data = image.jpegData(compressionQuality: 0.5),
              let path = getImagePath(name: name)
                
        else {
            print("error getting data")
            return
        }
        
        do {
            try data.write(to: path)
            print("Success saving data!")
            print(path)
        } catch let error {
            print("Error saving data! \(error)")
        }
    }
    
    
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
    
    
    func getImage(name: String) -> UIImage? {
        guard let path = getImagePath(name: name)?.path,
                FileManager
                .default
                .fileExists(atPath: path) else {
                    print("Error getting path")
                    return nil
                }
        return UIImage(contentsOfFile: path)
    }
    
    
    func deleteImage(name: String) {
        guard let path = getImagePath(name: name),
              FileManager
                .default
                .fileExists(atPath: path.path) else {
                    print("File no longer available")
                    return
                }
        
        do {
            try FileManager.default.removeItem(at: path)
            print("Deleted successfully!")
        } catch let error {
            print("Error \(error)")
        }
    }
}
