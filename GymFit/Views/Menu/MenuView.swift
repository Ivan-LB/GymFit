//
//  MenuView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct MenuView: View {
    private var isLoading = false
    private let facebookURL: URL = ConfigurationManager.shared.facebookURL
    private let instagramURL: URL = ConfigurationManager.shared.instagramURL

    @State var isOn = true
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Button("Log out") {
                        Task {
                            do {
                                // try viewModel.signOut()
                                // navigationViewModel.showSignInView = true
                            } catch {
                                print(error)
                            }
                        }
                    }
                    .foregroundColor(Color("PrimaryRed"))
                }
                if isLoading {
                    ProgressView("Loading...")
                } else {
                    HStack {
                        Spacer()
                        if let url = URL(string: "viewModel.userMedicalProfile.profilePictureURL") {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 97, height: 97)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 97, height: 97)
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text("Full Name")
                                .font(UIConstants.UIFont.largeTitle)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 8)
                }
                HStack() {
                    SocialMediaButton(icon: "facebook", label: "Facebook",color: Color.blue, url: facebookURL)
                    SocialMediaButton(icon: "instagram", label: "Instagram",color: Color.red, url: instagramURL)
                }
                
                NavigationLink {
                    CustomerServiceView()
                } label: {
                    HStack {
                        Text("Atención al Cliente")
                            .font(UIConstants.UIFont.smallTitle)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .listRowSeparator(.hidden)
                }
                
                NavigationLink {
                    DocumentWebView()
                } label: {
                    HStack {
                        Text("FAQ")
                            .font(UIConstants.UIFont.smallTitle)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .listRowSeparator(.hidden)
                }
                
                // TODO: To many things to consider
//                Button(role: .destructive) {
//                    Task {
//                        do {
//                            //try await viewModel.deleteAccount()
//                            // TODO: Add an alert to let the user know that we're gonna delete the account IF true -> re-sign in to authenticate the user and succesfully delete the account
//                            //navigationViewModel.showSignInView = true
//                        } catch {
//                            print(error)
//                        }
//                    }
//                } label: {
//                    HStack {
//                        Text("Reset Password")
//                        Spacer()
//                    }
//                }
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(radius: 1)
                
                Spacer()
            }
            .padding(.horizontal)
            .listStyle(.plain)
            .listRowBackground(Color.clear)
        }
    }
}

#Preview {
    MenuView()
}
