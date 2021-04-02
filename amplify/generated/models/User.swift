// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var firstName: String
  public var lastName: String?
  public var phoneNumber: Int?
  public var email: String?
  
  public init(id: String = UUID().uuidString,
      firstName: String,
      lastName: String? = nil,
      phoneNumber: Int? = nil,
      email: String? = nil) {
      self.id = id
      self.firstName = firstName
      self.lastName = lastName
      self.phoneNumber = phoneNumber
      self.email = email
  }
}
