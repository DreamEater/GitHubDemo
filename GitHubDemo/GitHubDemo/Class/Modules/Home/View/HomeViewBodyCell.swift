//
//  HomeViewBodyCell.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import UIKit

class HomeViewBodyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// 赋值
    func set(body: String?) {
        self.textLabel?.text = body ?? ""
    }
    
    /// 初始化
    public static func cell(tableView: UITableView, body: String?) -> HomeViewBodyCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cr_identifier) ??
            HomeViewBodyCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cr_identifier)
        let realCell = cell as! HomeViewBodyCell
        realCell.textLabel?.text = body ?? ""
        return realCell
    }

}
