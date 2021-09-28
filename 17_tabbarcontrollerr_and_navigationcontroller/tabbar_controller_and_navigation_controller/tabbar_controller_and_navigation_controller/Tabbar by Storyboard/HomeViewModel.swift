import UIKit
import RxSwift

class HomeViewModel: BaseViewModel {
    
    private var memoRepository: MemoRepository
        
    init(memoRepository: MemoRepository) {
        self.memoRepository = memoRepository
        super.init()
    }
    
    var _memos = Array<Memo>()
    
    let event = PublishSubject<HomeVMEvent>()
    let memos = PublishSubject<Array<Memo>>()
    
    func getAllMemos() {
        memoRepository.getAllMemos()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] (memos) in
                self?.memos.onNext(memos)
                self?._memos = memos
                print(memos)
            } onFailure: { (error) in
                
            } onDisposed: {
                
            }.disposed(by: disposeBag)
    }
    
    func openCreateNewPost() {
        event.onNext(.OPEN_CREATE_NEW_POST)
    }
    
    func openReorder() {
        event.onNext(.OPEN_REORDER)
    }
    
    func openDelete() {
        event.onNext(.OPEN_DELETE)
    }
    
    func openDetail(memoId: Int) {
        event.onNext(.OPEN_DETAIL(memoId))
    }
}
