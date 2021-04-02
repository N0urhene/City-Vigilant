// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case firstName
    case lastName
    case phoneNumber
    case email
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let profile = User.keys
    
    model.pluralName = "Profiles"
    
    model.fields(
      .id(),
      .field(profile.firstName, is: .required, ofType: .string),
      .field(profile.lastName, is: .optional, ofType: .string),
      .field(profile.phoneNumber, is: .optional, ofType: .int),
      .field(profile.email, is: .optional, ofType: .string)
    )
    }
}
