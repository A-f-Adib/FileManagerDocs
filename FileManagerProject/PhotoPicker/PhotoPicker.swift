//
//  PhotoPicker.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/1/24.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var avaTarImage : UIImage
    
    // This func is for showing pics from library
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    
    final class Coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker : PhotoPicker
        
        init(photoPickeR : PhotoPicker) {
            self.photoPicker = photoPickeR
        }
        
        
        //auto generate func to pick image.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                
                //for compressing image
                guard let data = image.jpegData(compressionQuality: 0.5),
                      let compressedImage = UIImage(data: data)
                else { return }
                
                photoPicker.avaTarImage = compressedImage
                
            } else {
                //error
            }
            picker.dismiss(animated: true)
        }
    }
    
    //auto gen. func to make coordinator connect after creating the class.
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPickeR: self)
    }
 
    

   
}

