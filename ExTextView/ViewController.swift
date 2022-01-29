//
//  ViewController.swift
//  ExTextView
//
//  Created by 김종권 on 2022/01/30.
//

import UIKit
import Then
import SnapKit
import UITextView_Placeholder

class ViewController: UIViewController {
  // Font
  private let myFont = UIFont.systemFont(ofSize: 16)
  private lazy var attributedString: NSMutableAttributedString = {
    let placeholderText = "abcd@google.com"
    let range = (placeholderText as NSString).range(of: placeholderText)
    let attributedString = NSMutableAttributedString(string: placeholderText)
    let attributes: [NSAttributedString.Key: Any] = [
      .font: self.myFont
    ]
    attributedString.addAttributes(attributes, range: range)
    return attributedString
  }()
  
  // MARK: UI
  private lazy var textView = UITextView().then {
    // 주의: $0.attributedString으로 설정하면 attributedPlaceholder 속성과 겹쳐서 적용 안되므로,
    // attributedString사용하지 않고 font, textColor로 설정할 것
    
    // font
    $0.attributedPlaceholder = self.attributedString
    $0.font = self.myFont
    $0.textColor = UIColor.black
    
    // Inset
    $0.textContainerInset = .zero
    $0.contentInset = .zero
    $0.scrollIndicatorInsets = .zero
    
    // layer
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    
    // etc.
    $0.returnKeyType = .done
    $0.isEditable = true
    $0.isScrollEnabled = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.textView)
    self.textView.snp.makeConstraints {
      $0.top.left.right.equalToSuperview().inset(100)
      $0.height.equalTo(130)
    }
  }
}
