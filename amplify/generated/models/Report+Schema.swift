// swiftlint:disable all
import Amplify
import Foundation

extension Report {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case description
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let report = Report.keys
    
    model.pluralName = "reports"
    
    model.fields(
      .id(),
      .field(report.description, is: .required, ofType: .string)
    )
    }
}
