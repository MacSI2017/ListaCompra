import Foundation


class LocationModel: NSObject {
    
    //properties
    
    var nombre: String?
    var cantidad: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(nombre: String, cantidad: String) {
        
        self.nombre = nombre
        self.cantidad = cantidad
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "nombre: \(nombre), cantidad: \(cantidad)"
        
    }
    
    
}
