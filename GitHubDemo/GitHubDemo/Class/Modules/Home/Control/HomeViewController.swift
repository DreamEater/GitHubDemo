//
//  HomeViewController.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import UIKit

class HomeViewController: UITableViewController {
    
    enum Sections: Int {
        case headers, body
    }
    
    private let _dataArray: Array<HomeTableCellModel> = {
        var array = Array<HomeTableCellModel>()
        array.append(HomeTableCellModel.init(path: "\(MJGitRouter.repository_search_url("", "").path)"))
        array.append(HomeTableCellModel.init(path: "\(MJGitRouter.emojis_url.path)"))
        array.append(HomeTableCellModel.init(path: "\(MJGitRouter.user_url("").path)"))
        return array
    }()

    var body: String?       /// GitHub API请求到的数据
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.startRequest()
        }
        
        self.tableView.reloadData()
    }

    private func startRequest() {
        HomeViewAPI().requestBaseApi { response in
            print("\(response)")
        }
    }
}


extension HomeViewController {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch Sections(rawValue: section)! {
        case .headers:
            return _dataArray.count
        case .body:
            return  1
        }
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section)! {
        case .body:
            return 300
        default:
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        switch Sections(rawValue: section)! {
        case .headers:
            return "Headers"
        case .body:
            return "https://api.github.com 返回值"
        }
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .headers:
            return HomeViewCell.cell(tableView: tableView, model: _dataArray[indexPath.row])
        case .body:
            return HomeViewBodyCell.cell(tableView: tableView, body: body)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            /// 仓库查询
        break
        case 1:
            ///emojis
        break
        case 2:
            /// 用户查询 -- 默认【DreamEater】
        break
        default: break
        }
    }
}
