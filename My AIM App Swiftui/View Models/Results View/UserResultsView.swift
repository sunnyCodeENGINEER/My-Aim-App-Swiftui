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
                CWARing(student: student)
                    .padding(.bottom)
                Text("Courses:")
                ResultListRow(student: student)
            } else {
                Text("Loading...")
            }
        }
    }
    
}
struct CWARing: View {
    @State var student: Student
    @State var trimAnimation: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 260, height: 260)
                .foregroundColor(Color("myWhite"))
                .blur(radius: 10)
                .shadow(color: .black, radius: 20, x: 20, y: 10)
            
            Circle()
                .stroke(.gray.opacity(0.5), style: StrokeStyle(lineWidth: 28, lineCap: .round))
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: trimAnimation ? CGFloat(student.currentCWA) / 100 : .zero)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: -90))
            
            if trimAnimation {
                Text(String(format: "%.2f", student.currentCWA))
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeInOut(duration: 1)) {
                    trimAnimation = true
                }
            }
        }
    }
}

struct ResultListRow: View {
    @State var student: Student
    @State var trimAnimation: Bool = false
    
    var body: some View {
        VStack {
            ForEach(student.courses, id: \.name) { course in
                HStack {
                    Text("\(course.name) (\(course.credits) credits): ")
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .trim(from: 0, to: trimAnimation ? CGFloat(course.score) / 100 : .zero)
                            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                            .frame(width: 50, height: 50)
                            .rotationEffect(Angle(degrees: -90))
                        
                        if trimAnimation {
                            Text("\(course.grade)")
                        }
                    }
                }
                .padding(.horizontal, 50)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(.thickMaterial)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 3)
                    }))
                .padding(.horizontal)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                withAnimation(.easeInOut(duration: 1)) {
                    trimAnimation = true
                }
            }
        }
    }
}

struct UserResultsView_Previews: PreviewProvider {
    static var previews: some View {
        UserResultsView()
    }
}

struct Student: Codable {
    var lastName: String = "Emmanuel"
    var firstName: String = "Donkor"
    var otherNames: String = "Kofi Awuateh"
    var year: Int = 3
    var programme: String = "Computer Engineering"
    var currentCWA: Double = 87.56
    var averageForSemester: Double = 98.00
    var courses: [Course] = [Course(name: "MATH 252", credits: 4, score: 98, grade: "A"), Course(name: "ENGL 252", credits: 1, score: 98, grade: "A"), Course(name: "COE 252", credits: 3, score: 98, grade: "A"), Course(name: "TE 252", credits: 2, score: 98, grade: "A"), Course(name: "COE 257", credits: 2, score: 70, grade: "A")]

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
