import SwiftUI

struct ExperienceView: View {
    @State private var employeeExperiences = [
        EmployeeExperience(company: "Webonise Lab", designation: "iOS Developer", caption: "Working as an iOS developer", startDate: Date(), endDate: nil),
        EmployeeExperience(company: "SparkLab", designation: "FullStack Developer", caption: "Worked as a FullStack Developer", startDate: Date(), endDate: Date()),
        // Add more employee experiences as needed
    ]
    
    @State private var selectedExperience: EmployeeExperience?
    
    var body: some View {
        VStack {
            Text("Experience")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .offset(x: -130)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(employeeExperiences, id: \.self) { experience in
                        CardView(experience: experience)
                            .onTapGesture {
                                selectedExperience = experience
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .sheet(item: $selectedExperience) { experience in
            EditExperienceForm(experience: experience) { updatedExperience in
                if let index = employeeExperiences.firstIndex(where: { $0.id == updatedExperience.id }) {
                    employeeExperiences[index] = updatedExperience
                }
                selectedExperience = nil
            }
        }
    }
}

struct CardView: View {
    let experience: EmployeeExperience
    
    private var formattedStartDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: experience.startDate)
    }
    
    private var formattedEndDate: String {
        guard let endDate = experience.endDate else {
            return "Present"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: endDate)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(experience.company)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(experience.designation)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(experience.caption)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Text("Start Date: \(formattedStartDate)").bold()
                Spacer()
                Text("End Date: \(formattedEndDate)").bold()
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 200, height: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 4, x: 0, y: 2)
    }
}

struct EditExperienceForm: View {
    @Environment(\.presentationMode) var presentationMode
    let experience: EmployeeExperience
    @State private var editedExperience: EmployeeExperience
    @State private var isEndDatePresent: Bool
    
    init(experience: EmployeeExperience, onDismiss: @escaping (EmployeeExperience) -> Void) {
        self.experience = experience
        _editedExperience = State(initialValue: experience)
        _isEndDatePresent = State(initialValue: experience.endDate == nil)
        self.onDismiss = onDismiss
    }
    
    var onDismiss: (EmployeeExperience) -> Void
    
    // Getter for the end date binding
    private var endDateBinding: Binding<Date> {
        Binding<Date>(
            get: { editedExperience.endDate ?? Date() },
            set: { editedExperience.endDate = $0 }
        )
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Experience")) {
                    TextField("Company", text: $editedExperience.company)
                    TextField("Designation", text: $editedExperience.designation)
                    TextField("Caption", text: $editedExperience.caption)
                    
                    DatePicker("Start Date", selection: $editedExperience.startDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    Toggle("End Date Present", isOn: $isEndDatePresent)
                    if !isEndDatePresent {
                        DatePicker("End Date", selection: endDateBinding, displayedComponents: .date) // Use endDateBinding here
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                }
            }
            .navigationBarTitle(Text("Edit Experience"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    // Save the changes and close the form
                    // You can implement your saving logic here
                    if isEndDatePresent {
                        editedExperience.endDate = nil
                    }
                    presentationMode.wrappedValue.dismiss()
                    onDismiss(editedExperience) // Pass the updated experience to the onDismiss closure
                }) {
                    Text("Save")
                }
            )
        }
    }
}

struct EmployeeExperience: Identifiable, Hashable {
    let id = UUID()
    var company: String
    var designation: String
    var caption: String
    var startDate: Date
    var endDate: Date?
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView()
    }
}
