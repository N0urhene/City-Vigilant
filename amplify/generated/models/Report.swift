import Amplify
import Foundation

public struct Report: Model {
  public let id: String
  public var name: String
  public var region: String?
  public var description: String
  
  public init(id: String = UUID().uuidString,
      name: String,
      region: String? = nil,
      description: String) {
      self.id = id
      self.name = name
      self.region = region
      self.description = description
  }
}
