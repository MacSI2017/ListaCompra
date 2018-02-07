import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tfnombre: UITextField!
    @IBOutlet weak var tfcantidad: UITextField!
    var  message : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func del(_ sender: Any) {
        if tfnombre.text == "" {
            
        }
        else{
            //put the link of the php file here. The php file connects the mysql and swift
            let request = NSMutableURLRequest(url: NSURL(string: "http://iesayala.ddns.net/javahamuerto/del.php")! as URL)
            request.httpMethod = "POST"
            
            let postString = "a=\(tfnombre.text!)"
            
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    self.message = "Error 1"
                    return
                }
                
                print("response = \(response)")
                
                
                // resultado (valor del echo de php)
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                if ((responseString?.isEqual(to: "1")))! {
                    self.message = "Eliminado"
                    
                }
                else {
                    self.message = "Error al añadir"
                }
                
                print("responseString = \(responseString)")
            }
            task.resume()
            let alert = UIAlertController(title: "Registro", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            print("ffff \(self.message)")
            tfnombre.text = ""
            tfcantidad.text = ""
            tfnombre.becomeFirstResponder()  // pasar foco
            
        }
    }
    
    @IBAction func add(_ sender: Any) {
        if tfnombre.text == "" || tfcantidad.text == ""{
            
        }
        else{
            //put the link of the php file here. The php file connects the mysql and swift
            let request = NSMutableURLRequest(url: NSURL(string: "http://iesayala.ddns.net/javahamuerto/add.php")! as URL)
            request.httpMethod = "POST"
            
            let postString = "a=\(tfnombre.text!)&b=\(tfcantidad.text!)"
            
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    self.message = "Error 1"
                    return
                }
                
                print("response = \(response)")
                
                
                // resultado (valor del echo de php)
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                if ((responseString?.isEqual(to: "1")))! {
                    self.message = "Añadido"
                    
                }
                else {
                    self.message = "Error al añadir"
                }
                
                print("responseString = \(responseString)")
            }
            task.resume()
            let alert = UIAlertController(title: "Registro", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            print("ffff \(self.message)")
            tfnombre.text = ""
            tfcantidad.text = ""
            tfnombre.becomeFirstResponder()  // pasar foco
            
        }
    }
}

