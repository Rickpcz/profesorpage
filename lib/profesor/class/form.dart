import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController classNameController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextFieldWithIcon(
                controller: classNameController,
                labelText: 'Clase',
                icon: Icons.school,
              ),
              _buildTextFieldWithIcon(
                controller: teacherNameController,
                labelText: 'Profesor',
                icon: Icons.person,
              ),
              _buildTextFieldWithIcon(
                controller: activityController,
                labelText: 'Actividad',
                icon: Icons.assignment,
              ),
              _buildTextFieldWithIcon(
                controller: gradeController,
                labelText: 'Grado',
                icon: Icons.grade,
              ),
              _buildTextFieldWithIcon(
                controller: groupController,
                labelText: 'Grupo',
                icon: Icons.group,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Realiza acciones con los datos del formulario
                    print('Datos enviados:');
                    print('Clase: ${classNameController.text}');
                    print('Profesor: ${teacherNameController.text}');
                    print('Actividad: ${activityController.text}');
                    print('Grado: ${gradeController.text}');
                    print('Grupo: ${groupController.text}');
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, ingresa $labelText';
          }
          return null;
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomForm(),
  ));
}
