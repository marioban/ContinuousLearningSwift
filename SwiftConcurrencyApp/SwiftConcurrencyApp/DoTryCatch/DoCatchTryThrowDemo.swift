//
//  DoCatchTryThrowDemo.swift
//  SwiftConcurrencyApp
//
//  Created by Mario Ban on 07.02.2025..
//

import SwiftUI
// MARK: Do/Try/Catch

class DoTryCatchThrowsDemoDataManager {
    
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New text!",nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New text")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    
    func getTitle3() throws -> String {
      //  if isActive {
      //      return "New text"
      //  } else {
            throw URLError(.badURL)
       // }
    }
    
    func getTitle4() throws -> String {
        if isActive {
            return "Final text"
        } else {
            throw URLError(.badURL)
        }
    }

    
}

class DoCatchTryThrowDemoViewModel: ObservableObject {
    @Published var text: String = "Staring text"
    let manager = DoTryCatchThrowsDemoDataManager()
    
    func fetchTitle() {
        /*
         let returnedValue = manager.getTitle()
         if let newTitle = returnedValue.title {
             self.text = newTitle
         } else if let error = returnedValue.error {
             self.text = "Error: \(error.localizedDescription)"
         }
         */
        
        /*let result = manager.getTitle2()
         
         switch result {
         case .success(let success):
             self.text = success
         case .failure(let failure):
             self.text = "Error: \(failure.localizedDescription)"
         }
         */
        
        /*
         do {
             let newTitle = try manager.getTitle3()
             self.text = newTitle
         } catch {
             self.text = error.localizedDescription
         }
         */
        
        do {
            let newTitle = try? manager.getTitle3()                                      // let newTitle = try? manager.getTitle3() this works
            if let newTitle = newTitle {
                self.text = newTitle
            }                                                                            // self.text = newTitle ?? ""
            
            let finalTitle = try manager.getTitle4()
            self.text = finalTitle
        } catch {
            self.text = error.localizedDescription
        }
    }
}


struct DoCatchTryThrowDemo: View {
    @StateObject private var viewModel = DoCatchTryThrowDemoViewModel()
    
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

#Preview {
    DoCatchTryThrowDemo()
}
