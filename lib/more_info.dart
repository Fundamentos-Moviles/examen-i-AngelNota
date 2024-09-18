import 'package:flutter/material.dart';
import 'package:examen_1_lacm/utils/constants.dart' as con;

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  List<Widget> boxes = [];

  void _addBox() {
    setState(() {
      Color boxColor = boxes.length.isEven ? con.fondo4 : con.fondo2;
      boxes.add(
        Container(
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.fondo,
      appBar: AppBar(
        backgroundColor: con.fondo2,
        title: const Text('More Info', style: TextStyle(color: con.blanco)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 12,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: boxes,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: _addBox,
              style: ElevatedButton.styleFrom(
                backgroundColor: con.botones,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Agregar recuadro',
                style: TextStyle(color: con.blanco),
              ),
            ),
          ),
        ],
      ),
    );
  }
}