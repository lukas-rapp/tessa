//
//  Student.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import Foundation

class Student: Codable {
    var id: UUID
    var description: String
    var name: String
    var surname: String
    var class_id: UUID
    var teacher_ids: [UUID]
    var mail_eltern: String
    var personal_ratings: [Mark]
    var exam_ids: [UUID]
    
    init(id: UUID, description: String, name: String, surname: String, class_id: UUID, teacher_ids: [UUID], mail_eltern: String, oral_marks: [Mark], exam_ids: [UUID]) {
        self.id = id
        self.description = description
        self.name = name
        self.surname = surname
        self.class_id = class_id
        self.teacher_ids = teacher_ids
        self.mail_eltern = mail_eltern
        self.personal_ratings = oral_marks
        self.exam_ids = exam_ids
    }
    
    // Decodable initializer
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.description = try container.decode(String.self, forKey: .description)
        self.name = try container.decode(String.self, forKey: .name)
        self.surname = try container.decode(String.self, forKey: .surname)
        self.class_id = try container.decode(UUID.self, forKey: .class_id)
        self.teacher_ids = try container.decode([UUID].self, forKey: .teacher_ids)
        self.mail_eltern = try container.decode(String.self, forKey: .mail_eltern)
        self.personal_ratings = try container.decode([Mark].self, forKey: .personal_ratings)
        self.exam_ids = try container.decode([UUID].self, forKey: .exam_ids)
    }
    
    // Encodable function
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(description, forKey: .description)
        try container.encode(name, forKey: .name)
        try container.encode(surname, forKey: .surname)
        try container.encode(class_id, forKey: .class_id)
        try container.encode(teacher_ids, forKey: .teacher_ids)
        try container.encode(mail_eltern, forKey: .mail_eltern)
        try container.encode(personal_ratings, forKey: .personal_ratings)
        try container.encode(exam_ids, forKey: .exam_ids)
    }
    
    // CodingKeys for mapping between property names and JSON keys
    private enum CodingKeys: String, CodingKey {
        case id
        case description
        case name
        case surname
        case class_id
        case teacher_ids
        case mail_eltern
        case personal_ratings
        case exam_ids
    }
}
