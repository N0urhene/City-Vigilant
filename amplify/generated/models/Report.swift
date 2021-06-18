// swiftlint:disable all
import Amplify
import Foundation

public struct Report: Model {
  public let id: String
  public var name: String?
  public var region: String?
  public var description: String?
  public var categorie: String?
  public var time: String?
  public var nbrOfLikes: Int?
  public var nbrOfComments: Int?
  
  public init(id: String = UUID().uuidString,
      name: String? = nil,
      region: String? = nil,
      description: String? = nil,
      categorie: String? = nil,
      time: String? = nil,
      nbrOfLikes: Int? = nil,
      nbrOfComments: Int? = nil) {
      self.id = id
      self.name = name
      self.region = region
      self.description = description
      self.categorie = categorie
      self.nbrOfLikes = nbrOfLikes
      self.nbrOfComments = nbrOfComments
  }
}
