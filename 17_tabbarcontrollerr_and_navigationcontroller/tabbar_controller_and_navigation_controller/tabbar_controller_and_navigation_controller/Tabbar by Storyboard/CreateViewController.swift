import UIKit
import RxSwift
import RxCocoa

class CreateViewController : BaseViewController, StoryboardInstantiable {
    
    static var storyboard: AppStoryboard = .create
    var viewModel: CreateViewModel?
    
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textViewContent: UITextView!
    
    @IBOutlet weak var navigationBar: UIView!
    
    
    override func viewDidLoad() {
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    private func setupUI() {
        navigationBar.backgroundColor = AppColor.NavigationBar.backgroundColor
        buttonClose.tintColor = AppColor.NavigationBar.itemColor
        buttonSave.tintColor = AppColor.NavigationBar.itemColor
    }
    
    private func setupBinding() {
        
        guard let vm = viewModel else { return }
        
        buttonClose.rx.tap.bind { [weak self] in
            self?.viewModel?.close()
        }.disposed(by: self.disposeBag)
        
        textFieldTitle.rx.text.orEmpty
            .bind(to: vm.title)
            .disposed(by: disposeBag)
        
        textViewContent.rx.text.orEmpty
            .bind(to: vm.content)
            .disposed(by: disposeBag)
    }
    
    @IBAction func save(_ sender: Any) {
        guard
            let vm = viewModel,
            let title = textFieldTitle.text,
            let content = textViewContent.text
        else { return }
        
        if (title == "" && content == "") {
            return
        } else {
            vm.save(title: title, content: content)
        }
    }
}
