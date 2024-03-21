//
//  ServerConnection.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import Foundation

class ServerConnection{
    
    func fetchStudentsFromServer() -> [Student]{
        var students_return: [Student] = []
        
        let url = URL(string: "https://api.example.com/endpoint")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Fehler behandeln
                print("Fehler beim Abrufen der Daten: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Ungültige HTTP-Antwort")
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                // Antwort-Statuscode behandeln
                print("Ungültiger Statuscode: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("Keine Daten empfangen")
                return
            }
            
            do {
                let students = try JSONDecoder().decode([Student].self, from: data)
                // Verarbeitung der Studenten hier
                students_return = students
                for student in students {
                    print("Name: \(student.name), Nachname: \(student.surname)")
                    
                }
            } catch {
                // Fehler beim Decodieren behandeln
                print("Fehler beim Decodieren der Daten: \(error)")
            }
        }
        
        task.resume()
        return students_return
    }


    
}
