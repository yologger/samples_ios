import UIKit
import ImageSlideshow

class ImageSliderViewController: UIViewController {
    
    @IBOutlet weak var imageSlideshow: ImageSlideshow!
    
    
    let localSource = [
        BundleImageSource(imageString: "img1"),
        BundleImageSource(imageString: "img2"),
        BundleImageSource(imageString: "img3")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // imageSlideShow.slideshowInterval = 5.0
        imageSlideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
        imageSlideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.black
        imageSlideshow.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        imageSlideshow.activityIndicator = DefaultActivityIndicator()
        imageSlideshow.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        imageSlideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ImageSliderViewController.didTap))
        imageSlideshow.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        // let fullScreenController = imageSlideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        // fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
}

extension ImageSliderViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
