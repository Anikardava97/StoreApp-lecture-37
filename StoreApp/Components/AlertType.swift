//
//  AlertType.swift
//  StoreApp
//
//  Created by Ani's Mac on 18.12.23.
//

enum AlertType: Identifiable {
    case success, error
    
    var id: Int {
        switch self {
        case .success:
            return 1
        case .error:
            return 2
        }
    }
}

