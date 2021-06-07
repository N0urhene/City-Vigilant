
import UIKit
import Amplify
import AmplifyPlugins
import AWSCore
import AWSS3
import Dispatch


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
    
    func fetchCurrentAuthSession() {
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                print("Is user signed in - \(session.isSignedIn)")
            case .failure(let error):
                print("Fetch session failed with error \(error)")
            }
        }
    }
    
    func uploadImage() {
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast2,
            identityPoolId:"us-east-2:fc0c552a-d5d8-406b-a834-4a61bd2a6c53")
        let configuration = AWSServiceConfiguration(region:.USEast2, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        // let bucketName = "city-vigilantes92cc437b67c84698bd779d2527d88194dev-dev"
        
        let dataString = "Example file contents"
        let data = dataString.data(using: .utf8)!
        Amplify.Storage.uploadData(key: "ExampleKey", data: data, progressListener: { progress in
                 print("Progress: \(progress)") },
                resultListener: { (event) in
                    switch event {
                        case .success(let data):
                            print("Completed: \(data)")
                        case .failure(let storageError):
                            print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                                    }
                                   })
    }
    
    func listReports(setReports: @escaping (_ reports: [Report])-> ()) {
        let report = Report.keys
        DispatchQueue.global(qos: .background).async {
            Amplify.API.query(request: .paginatedList(Report.self, limit: 1000)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let reports):
                    print("Successfully retrieved list of reports: \(reports)")
                    setReports(reports.elements).self
                    let predicate = report.name == "nourhene"
                        && report.time == " 3min"
                        && report.description == "yahdikk e5dem 5ankamell ranii fadeet"
                        && report.image == "nourhene ma3adch tetcheff"
                    print(predicate)
                    self.getReports()
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
}
    
    func listFiles()  {
        Amplify.Storage.list { event in
            switch event {
            case let .success(listResult):
                print("Completed")
                listResult.items.forEach { item in
                    print("Key: \(item.key)")
                }
            case let .failure(storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        }
    }
}
