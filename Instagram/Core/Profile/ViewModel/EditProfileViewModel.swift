//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Hamza Osama on 5/29/24.
//

import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selctedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selctedImage) } }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        //update profile image if changed
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        //update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        //update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
