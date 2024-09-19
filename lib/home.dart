import 'package:examen_1_lacm/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen_1_lacm/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;
  final Set<String> noEliminables = {'10', '15', '20', '23'};

  @override
  void initState() {
    lista = List.from(con.listaExamen); // Crea una copia mutable de la lista original
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: con.fondo,
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildActivityList(),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: con.fondo3,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'Notificaciones de actividades',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: con.titulos,
        ),
      ),
    );
  }
  Widget _buildActivityList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final activityData = lista[index].split('#');
        final id = activityData[1];
        final title = activityData[2];
        final note = activityData[3];
        final rating = int.parse(activityData[4]);

        return _buildActivitytwoCard(id, title, note, rating, index);
      },
    );
  }
  Widget _buildActivitytwoCard(String id, String title, String note, int rating, int index){
    return Column(
      children: [
        if(int.parse(id) % 2 != 0)
          // Primer card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        id,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: con.fondo4,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.eco, color: con.efectos),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: con.titulos
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    note,
                    style: TextStyle(
                      fontSize: 14,
                      color: con.subtitulos,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: index < rating ? con.estrellas : con.subtitulos,
                            size: 20,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        // Segundo card con botones
        if(int.parse(id) % 2 == 0)
          Card(
            color: con.fondo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child:
              Row(
                children: [
                  // Card para el texto y las estrellas
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  id,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: con.fondo4,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.eco, color: con.efectos),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: con.titulos,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              note,
                              style: TextStyle(
                                fontSize: 14,
                                color: con.subtitulos,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < rating ? Icons.star : Icons.star_border,
                                  color: index < rating ? con.estrellas : con.subtitulos,
                                  size: 20,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Card para los botones
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MoreInfo()),
                              );
                            },
                            icon: Icon(Icons.edit, size: 16),
                            label: Text('Ver más'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: con.botones,
                              foregroundColor: con.blanco,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          ElevatedButton.icon(
                            onPressed: () {
                              _eliminarElemento(id, index);
                            },
                            icon: Icon(Icons.delete, size: 16),
                            label: Text('Borrar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: con.botones,
                              foregroundColor: con.blanco,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          )
      ],
    );
  }
  void _eliminarElemento(String id, int index) {
    if (!noEliminables.contains(id)) {
      setState(() {
        lista.removeAt(index);
      });
    }
    con.showSnackBar(context,"Elemento con id: $id eliminado", 5);
  }
  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'SEGUNDA VISTA: Camarena Martínez Luis Angel',
        style: TextStyle(
          color: con.blanco,
          fontSize: 14,
        ),
      ),
    );
  }
}
