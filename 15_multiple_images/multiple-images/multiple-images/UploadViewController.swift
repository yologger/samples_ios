import UIKit
import Alamofire

class UploadViewController: UIViewController {
    
    @IBAction func uploadSingleImage(_ sender: Any) {
        
        let BASE_URL = "http://localhost:8000"
        
        let headers: HTTPHeaders = [
            "Content-Type": "multipart/form-data"
        ]
        
        let parameters = [
            "email" : "ronaldo@gmail.com",
            "name": "Ronaldo"
        ]
        
        let image1fileName = "avatar1.png"
        let image1 = UIImage(named: image1fileName)
        let image1Data = image1?.pngData()

        AF.upload(multipartFormData: { multipartFormData in

            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: .utf8)!, withName: key, mimeType: "text/plain")
            }
            multipartFormData.append(image1Data!, withName: "field", fileName: image1fileName, mimeType: "image/*")

        }, to: "\(BASE_URL)/post/img", method: .post, headers: headers, interceptor: CustomInterceptor())
        .responseString { response in

        }
    }
    
    
    @IBAction func uploadMultipleImages(_ sender: Any) {
        
        let BASE_URL = "http://localhost:8000"
        
        let headers: HTTPHeaders = [
            "Content-Type": "multipart/form-data"
        ]
        
        let parameters = [
            "email" : "ronaldo@gmail.com",
            "name": "Ronaldo"
        ]
        
        let image2fileName = "avatar2.jpg"
        let image2 = UIImage(named: image2fileName)
        let image2Data = image2?.jpegData(compressionQuality: 1)
        
        let image3fileName = "avatar3.png"
        let image3 = UIImage(named: image3fileName)
        let image3Data = image3?.pngData()
        
        AF.upload(multipartFormData: { multipartFormData in
            
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: .utf8)!, withName: key, mimeType: "text/plain")
            }
            
            multipartFormData.append(image2Data!, withName: "field", fileName: image2fileName, mimeType: "image/*")
            

            multipartFormData.append(image3Data!, withName: "field", fileName: image3fileName, mimeType: "image/*")
            
        }, to: "\(BASE_URL)/post/imgs", method: .post, headers: headers, interceptor: CustomInterceptor())
        .responseString { response in
            print(response)
        }
    }
}


class CustomInterceptor: Interceptor {
    
}
