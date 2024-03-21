//
//  Teacher.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import Foundation

class Teacher: Codable {
    var id: UUID
    var class_ids: [UUID]
    var name: String
    var surname: String
    var email: String
}
