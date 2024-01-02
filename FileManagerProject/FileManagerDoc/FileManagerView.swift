//
//  FileManagerDoc.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/2/24.
//

import SwiftUI

struct FileManagerView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .padding(.top)
                }
                
                HStack {
                    Button("Save to FM") {
                        viewModel.saveImgInFileManager()
                    }
                    .frame(width: 150, height: 60)
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(.top, 20)
                    
                    
                    Button("Delete from FM") {
                        viewModel.deleteImageFromFM()
                    }
                    .frame(width: 150, height: 60)
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            .navigationTitle("FileManger")
        }
    }
}

struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}
