//
//  ViewController.swift
//  Date and Time Picker Use
//
//  Created by Yavuz Güner on 6.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    //Tıkladığımız zaman tarih ve saat açılacak amacımız bu.
    
    var datePicker : UIDatePicker?
    
    //Saat ile ilgili metot yazacağız.
    var hourPicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        
        
        //Saat ile ilgili metotları yazıyoruz.
        hourPicker = UIDatePicker()
        hourPicker?.datePickerMode = .time
        hourTextField.inputView = hourPicker
        
        datePicker?.addTarget(self, action: #selector(self.showDate(datePicker:)), for: .valueChanged)
        
        //Saat için yazdığımız kod.
        hourPicker?.addTarget(self, action: #selector(self.showHour(hourPicker:)), for: .valueChanged)
        
        //Dokunma algılama ile ilgili metot yazacağız.
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.recognizeMethod))
        
        view.addGestureRecognizer(dokunmaAlgilama)
        
    }
    
    @objc func showDate(datePicker:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let sonTarih = dateFormatter.string(from: datePicker.date)
        
        dateTextField.text = sonTarih
        view.endEditing(true) //Tarihi seçtikten sonra Kaybolması için bunu yapacağız.
        print(sonTarih)
    }
    
    @objc func recognizeMethod() {
        view.endEditing(true)
    }
    
    //Saat için yazdığımız selector
    @objc func showHour(hourPicker:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        let sonSaat = dateFormatter.string(from: hourPicker.date)
        hourTextField.text = sonSaat
    }
    

}

