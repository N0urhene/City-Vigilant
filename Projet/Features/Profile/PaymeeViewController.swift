
import UIKit
import Alamofire
import WebKit

class PaymeeViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    let httpBody: [String : Any]  = ["vendor": 1834 , "amount": 120.5, "note": "Order #1000132"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: String = "https://sandbox.paymee.tn/api/v1/payments/create"
        //var request = URLRequest(url: url)
        AF.request(URL(string: url)!, method: .post, parameters: httpBody, encoding: JSONEncoding.default, headers: ["Authorization": "Token 887078233f23cfae5cadd25c1fe52982c419fd09", "Content-Type": "application/json"]).response { (response) in
            switch(response.result) {
            case .success(let data):
                print(String(data: data!, encoding: .utf8))
//                if let jsonData = data {
//                    self.parse(json: jsonData)
                break
            case .failure:
                print(Error.self)
            }
        }
        guard let urll = URL(string: "https://sandbox.paymee.tn/gateway/922650f43f77a6fe2fcdbbe4558727e3") else {
            return
        }
        webView.load(URLRequest(url: urll))
    }

}
