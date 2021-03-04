import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nivelEstudios = ["Pregrado","Posgrado"];
  String nivelEstudioValue;

  final pregrado = ["Administración de empresas", "Comercio y Negocios Internacionales", "Contaduría Pública",
    "Ingeniería de Sistemas", "Ingeniería multimedia", "Ingeniería Industrial", "Ingeniería Mecánica"];

  final posgrado = ["Maestría en Administración de Empresas e Innovacion",
    "Maestría en Auditoría de Sitemas de la Calidad en Servicios de Salud"];
  String gradoValue;


  List dropdownButton = [];

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Universidad Simón Bolívar'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Divider(
                        color: Colors.black26,
                        height: 30.0,
                      )
                    ),
                  ),
                ]
              ),
              Text('Tipo de estudio'),
              DropdownButton(
                value: nivelEstudioValue,
                hint: Text('Seleccionar'),
                items: nivelEstudios.map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value)
                  )
                ).toList(),
                onChanged: ( value ) {
                  if ( value == "Pregrado") {
                    dropdownButton = pregrado;
                    text = "${value} - ";
                  } else {
                    dropdownButton = posgrado;
                  }
                  text = "${value} - ";
                  nivelEstudioValue = value;
                  gradoValue = null;
                  setState(() {
                    
                  });
                }
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Divider(
                        color: Colors.black26,
                        height: 30.0,
                      )
                    ),
                  ),
                ]
              ),
              Text('Programas existentes'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Seleccionar'),
                  value: gradoValue,
                  items: dropdownButton.map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value)
                    )
                  ).toList(),
                  onChanged: ( value ) {
                    text = "${text} ${value}";
                    gradoValue = value;
                    setState(() {
                      
                    });
                  }
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Divider(
                        color: Colors.black26,
                        height: 30.0,
                      )
                    ),
                  ),
                ]
              ),
              Text(text),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: ( ) {
                  SystemNavigator.pop();
                },
                child: Text('Salir')
              )
            ],
          ),
        ),
      ),
    );
  }
}