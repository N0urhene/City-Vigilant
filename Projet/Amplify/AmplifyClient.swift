
import UIKit
import Amplify
import AmplifyPlugins

var imageCash = [String: UIImage?]()
var image: UIImage?

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
    
    func uploadImage() {
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        let key = UUID().uuidString + ".jpg"
        _ = Amplify.Storage.uploadData(key: key, data: imageData) { Result in
            
            switch Result {
            case.success:
                print("Uploaded image")
                let report = Report(image: key)
                self.saveReport(report: report)
            case.failure(let error):
                print("Failed to upload \(error)")
            }
        }
    }
        
//        func downloadImages(reports: Report) {
//            for report in [reports] {
//                _ = Amplify.Storage.downloadData(key: report.image) { Result in
//                    switch Result {
//                    case .success(let imageData):
//                        DispatchQueue.main.async {
//                            let image = UIImage(data: imageData)
//                            imageCash[report.image] = image
//                        }
//                    case .failure(let error):
//                        print("Failed to download \(error)")
//                    }
//                }
//            }
//        }
        
        func listReports() {
            let report = Report.keys
            let predicate = report.name == "nourhene" && report.time == "2 hrs ago" && report.description == "report description" && report.image == ""
            Amplify.API.query(request: .paginatedList(Report.self, where: predicate, limit: 1000)) { event in
                switch event {
                case .success(let result):
                    switch result {
                    case .success(let reports):
                        print("Successfully retrieved list of todos: \(reports)")
                    case .failure(let error):
                        print("Got failed result with \(error.errorDescription)")
                    }
                case .failure(let error):
                    print("Got failed event with error \(error)")
                }
            }
        }
        
    }
