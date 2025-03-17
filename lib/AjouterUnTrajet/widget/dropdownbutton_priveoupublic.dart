import 'package:flutter/material.dart';

class PriveouPublic extends StatefulWidget {
  const PriveouPublic({super.key});

  @override
  _ListederoulanteState createState() => _ListederoulanteState();
}

class _ListederoulanteState extends State<PriveouPublic> {
  String? _valeurchoisi = 'Public';
  final List<String> _options = ['Public', 'Privé'];

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      DropdownButton<String>(
        value: _valeurchoisi,
        onChanged: (String? nouvvaleur) {
          setState(() {
            _valeurchoisi = nouvvaleur;
          });
        },
        items: _options.map<DropdownMenuItem<String>>((String valeur) {
          return DropdownMenuItem<String>(
            value: valeur,
            child: Text(valeur),
          );
        }).toList(),
      ),
      SizedBox(height: 20),
    ]);
  }
}
