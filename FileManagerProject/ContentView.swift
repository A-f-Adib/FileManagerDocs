//
//  ContentView.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image : Image?
    @State private var showingImagePicker = false
    @State private var inputImage : UIImage?
    @State private var nameSheet = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select" ) {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in
            loadImage()
            nameSheet = true
            
        }
        .onAppear {
            onAppear()
                .sheet(isPresented: $nameSheet ) {
                    Text ("hi")
                }
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)
            

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
