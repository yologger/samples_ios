//
//  ViewController.swift
//  expandable_tableview_cell
//
//  Created by Hyukjung Kwon on 21/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

struct PostDataModel {
    var title: String
    var description: String
    var isExpanded: Bool
}

class ExpandableTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts: Array<PostDataModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = [
            PostDataModel(title: "titl0", description: "long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text ", isExpanded: false),
            PostDataModel(title: "titl1", description: "short text", isExpanded: false),
            PostDataModel(title: "titl2", description: "long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text ", isExpanded: false),
            PostDataModel(title: "titl3", description: "short text", isExpanded: false),
            PostDataModel(title: "titl4", description: "ong text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text ", isExpanded: false),
            PostDataModel(title: "titl5", description: "short text", isExpanded: false),
            PostDataModel(title: "titl6", description: "short text", isExpanded: false),
            PostDataModel(title: "titl7", description: "short text", isExpanded: false),
            PostDataModel(title: "titl8", description: "short text", isExpanded: false),
            PostDataModel(title: "titl9", description: "short text", isExpanded: false),
            PostDataModel(title: "titl10", description: "ong text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text ", isExpanded: false),
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandable_cell_id", for: indexPath) as! ExpandableTableViewCell
        cell.titleLabel.text = posts[indexPath.row].title
        cell.descriptionLabel.text = posts[indexPath.row].description
        
        if posts[indexPath.row].isExpanded == true {
            // 텍스트 줄 만큼 동적으로 다 표현한다.
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        // 클릭 시 효과 없애기
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        posts[indexPath.row].isExpanded = !posts[indexPath.row].isExpanded
        
        // 특정 row만 갱신
        // 다만 마지막 셀이 튀는 문제가 발생할 수도 있다.
        tableView.reloadRows(at: [indexPath], with: .none)
        
        // 방법 1
        // tableView 전체 갱신
        // tableView.reloadData()
        
        // 방법 2
        // heightForRowAt 에서 정확한 높이를 지정
        
        // 방법 3
        // tableView.estimatedSectionHeaderHeight = 0
        // tableView.estimatedSectionFooterHeight = 0
        
        // 방법 4 - 에니메이션 효과 없애버리기
        // UIView.setAnimationsEnabled(false)  // 화면 모두에서 에니메이션을 없애버림
        // tableView.reloadRows(at: [indexPath], with: .none) // 특정 로우만 다시 리로드하고 애니메이션 다시 on
        // UIView.setAnimationsEnabled(true)
    }
}
