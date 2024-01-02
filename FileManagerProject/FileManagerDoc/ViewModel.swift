//
//  ViewModel.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/2/24.
//
import SwiftUI
import Foundation

class ViewModel : ObservableObject {
    
    @Published var image : UIImage? = nil
    @Published var imgName : String  = "exampleImage"
    let manager = LocalFileManager.instance
    
    init () {
        getImgFromAssets()
    }
    
    //getting the image from assets
    func getImgFromAssets() {
        image = UIImage(named: imgName)
    }
    
    //getting the saved image from file manager
    func getImgFromFileManager() {
        image = manager.getImage(name: imgName)
    }
    
    
    //save img in file manager
    func saveImgInFileManager() {
        guard let image = image else {
            return
        }
        manager.saveImage(name: imgName, image: image)
    }
    
    func deleteImageFromFM() {
        manager.deleteImage(name: imgName)
    }
}
