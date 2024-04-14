//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selctedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selctedImage) } }
    }
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
}
