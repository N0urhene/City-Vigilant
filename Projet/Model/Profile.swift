import UIKit

struct  Profile: Decodable  {
    let title: String
    let imageIcon: String
    
    
    enum codingKeys: String, CodingKey {
        case title
        case imageIcon
       
    }
}
