# GardenApplicationiOS
An iOS application project based on collaborative gardens made by IT students

#### Documentation Technique de l'application:

  L'application fait appel à une `API` par le biais d'un web services.
  La classe consacré à ce dernier est `WebServiceHandler.swift`, elle utilise la librairie `ALAMOFIRE`.
  
  Pour s'en servir il suffit d'ajouter en attribut de classe le lien vers lequel vous voulez faire un appel web service. Ex: `internal static let allGardensUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/gardens"`.
  
  Ensuite on crée une fonction permettant de faire un GET, POST, PUT etc ...
  
    func getAllGardens(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allGardensUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
  Dans cet exemple on crée une procédure qui permet de faire un GET de tous les garden contenus dans notre API.
  
  Ensuite une fois dans votre viewController, il suffit d'appeler le `singleton` de la classe `WebServiceHandler.swift`:
    
    var city:City = City(json: nil)
    var gardenList: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebServiceHandler.sharedInstance.getAllGardens({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let garden:Garden = Garden(object: element)
                if self.city.cityId == garden.gardenRefCity {
                    self.gardenList.addObject(garden)
                }
            }
            self.gardenTableView.reloadData()
        })
    }
  
  Les `classes Modeles`, sont les classes qui instancies respectivement chacune leur `Objet` susnommée, elles permettent de récupérer les `paramètres JSON` et de les convertir en des attributs de classe afin d'instancier leur Objet et vice versa.
  
  

