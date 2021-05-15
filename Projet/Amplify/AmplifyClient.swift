
import UIKit
import Amplify
import AmplifyPlugins

var subscription: GraphQLSubscriptionOperation<Report>?

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
 
    func createSubscription() {
        subscription = Amplify.API.subscribe(request: .subscription(of: Report.self, type: .onCreate), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
            case .data(let result):
                switch result {
                case .success(let createdReport):
                    print("Successfully got todo from subscription: \(createdReport)")
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            }
        }) { result in
            switch result {
            case .success:
                print("Subscription has been closed successfully")
            case .failure(let apiError):
                print("Subscription has terminated with \(apiError)")
            }
        }
    }
    
}
