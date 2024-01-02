//
//  PhotosPicker.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/2/24.
//

import SwiftUI

struct PhotosPicker: UIViewControllerRepresentable {
   
    @Binding var avaTarImage : UIImage
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    
    final class Coordinator : NSObject, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
        
        let photoPicker : PhotosPicker
        
        init(photoPickeR : PhotosPicker) {
            self.photoPicker = photoPickeR
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                
                guard let data = image.jpegData(compressionQuality: 0.5),
                      let comppressedImage = UIImage(data: data)
                else { return }
                
                photoPicker.avaTarImage = comppressedImage
            } else {
                
            }
            picker.dismiss(animated: true)
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPickeR: self)
    }
}
