//
//  UserResultsView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 14/04/2023.
//

import SwiftUI

struct UserResultsView: View {
    @State var student: Student = Student()
    
    var body: some View {
        VStack {
            if let student = student {
                Text("Name: \(student.firstName) \(student.lastName)")
                Text("Programme: \(student.programme)")
                Text("Current CWA: \(student.currentCWA)")
                Text("Courses:")
                ForEach(student.courses, id: \.name) { course in
                    Text("\(course.name) (\(course.credits) credits): \(course.grade)")
                }
            } else {
                Text("Loading...")
            }
        }
    }
    func loadData() {
        if let url = Bundle.main.url(forResource: "ResultsJSON", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(Student.self, from: data)
                print(results)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func fetchResults() {
            let url = URL(string: "https://raw.githubusercontent.com/sunnyCodeENGINEER/myBackend/blob/main/ResultsJSON.json")!
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let student = try decoder.decode(Student.self, from: data)
                        DispatchQueue.main.async {
                            self.student = student
                            print(student)
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
        }
}

//struct UserResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserResultsView(student: S)
//    }
//}

struct Student: Codable {
    var lastName: String = "Emmanuel"
    var firstName: String = "Donkor"
    var otherNames: String = "Kofi Awuateh"
    var year: Int = 3
    var programme: String = "Computer Engineering"
    var currentCWA: Double = 98.56
    var averageForSemester: Double = 98.00
    var courses: [Course] = [Course(name: "MATH 252", credits: 4, score: 98, grade: "A"), Course(name: "ENGL 252", credits: 1, score: 98, grade: "A"), Course(name: "COE 252", credits: 3, score: 98, grade: "A"), Course(name: "TE 252", credits: 2, score: 98, grade: "A"), Course(name: "COE 257", credits: 2, score: 98, grade: "A")]

    struct Course: Codable {
        let name: String
        let credits: Int
        let score: Int
        let grade: String
        
        init(name: String, credits: Int, score: Int, grade: String) {
            self.name = name
            self.credits = credits
            self.score = score
            self.grade = grade
        }
    }
}
