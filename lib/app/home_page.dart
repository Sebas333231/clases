import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Lista_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Empresa _instagram = Empresa(
    'Instagram', 'Mark', 50000000,
  );
  final Text _nombre = const Text(
      'Hello world',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
            'Clases en flutter',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _nombre,
            ),
            Text(
                _instagram.nombre,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Text(_instagram.propietario),
            Text(_instagram.ingresoAnual.toString()),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext) => ListaPage()
                    )
                  );
                },
                child: Text(
                  'Pasar a las listas',
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            )
          ],
        ),
      )
    );
  }
}
//clase creada con variables de tipo String e int
class Empresa {
    late String nombre;
    late String propietario;
    late int ingresoAnual;

    Empresa(String nombre, String propietario, int ingreso){
      this.nombre = nombre;
      this.propietario = propietario;
      this.ingresoAnual = ingreso;

    }
}
