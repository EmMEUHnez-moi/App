import 'package:flutter/material.dart';

class ListeDeroulante extends StatefulWidget {
  final String label; // Le titre à afficher au-dessus de la liste déroulante
  final List<String> options;
  final Function(String?) onChanged;

  ListeDeroulante({
    required this.label,
    required this.options,
    required this.onChanged,
  });

  @override
  _ListeDeroulanteState createState() => _ListeDeroulanteState();
}

class _ListeDeroulanteState extends State<ListeDeroulante> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.options.isNotEmpty ? widget.options[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligne les éléments à gauche
      children: [
        // Titre au-dessus de la liste déroulante
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.deepPurple, // Couleur du texte // Texte en gras
          ),
        ), // Espacement entre le titre et la liste déroulante
        // Liste déroulante avec style personnalisé
        Container(
          width: double.infinity, // Prend toute la largeur disponible
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), // Coins arrondis
            border: Border.all(color: const Color.fromARGB(255, 135, 134, 134)), // Bordure grise
            color: Colors.white, // Fond blanc
          ),
          child: DropdownButton<String>(
            isExpanded: true, // Étend la largeur pour occuper toute la place
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
              widget.onChanged(newValue); // Appelle la méthode de callback
            },
            items: widget.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15), // Ajoute un alinéa à gauche 
                  child: Text(value),
                ),
              );
            }).toList(),
            style: TextStyle(color: Colors.black), // Couleur du texte
            underline: Container(), // Supprime la ligne sous la liste déroulante
          ),
        ),
      ],
    );
  }
}
