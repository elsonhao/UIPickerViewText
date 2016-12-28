//
//  ViewController.swift
//  DatePicker
//
//  Created by 黃毓皓 on 2016/12/28.
//  Copyright © 2016年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

   
    @IBOutlet weak var datePickerTxt: UITextField!
    
    //data是PickerView的內容
    var data = ["1","2","3"]
    //產生PickerView
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定代理人和資料來源為viewController
        picker.delegate = self
        picker.dataSource = self
        
        //讓textfiled的輸入方式改為PickerView
        datePickerTxt.inputView = picker
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func closeKeyboard(){
        self.view.endEditing(true)
    }
    
    //有幾個區塊
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    //裡面有幾列
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return data.count
    }
    
    //選擇到的那列要做的事
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       datePickerTxt.text = data[row]
    }
    
    //設定每列PickerView要顯示的內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }

}

