// swiftlint:disable all
import Amplify
import Foundation

public struct Report: Model {
  public let id: String
  public var description: String
  
  public init(id: String = UUID().uuidString,
      description: String) {
      self.id = id
      self.description = description
  }
}
