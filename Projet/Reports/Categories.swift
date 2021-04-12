
import UIKit
struct  categories: Decodable  {
    let name: String
    let icon: String
    
    
    enum codingKeys: String, CodingKey {
        case name
        case icon
       
    }
}
