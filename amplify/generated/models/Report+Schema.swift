// swiftlint:disable all
import Amplify
import Foundation

extension Report {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case region
    case description
    case image
    case categorie
    case time
    case nbrOfLikes
    case nbrOfComments
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let report = Report.keys
    
    model.pluralName = "Reports"
    
    model.fields(
      .id(),
      .field(report.name, is: .optional, ofType: .string),
      .field(report.region, is: .optional, ofType: .string),
      .field(report.description, is: .optional, ofType: .string),
      .field(report.image, is: .optional, ofType: .string),
      .field(report.categorie, is: .optional, ofType: .string),
      .field(report.time, is: .optional, ofType: .string),
      .field(report.nbrOfLikes, is: .optional, ofType: .int),
      .field(report.nbrOfComments, is: .optional, ofType: .int)
    )
    }
}