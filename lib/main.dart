import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Futurista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormularioPage(),
    );
  }
}

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  String? _genero = 'Masculino';  // Valor inicial para género
  bool _estadoCivil = false; // Checkbox para estado civil

  // Controladores de texto
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario en Flutter'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título del formulario
                  Text(
                    'Formulario de Información Personal',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Campo de Cédula
                  _buildTextField(_cedulaController, 'Cédula', 'Ingrese su cédula'),

                  SizedBox(height: 10),

                  // Campo de Nombres
                  _buildTextField(_nombresController, 'Nombres', 'Ingrese sus nombres'),

                  SizedBox(height: 10),

                  // Campo de Apellidos
                  _buildTextField(_apellidosController, 'Apellidos', 'Ingrese sus apellidos'),

                  SizedBox(height: 10),

                  // Campo de Fecha de Nacimiento
                  _buildTextField(_fechaController, 'Fecha de Nacimiento', 'Ingrese su fecha de nacimiento'),

                  SizedBox(height: 10),

                  // Campo de Edad
                  _buildTextField(_edadController, 'Edad', 'Ingrese su edad'),

                  SizedBox(height: 20),

                  // Selector de Género
                  Row(
                    children: [
                      Text('Género', style: TextStyle(color: Colors.white)),
                      Radio<String>(
                        value: 'Masculino',
                        groupValue: _genero,
                        onChanged: (String? value) {
                          setState(() {
                            _genero = value;
                          });
                        },
                      ),
                      Text('Masculino', style: TextStyle(color: Colors.white)),
                      Radio<String>(
                        value: 'Femenino',
                        groupValue: _genero,
                        onChanged: (String? value) {
                          setState(() {
                            _genero = value;
                          });
                        },
                      ),
                      Text('Femenino', style: TextStyle(color: Colors.white)),
                    ],
                  ),

                  SizedBox(height: 10),

                  // Checkbox de Estado Civil
                  Row(
                    children: [
                      Text('Estado Civil', style: TextStyle(color: Colors.white)),
                      Checkbox(
                        value: _estadoCivil,
                        onChanged: (bool? value) {
                          setState(() {
                            _estadoCivil = value!;
                          });
                        },
                      ),
                      Text('Casado/a', style: TextStyle(color: Colors.white)),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Botón Siguiente
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Lógica para siguiente acción
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Formulario enviado')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Siguiente', style: TextStyle(fontSize: 16)),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Botón Salir
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para salir
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Salir', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Método para crear los campos de texto con validación
  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
    String hintText,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}
