/*
Archivo donde se almacenan las variables constantes
 */
import 'package:flutter/material.dart';

const blanco = Color(0xFFFFFFFF);
const fondo = Color(0xff520120);
const fondo2 = Color(0xff64011f);
const fondo3 = Color(0xff41011a);
const fondo4 = Color(0xffb20222);
const titulos = Color(0xff948800);
const botones = Color(0xffa65476);
const efectos = Color(0xff919b02);
const fondoForm = Color(0x80FFFFFF);
const subtitulos = Colors.grey;
const estrellas = Colors.amber;

const List listaExamen = [
//'id # número # titulo # descripción # num de estrellas en amarillo'
'3#3# Iniciar Login# Nota: Terminarlo antes del home#5',
'4#4# Iniciar Home# Nota:Es el más complicado#4',
'5#5# Iniciar More_info # Nota: Es el más sencillo#5',
'6#6# Terminar examen # Nota: No esta tan fácil#3',
'7#7# No me repruebe # Nota: No quiero reprobar#2',
'8#8# Estudiar # Nota: tengo que estudiar para otros examenes#1',
'9#9# Ir al cine # Nota: No se que peliculas esten en cartelera#0',
'10#10# No se que poner # Nota: Se me acaban las ideas#5',
'11#11# Hola # Nota: Mucha lista#4',
'12#12# Computadora # Nota: Buenas tardes#3',
'13#13# Futurama # Nota: Buena serie#2',
'14#14# Llamar a mamá # Nota: necesito decirle algo importante#1',
];

void showSnackBar(BuildContext context, String texto, int duracion) {
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