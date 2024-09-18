import 'package:flutter/material.dart';
import 'package:examen_1_lacm/home.dart';
import 'package:examen_1_lacm/utils/constants.dart' as con;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuario = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildLoginForm()
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff520120),
            Color(0xff64011f),
            Color(0xff41011a),
            Color(0xffb20222),
          ],
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.51,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: con.fondo2,
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Center(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bienvenido a tu primer EXAMEN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: con.titulos,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: usuario,
              decoration: InputDecoration(
                labelText: 'Correo/Usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: con.blanco,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: con.blanco,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () { validaUser();},
              child: Text('Iniciar Sesión',
                style: TextStyle(color: con.blanco),),
              style: ElevatedButton.styleFrom(
                backgroundColor: con.botones,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Mi primer examen, ¿estará sencillo?',
              style: TextStyle(color: con.blanco),
            ),
          ],
        ),
      ),
    );
  }
  void validaUser() {
    setState(() {
      if (usuario.text == 'test' && pass.text == 'FDM1') {
        showSnackBar('Bienvenido', 10);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      else if(usuario.text != 'test' && pass.text == 'FDM1') {
        showSnackBar('Usuario incorrecto', 10);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
      else if(usuario.text == 'test' && pass.text != 'FDM1') {
        showSnackBar('Contraseña incorrecta', 10);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
      else if((usuario.text == '' && pass.text == '') || (usuario.text == ' ' && pass.text == ' ')){
        showSnackBar('Datos incompletos', 10);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
      else {
        showSnackBar('Usuario y contraseña incorrectos', 10);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }
  void showSnackBar(String texto, int duracion) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          texto,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: duracion),
        action: SnackBarAction(label: 'Cerrar', onPressed: () {}),
      ),
    );
  }
}
