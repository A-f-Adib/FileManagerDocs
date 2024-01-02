//
//  PhotoView.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/1/24.
//

import SwiftUI

struct PhotoView: View {
    
    @State private var isShowPhotoPicker = false
    @State private var avatarImage = UIImage(named: "user")!
    @State var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: avatarImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture {
                        isShowPhotoPicker = true
                    }
                
                TextField("Image name", text: $name)
                    .padding(.horizontal, 150)
                    .fixedSize()
                
                Button("Save") {
                    
                }
                .frame(width: 300, height: 70)
                .foregroundColor(.white)
                .font(.title)
                .background(.blue)
                .cornerRadius(10)
                .padding(.top, 50)
                
                
                Spacer()
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $isShowPhotoPicker,  content: {
                PhotoPicker(avaTarImage: $avatarImage)
        })
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
