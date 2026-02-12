import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario de Datos',
      home: const MyForm(),
    );
  }
} 

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();
  
  final _paises = [
    "España",
    "Francia",
    "Portugal",
    "Italia",
    "Alemania",
    "Reino Unido",
    "Noruega",
    "Dinamarca",
    "Estados Unidos",
    "China",
    "Korea del Sur",
    "Korea del Norte",
    "Tailandia",
    "Japón",
  ];

  String? _genero;
  String? _paisSeleccionado;
  bool _aceptaTerminos = false;
  bool _recibirNotificaciones = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Formulario con Validaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height:5),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo electrónico';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor ingresa un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height:5),
              TextFormField(
                decoration: InputDecoration(labelText: 'Edad'),
                keyboardType: .number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu edad';
                  }
                  final int? edad = int.tryParse(value);
                  if(edad == null){
                    return 'Ingresa un número válido';
                  }
                  if(edad < 0 || edad > 150){
                    return 'Edad debe estar entre 0 y 150';
                  }
                  return null;
                },
              ),
              SizedBox(height:20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'País',
                  border: OutlineInputBorder(),
                ),
                initialValue: _paisSeleccionado,
                items: _paises
                    .map(
                      (pais) => DropdownMenuItem<String>(
                        value: pais,
                        child: Text(pais),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _paisSeleccionado = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor selecciona un país';
                  }
                  return null;
                },
              ),
              SizedBox(height:20),
              FormField<String>(
                validator: (_) {
                  if (_genero == null) {
                    return 'Por favor selecciona un género';
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Género', style: TextStyle(fontSize: 16)),
                      RadioGroup<String>(
                        groupValue: _genero,
                        onChanged: (value) {
                          setState(() {
                            _genero = value;
                          });
                          formFieldState.didChange(value);
                        },
                        child: Column(
                          children: const [
                            RadioListTile<String>(
                              value: 'Masculino',
                              title: Text('Masculino'),
                              dense: true,
                              visualDensity: .comfortable,
                              contentPadding: EdgeInsets.symmetric(horizontal: 0)
                            ),
                            RadioListTile<String>(
                              value: 'Femenino',
                              title: Text('Femenino'),
                              dense: true,
                              visualDensity: .comfortable,
                              contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            ),
                            RadioListTile<String>(
                              value: 'Otro',
                              title: Text('Otro'),
                              dense: true,
                              visualDensity: .comfortable,
                              contentPadding: EdgeInsets.symmetric(horizontal: 0)
                            ),
                          ],
                        ),
                      ),
                      if (formFieldState.hasError)
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            formFieldState.errorText!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),
              FormField<bool>(
                initialValue: _aceptaTerminos,
                validator : (value) {
                  if (value != true) return 'Debes aceptar los términos y condiciones';
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: .start,
                    children : [
                      CheckboxListTile(
                        contentPadding: .zero,
                        title : const Text('Acepto los términos y condiciones'),
                        value : formFieldState.value,
                        onChanged : (value) {
                          formFieldState.didChange(value);
                          setState(() {
                            _aceptaTerminos = value ?? false;
                          });
                        },
                        controlAffinity: .leading,  
                      ),
                      if (formFieldState.hasError)
                        Padding(
                          padding: .only(left: 12),
                          child : Text(
                            formFieldState.errorText!,
                            style : const TextStyle(
                              color : Colors.red,
                              fontSize: 12
                            )
                          )
                        ),
                    ]
                  );
                }
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Recibir notificaciones'),
                value: _recibirNotificaciones,
                onChanged: (value) {
                  setState(() {
                    _recibirNotificaciones = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Procesa los datos del formulario
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulario enviado')),
                      );
                    }
                  },
                  child: Text('Registrarse'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

