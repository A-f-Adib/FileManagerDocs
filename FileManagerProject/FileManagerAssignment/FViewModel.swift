
//
//  FViewModel.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/3/24.
//

import Foundation
import SwiftUI

class FViewModel : ObservableObject {
    
    let manager = FileManagerModel.instance
    
    @Published var image : UIImage? = nil
    @Published var imageName : String = "user"
    
    @Published var isShowPhotoPicker = false
    @Published var avatarImage = UIImage(named: "user")!
    @Published var placeholder = ""
    
    init() {
      getImgFromAsset()
    }
    
    func getImgFromAsset() {
        image = UIImage(named: imageName)
    }
    
    
    func saveImageInFM() {
        guard let image = image else {
            return
        }
        manager.saveImage(image: image, name: imageName)

    }
    
    
    func deleteImage() {
        manager.deleteImage(name: imageName)
    }
}
