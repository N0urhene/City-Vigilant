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
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.firstName, is: .required, ofType: .string),
      .field(user.lastName, is: .optional, ofType: .string),
      .field(user.phoneNumber, is: .optional, ofType: .int),
      .field(user.email, is: .optional, ofType: .string)
    )
    }
}