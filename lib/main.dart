import 'package:hello_flutter/pages/nosotros.dart';
import 'package:hello_flutter/pages/soporte.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: 'App Tienda',
    home: new Home(),
  ));
} 

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 //creamos un arreglo de datos y nombre ejercicio

 List<Container> listamos = [];

 var arreglox = [
   {"nombrecorto": "Perfume Varon","nombre": "Fragancia Calvin Klein Shock For Men EDT 100ML", "imagen": "perfume.jpg" ,"marca": "CALVIN KLEIN", "descripcion": "Perfume de calidad para varones Calvin Klein de 100ML ", "precio" : "S/. 99.00" },
   {"nombrecorto": "Jabon Facial","nombre": "Jabón Liquido Facial - Mild", "imagen": "facial.jpg" ,"marca": "CLINIQUE", "descripcion": "Para piel mixta seca","precio" : "S/. 95.00" }, 
   {"nombrecorto": "Labial","nombre": "Matte Lipstick Taupe", "imagen": "labiales.jpg" ,"marca": "MAC", "descripcion": "El mate icónico, con una fórmula cremosa que ofrece color intenso y acabado mate no brilloso.", "precio" : "S/. 79.00"},
   {"nombrecorto": "Delineador","nombre": "Pro Longwear Eye Liner", "imagen": "delineador.jpg" ,"marca": "MAC", "descripcion": "Pro Longwear Eye Liner","precio" : "S/. 85.00" },
   {"nombrecorto": "Esmalte de uñas","nombre": "Esmalte de Uñas Shine Enamel Vivid", "imagen": "uñas.jpg" ,"marca": "MAX FACTOR", "descripcion": "Esmalte de uñas de brillo intenso y de larga duracion.", "precio" : "S/. 25.00"},
   {"nombrecorto": "Perfume Mujer","nombre": "Versace Yellow Diamond EDT 30 ml", "imagen": "perfumemujer.jpg" ,"marca": "VERSACE", "descripcion": "Se trata de una creación voluptuosa, inspirada en dos elementos naturales: el sol y los diamantes.","precio" : "S/. 99.00" },
   {"nombrecorto": "Bloqueador","nombre": "Bloqueador Mineral Sunscreen", "imagen": "bloqueador.jpg" ,"marca": "CLINIQUE", "descripcion": "Protector solar 100% mineral, ultra ligero y prácticamente invisible, increíblemente cómodo, incluso para pieles sensibles.", "precio" : "S/. 99.00"},
   {"nombrecorto": "Shampoo","nombre": "Shampoo Y Gel De Baño-Previene La Caspa", "imagen": "shampoo.jpg" ,"marca": "ATTITUDE", "descripcion": "Además de ser un shampoo, nuestro producto 2 en 1 también es un gel de baño.","precio" : "S/. 60.00" },
 ];

  _listado() async{
    for (var i = 0; i< arreglox.length; i++){
      final arreglo = arreglox[i];
      final String imagen = arreglo["imagen"];
      
      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arreglo['nombre'], 
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                        nombrecorto: arreglo['nombrecorto'],
                        nombre: arreglo['nombre'],
                        imagen: imagen, 
                        marca: arreglo['marca'],
                        descripcion: arreglo['descripcion'],
                        precio: arreglo['precio']
                      ),
                    )),
                    child: new Image.asset(
                      "image/$imagen",
                      fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                arreglo["nombrecorto"],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Text(
                arreglo["precio"],
                style: new TextStyle(fontSize: 20.0, color: Colors.red),
              ),
            ],
          ),
        ),
      ));
    }
  }

   @override
  void initState() {
      _listado(); 
      super.initState();
      
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Productos de belleza'), backgroundColor: Colors.orange,),
         drawer: new Drawer(
           child: new ListView(
             children: <Widget>[
               new UserAccountsDrawerHeader(
               accountName:new Text('Cosmeticos'),
               accountEmail: new Text('gomezanco16@gmail.com'),
               decoration: new BoxDecoration(
                 image: new DecorationImage(
                   fit: BoxFit.fill,
                   image: AssetImage('image/cosmeticos.png'), 
                 )
               ),
             ),
               new Divider(),
               new ListTile(
                 title: new Text("Quienes somos"),
                 trailing: new Icon(Icons.shop),
                 onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                   builder: (BuildContext context) => Nosotros(),                
                 )),
               ),
               new Divider(),
               new ListTile(
                 title: new Text("Soporte"),
                 trailing: new Icon(Icons.help),
                 onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                   builder: (BuildContext context) => Soporte(),
                 )),
               ),
             ],
           ),
      ),
      body: new GridView.count(
        crossAxisCount: 2, //numero de columnas
        mainAxisSpacing: 0.1,
        childAspectRatio: 0.700,
        children: listamos, 
      ),
    );
  }
}

//cls detalle
class Detalle extends StatelessWidget{
   Detalle({this.nombrecorto, this.nombre, this.imagen, this.marca, this.descripcion, this.precio});
  final String nombrecorto;
  final String nombre;
  final String imagen;
  final String marca;
  final String descripcion;
  final String precio;
    @override   
    Widget build(BuildContext context) {
     var scaffold = Scaffold(
       resizeToAvoidBottomInset : false,
       body: new ListView(
         children: <Widget>[
            new Container(
              height: 387.0,
              child: new Hero(
                tag: nombre,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "image/$imagen",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
                new IniciarNombre(
                  nombre: nombre,
                  precio: precio,
                ),
                           
                new IniciarIcon(
                ),
                new Informacion(
                  marca: marca,
                  descripcion: descripcion,
                ),
         ],
       ), 
      );
      return scaffold;
    }

}
  
class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre, this.precio});
  final String nombre;
  final String precio;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                   new Text(
                  precio,
                  style: new TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ],
            ),
          ),
            new Row(
              children: <Widget>[
                new Icon(
                  Icons.star,
                  size: 30.0,
                  color: Colors.red,
                ),
                new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.orange,
                ),
                new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.purple,
                ),
                new Text(
                  "12",
                  style: new TextStyle(fontSize: 18.0),
                )
              ],
            )
        ],
      ),
    );
  }
} 

class IniciarPrecio extends StatelessWidget {
  IniciarPrecio({this.precio});
  final String precio;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  precio,
                  style: new TextStyle(fontSize: 15.0, color: Colors.blue),
                ),
              ],
            ),
          ),           
        ],
      ),
    );
  }
} 

class IniciarIcon extends StatelessWidget {
  IniciarIcon({this.precio});
  final String precio;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
        new IconTec(
          icon: Icons.shopping_cart,
          tec: "Agregar" 
             ),

            new IconTec(
          icon: Icons.message,
          tec: "Comentarios"
             ),
           new IconTec(
          icon: Icons.star,
          tec: "Calificar"
             ),    
               ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.marca, this.descripcion});
  final String marca;
  final String descripcion;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  marca,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  descripcion,
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

