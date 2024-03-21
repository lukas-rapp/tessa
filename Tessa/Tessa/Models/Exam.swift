//
//  Exam.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import Foundation

class Exam: Codable {
    var id: UUID
    var criteria: [String]
    var exam_id: [UUID]
}
