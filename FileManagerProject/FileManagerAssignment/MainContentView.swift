//
//  MainContentView.swift
//  FileManagerProject
//
//  Created by A.f. Adib on 1/2/24.
//

import SwiftUI

struct MainContentView: View {
    
    @State var selectedTab = 2
    var body: some View {
        
        NavigationView {
            TabView(selection : $selectedTab) {
                
                HomeView()
                
                ProfileView()
            }
            .accentColor(.black)
            .navigationTitle(selectedTab == 1 ? "Home" : "Profile")
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}



struct HomeView: View {
    
    @StateObject var HviewModel = FViewModel()
    
    var body: some View {
        
            ZStack {
                Color.purple.opacity(0.2).ignoresSafeArea()
                List{
                    Text(HviewModel.imageName) 
                }
            }
            
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
        } .tag(1)
    }
}


struct ProfileView: View {
    
    @StateObject var FviewModel = FViewModel()
   
    @State var name = ""
    
    var body: some View {
        ZStack{
            Color.purple.opacity(0.2).ignoresSafeArea()
            VStack{
              
                Image(uiImage: FviewModel.avatarImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture {
                        FviewModel.isShowPhotoPicker = true
                    }
                
                TextField("Image name", text: $FviewModel.imageName)
                    .padding(.horizontal, 150)
                    .fixedSize()
                
                Button("Save") {
                    FviewModel.saveImageInFM()
                }
                .frame(width: 300, height: 70)
                .foregroundColor(.white)
                .font(.headline)
                .background(FviewModel.imageName.count >= 3 ? .blue : .gray)
                .cornerRadius(10)
                .padding(.top, 50)
                .disabled(FviewModel.imageName.count <= 3)
                
                Button("Delete") {
                    FviewModel.deleteImage()
                }
                .frame(width: 300, height: 70)
                .foregroundColor(.white)
                .font(.headline)
                .background(.red)
                .cornerRadius(10)
                .padding(.top, 20)
                
                
                Spacer()
            }
            
            .sheet(isPresented: $FviewModel.isShowPhotoPicker, content: {
                PhotosPicker(avaTarImage: $FviewModel.avatarImage)
            })
        }.tabItem {
            Image(systemName:"person.fill")
            Text("Profile")
        } .tag(2)
    }
}
