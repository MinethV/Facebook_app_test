//
//  ContentView.swift
//  Facebook
//
//  Created by Admin on 2023-02-20.
//

import SwiftUI

struct FBpostModel : Hashable{
    
    let name : String
    let post : String
    let imageName : String
}

struct ContentView: View {
    
    @Binding var text: String
    
    let stories = ["Image1","Image2","Image3","Image4","Image5","Image6"]
    
    let posts: [FBpostModel] = [
        FBpostModel(name: "mark Zuckerburg",
                    post: "Hey guy I made this cool website called the FaceBook to see me if I'm cool or not.",
                    imageName: "person1"),
        FBpostModel(name: "Tim Cook",
                    post: "Hey I'm Apple",
                    imageName: "person2"),
        FBpostModel(name: "Elon Musk",
                    post: "Hey Let's go to the moon",
                    imageName: "person3")
        
    ]
    
    let facebookblue = UIColor(red: 23/255.0,
                               green:120/255.0,
                               blue:242/255.0,
                               alpha: 1)
    var body: some View {
        VStack {
            HStack{
                Text("facebook")
                       .font(.system(size: 48,weight: .bold,design: .default))
                       .foregroundColor(Color(facebookblue))
                
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 45,height: 45,alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Search...",text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding(.horizontal, 15)
            
            ZStack{
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical){
                    VStack{
                        
                        StoriesView(stories: stories)
                        
                        ForEach(posts,id: \.self) { model in
                            FBPost(model: model)
                            Spacer()
                        }
                        
                    
                        
                       
                    }
                }
                
            }
               
            
            Spacer()
         
        }
        
    }
}




    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(text: .constant(""))
        }
    }

