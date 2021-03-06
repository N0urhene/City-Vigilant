
import UIKit
import Amplify
import AmplifyPlugins
import AWSCore
import AWSS3
import Dispatch


class AmplifyClient {

    
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
    
    func listReports(completion: @escaping (_ reports: [Report])-> ()) {
            Amplify.API.query(request: .list(Report.self)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let reports):
                    print("Successfully retrieved list of reports: \(reports)")
                    DispatchQueue.main.sync {
                        completion(reports)
                    }
                    
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
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
    
    func getTodo() {
        Amplify.API.query(request: .get(Report.self, byId: "9FCF5DD5-1D65-4A82-BE76-42CB438607A0")) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let todo):
                    guard let todo = todo else {
                        print("Could not find todo")
                        return
                    }
                    print("Successfully retrieved todo: \(todo)")
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
}
