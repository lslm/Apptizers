import SwiftUI

struct AccountView: View {
    @StateObject private var accountViewModel = AccountViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $accountViewModel.firstName)
                    TextField("Last Name", text: $accountViewModel.lastName)
                    TextField("Email", text: $accountViewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $accountViewModel.birthdate, displayedComponents: .date)
                    
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                } header: {
                    Text("Personal information")
                }
                
                Section {
                    Toggle("Extra napkins", isOn: $accountViewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $accountViewModel.frequentRefills)
                } header: {
                    Text("Request")
                }
                //.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Account")
            .alert(item: $accountViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    AccountView()
}
