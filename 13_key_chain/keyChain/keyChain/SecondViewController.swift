import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var accessTokenTextView: UITextView!
    @IBOutlet weak var refreshTokenTextView: UITextView!
    
    let bundleId = Bundle.main.bundleIdentifier
    let tokenService: TokenService = TokenService()
    
    override func viewDidLoad() {
        if let accessToken = tokenService.load(bundleId!, account: "accessToken") {
            accessTokenTextView.text = accessToken
        } else {
            print("accessToken is nil")
        }
        
        if let refreshToken = tokenService.load(bundleId!, account: "refreshToken") {
            refreshTokenTextView.text = refreshToken
        } else {
            print("refreshToken is nil")
        }
    }
}
