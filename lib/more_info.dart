import 'package:flutter/material.dart';
import 'package:examen_1_lacm/utils/constants.dart' as con;
import 'dart:math';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  List<Color> boxColors = [];
  final Random _random = Random();

  void _addBox() {
    setState(() {
      List<Color> colors = [con.fondo2, con.fondo3, con.fondo4];
      Color boxColor = colors[_random.nextInt(colors.length)];
      boxColors.add(boxColor);
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
            child: GridView.builder(
              itemCount: boxColors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 12,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  key: UniqueKey(),
                  decoration: BoxDecoration(
                    color: boxColors[index],
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
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