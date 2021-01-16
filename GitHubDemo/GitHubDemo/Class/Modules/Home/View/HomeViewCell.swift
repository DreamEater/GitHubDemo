//
//  HomeViewCell.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import UIKit

class HomeViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    /// 赋值
    func set(model: HomeTableCellModel) {
        //self.textLabel?.text = model.url_name
        self.detailTextLabel?.text = model.url_path
    }
    
    /// 初始化
    public static func cell(tableView: UITableView, model: HomeTableCellModel) -> HomeViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cr_identifier) ??
            HomeViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: self.cr_identifier)
        let realCell = cell as! HomeViewCell
        ///realCell.textLabel?.text = model.url_name
        realCell.textLabel?.text = model.url_path
        return realCell
    }
    
}
