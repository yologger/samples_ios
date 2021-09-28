//
//  ViewController.swift
//  chat
//
//  Created by Hyukjung Kwon on 22/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    var chatDatas = [String]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
        }
    }
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableview에 tableview cell 등록
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "my_cell_id")
        
        tableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "your_cell_id")
        
        // 키보드 관련 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        chatDatas.append(inputTextView.text)
        inputTextView.text = ""
        
        let lastIndexPath = IndexPath(row: chatDatas.count-1, section: 0)
        
        // tableView.reloadData()
        // 추가할 로우만 갱신
        tableView.insertRows(at: [lastIndexPath], with: UITableView.RowAnimation.automatic)
        
        // 전송 눌렀을 때 최신 데이터 위치로 이동
        tableView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        
        textViewHeight.constant = 40
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let notiInfo = notification.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.height - self.view.safeAreaInsets.bottom
        
        // 키보드 에니메이션 시간
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let notiInfo = notification.userInfo!
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // myCell, yourCell 번갈아가면서 나오도록 구현
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "my_cell_id", for: indexPath) as! MyCell
            myCell.myTextView.text = chatDatas[indexPath.row]
            // 셀 선택했을 때 배경색 변하지 않도록 함
            myCell.selectionStyle = .none
            return myCell
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "your_cell_id", for: indexPath) as! YourCell
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            yourCell.selectionStyle = .none
            return yourCell
        }
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        // textview가 height에 맞춰 커지고 작아진다.
        // textViewHeight.constant = textView.contentSize.height
        
        if textView.contentSize.height <= 40 {
            // 40 이하로는 줄어들지 않는다.
            textViewHeight.constant = 40
        } else if textView.contentSize.height >= 100 {
            // 100 이상으로 늘어나진 않는다.
            textViewHeight.constant = 100
        } else {
            textViewHeight.constant = textView.contentSize.height
        }
    }
}

