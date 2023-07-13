import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  final List <Personas> _personas = [
    Personas('Juan', 'Gonzalez', '+123456789'),
    Personas('Andrea', 'Martinez', '+123456789')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Listas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                this._borrarPersona(context, _personas[index]);
              },
              title: Text(_personas[index].name + ' ' + _personas[index].lastname),
              subtitle: Text(_personas[index].phone),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0,1)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios
              ),
            );
          }
      ),
    );
  }
  _borrarPersona(context, Personas _personas){
    showDialog(
        context: context,
        builder: ( _ ) => AlertDialog(
          title: Text('Eliminar contacto'),
          content: Text('Estas segurp de eliminar a ' + _personas.name + '?'),
          actions: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancelar')
            ),
            ElevatedButton(
                onPressed: (){
                  print('Se elimino a ' + _personas.name + ' de tu lista');
                  this.setState(() {
                    this._personas.remove(_personas);
                  });
                  Navigator.pop(context);
                },
                child: Text('Eliminar')
            )
          ],
        )
    );
  }
}


class Personas{
  late String name;
  late String lastname;
  late String phone;

  Personas(name, lastname, phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}