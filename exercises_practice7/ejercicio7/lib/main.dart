import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario de Datos',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemYellow,
      ),
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

  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _edadController = TextEditingController();

  String? _genero;
  String? _paisSeleccionado;
  bool _aceptaTerminos = false;
  bool _recibirNotificaciones = false;

  String? _nombreError;
  String? _correoError;
  String? _edadError;
  String? _paisError;
  String? _generoError;
  String? _terminosError;

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _edadController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _nombreError = null;
      _correoError = null;
      _edadError = null;
      _paisError = null;
      _generoError = null;
      _terminosError = null;
    });

    bool isValid = true;

    if (_nombreController.text.isEmpty) {
      setState(() {
        _nombreError = 'Por favor ingresa tu nombre';
      });
      isValid = false;
    }

    if (_correoController.text.isEmpty) {
      setState(() {
        _correoError = 'Por favor ingresa tu correo electrónico';
      });
      isValid = false;
    } else if (!_correoController.text.contains('@')) {
      setState(() {
        _correoError = 'Por favor ingresa un correo electrónico válido';
      });
      isValid = false;
    }

    if (_edadController.text.isEmpty) {
      setState(() {
        _edadError = 'Por favor ingresa tu edad';
      });
      isValid = false;
    } else {
      final int? edad = int.tryParse(_edadController.text);
      if (edad == null) {
        setState(() {
          _edadError = 'Ingresa un número válido';
        });
        isValid = false;
      } else if (edad < 0 || edad > 150) {
        setState(() {
          _edadError = 'Edad debe estar entre 0 y 150';
        });
        isValid = false;
      }
    }

    if (_paisSeleccionado == null) {
      setState(() {
        _paisError = 'Por favor selecciona un país';
      });
      isValid = false;
    }

    if (_genero == null) {
      setState(() {
        _generoError = 'Por favor selecciona un género';
      });
      isValid = false;
    }

    if (!_aceptaTerminos) {
      setState(() {
        _terminosError = 'Debes aceptar los términos y condiciones';
      });
      isValid = false;
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemYellow,
        middle: Text('Formulario con Validaciones'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Nombre
              const Text(
                'Nombre',
                style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
              ),
              const SizedBox(height: 5),
              CupertinoTextField(
                controller: _nombreController,
                placeholder: 'Ingresa tu nombre',
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _nombreError != null
                        ? CupertinoColors.systemRed
                        : CupertinoColors.systemGrey4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              if (_nombreError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 12),
                  child: Text(
                    _nombreError!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Correo electrónico
              const Text(
                'Correo electrónico',
                style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
              ),
              const SizedBox(height: 5),
              CupertinoTextField(
                controller: _correoController,
                placeholder: 'ejemplo@correo.com',
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _correoError != null
                        ? CupertinoColors.systemRed
                        : CupertinoColors.systemGrey4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              if (_correoError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 12),
                  child: Text(
                    _correoError!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Edad
              const Text(
                'Edad',
                style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
              ),
              const SizedBox(height: 5),
              CupertinoTextField(
                controller: _edadController,
                placeholder: 'Ingresa tu edad',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _edadError != null
                        ? CupertinoColors.systemRed
                        : CupertinoColors.systemGrey4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              if (_edadError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 12),
                  child: Text(
                    _edadError!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // País
              const Text(
                'País',
                style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => Container(
                      height: 250,
                      color: CupertinoColors.systemBackground.resolveFrom(context),
                      child: Column(
                        children: [
                          Container(
                            height: 44,
                            color: CupertinoColors.systemGrey6.resolveFrom(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                  child: const Text('Listo'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 32,
                              onSelectedItemChanged: (int index) {
                                setState(() {
                                  _paisSeleccionado = _paises[index];
                                });
                              },
                              children: _paises
                                  .map((pais) => Center(child: Text(pais)))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _paisError != null
                          ? CupertinoColors.systemRed
                          : CupertinoColors.systemGrey4,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _paisSeleccionado ?? 'Selecciona un país',
                        style: TextStyle(
                          color: _paisSeleccionado == null
                              ? CupertinoColors.placeholderText
                              : CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_down,
                        size: 20,
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  ),
                ),
              ),
              if (_paisError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 12),
                  child: Text(
                    _paisError!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Género
              const Text(
                'Género',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              _buildRadioOption('Masculino'),
              _buildRadioOption('Femenino'),
              _buildRadioOption('Otro'),
              if (_generoError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 5),
                  child: Text(
                    _generoError!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Términos y condiciones
              GestureDetector(
                onTap: () {
                  setState(() {
                    _aceptaTerminos = !_aceptaTerminos;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      _aceptaTerminos
                          ? CupertinoIcons.check_mark_circled_solid
                          : CupertinoIcons.circle,
                      color: _aceptaTerminos
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text('Acepto los términos y condiciones'),
                    ),
                  ],
                ),
              ),
              if (_terminosError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 5),
                  child: Text(
                    _terminosError!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Switch para notificaciones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recibir notificaciones'),
                  CupertinoSwitch(
                    value: _recibirNotificaciones,
                    onChanged: (value) {
                      setState(() {
                        _recibirNotificaciones = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Botón de registro
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: () {
                    if (_validate()) {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Éxito'),
                          content: const Text('Formulario enviado'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Registrarse'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _genero = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              _genero == value
                  ? CupertinoIcons.check_mark_circled_solid
                  : CupertinoIcons.circle,
              color: _genero == value
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.systemGrey,
            ),
            const SizedBox(width: 10),
            Text(value),
          ],
        ),
      ),
    );
  }
}