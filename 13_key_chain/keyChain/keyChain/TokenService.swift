import Security
import Foundation

class TokenService {
    
    func save(_ service: String, account: String, value: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        // Delete previous value
        SecItemDelete(keyChainQuery)
        
        // Save new value
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "Fail to save token.")
        NSLog("status=\(status)")
    }
    
    func load(_ service: String, account: String) -> String? {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        
        if (status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            return value
        } else {
            print("Nothing was retrieved from the keychain.")
            return nil
        }
    }
    
    func delete(_ service: String, account: String) {
        
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ]
        
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr, "Fail to delete token")
        NSLog("status=\(status)")
    }
}
