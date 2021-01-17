//
//  HomeViewBodyCell.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import UIKit
import SnapKit

class HomeViewBodyCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    /// MARK -
    private var _textView = UITextView()

    private func setupViews() {
        self.selectionStyle = .none

        let textView = UITextView.init()
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.textColor = .black
        textView.clipsToBounds = false
        textView.layoutManager.allowsNonContiguousLayout = false

        _textView = textView
        
        self.addSubview(_textView)
        
        _textView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func setBody(_ msg: String?) {
        _textView.text = msg ?? ""
    }
    
    /// 初始化
    public static func cell(tableView: UITableView, body: String?) -> HomeViewBodyCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cr_identifier) ??
            HomeViewBodyCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cr_identifier)
        let realCell = cell as! HomeViewBodyCell
        realCell.setBody(body)
        return realCell
    }

}
