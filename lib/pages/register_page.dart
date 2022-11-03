import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  String _data = "Información: ";

  Genre? _genre = Genre.masculino;

  bool _volqueta_sencilla = false;
  bool _volquetaDobleTroque = false;
  bool _maquinariaPesada = false;

  String buttonMsg = "Fecha de nacimiento";

  String _date = "";

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-mm-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelecDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es","CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _date = _dateConverter(newDate);
        buttonMsg = "Fecha de nacimiento ${_date.toString()}";
      });
    }
  }

  void _onRegisterButtonClicked() {
    setState(() {
      String genre = "Masculino";
      if (_genre == Genre.femenino) {
        genre = "Femenino";
      }
      String maquinaria = "";
      if (_volqueta_sencilla) maquinaria = "$maquinaria Volqueta sencilla";
      if (_volquetaDobleTroque) maquinaria = "$maquinaria Volqueta doble troque";
      if (_maquinariaPesada) maquinaria = "$maquinaria Maquinaria pesada";

      _data =
      "Nombre: ${_name.text} \n Correo electrónico: ${_email.text} \n Genero: $genre \nVehiculo asiganado: $maquinaria\nFecha de nacimineto:$_date";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              // Permite hacer desplazamiento sin afectar pantalla
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/logo.png')),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre conductor'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo electrónico'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _showSelecDate();
                    },
                    child: Text(buttonMsg),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _repPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repeita contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Masculino'),
                          leading: Radio<Genre>(
                              value: Genre.masculino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Femenino'),
                          leading: Radio<Genre>(
                              value: Genre.femenino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Maquinaria de carga',
                    style: TextStyle(fontSize: 20),
                  ),
                  CheckboxListTile(
                    title: const Text('Volqueta sencilla'),
                    value: _volqueta_sencilla,
                    selected: _volqueta_sencilla,
                    onChanged: (bool? value) {
                      setState(() {
                        _volqueta_sencilla = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Volqueta doble troque'),
                    value: _volquetaDobleTroque,
                    selected: _volquetaDobleTroque,
                    onChanged: (bool? value) {
                      setState(() {
                        _volquetaDobleTroque = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Maquinaria pesada'),
                    value: _maquinariaPesada,
                    selected: _maquinariaPesada,
                    onChanged: (bool? value) {
                      setState(() {
                        _maquinariaPesada = value!;
                      });
                    },
                  ),

                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar"),
                  ),
                  Text(
                    _data,
                    style: const TextStyle(
                        fontSize: 12, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          )),
    );
  }
}