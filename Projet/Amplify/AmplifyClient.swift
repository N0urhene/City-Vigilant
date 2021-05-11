
import UIKit
import Amplify
import AmplifyPlugins

class AmplifyClient {
    func getReports() {
        Amplify.API.query(request: .list(Report.self)) { event in
            switch event {
            case.success(let result):
                switch result {
                case .success(let data):
                    print("Successfully created the report \(data)")
                case.failure(let error):
                    print(" \(error)")
                }
            case.failure(let APIError):
                print("failed to create a report", APIError)
                
            }
        }
    }
    
    func saveReport(report: Report) {
        _ = Amplify.API.mutate(request: .create(report)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    print("Successfully created note: \(data)")
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
 
}
