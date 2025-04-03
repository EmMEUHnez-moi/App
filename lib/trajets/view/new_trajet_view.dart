import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/view/accueil_view.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/dropdownbutton_priveoupublic.dart';
import 'package:emmeuhnez_moi_app/favoris/view/new_trajet_favoris_view.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';




class NewTrajetView extends StatefulWidget {
  const NewTrajetView({super.key});

  @override
  _NewTrajetViewState createState() => _NewTrajetViewState();
}

class _NewTrajetViewState extends State<NewTrajetView> {
  final TextEditingController _departController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _horaireController = TextEditingController();
  final TextEditingController _placesdispoController = TextEditingController();
  final TextEditingController _lieurdvController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  /// Ouvre le Date Picker
  void _selectDate(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        'Sélectionner une date',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime.now(),
      maxDateTime: DateTime(2100),
      minDateTime: DateTime(2024),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onSubmit: (date) {
        setState(() {
          _dateController.text = "${date.day}/${date.month}/${date.year}";
        });
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  /// Ouvre le Time Picker
  void _selectTime(BuildContext context) {
    BottomPicker.time(
      pickerTitle: Text(
        'Sélectionner une heure',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
      initialTime: Time(hours: DateTime.now().hour, minutes: DateTime.now().minute),

      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onSubmit: (time) {
        setState(() {
          _horaireController.text = "${time.hour}:${time.minute}";
        });
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajouter un trajet",
          style: TextStyle(color: Colors.deepPurple),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewTrajetFavorisView(),
                ),
              );
            },
            icon: Icon(Icons.favorite, color: Colors.deepPurple),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ChampFormulaire(
              label: "Lieu de départ",
              texteduchamp: '',
              cacheoupas: false,
              controller: _departController,
            ),
            ChampFormulaire(
              label: "Destination",
              texteduchamp: '',
              cacheoupas: false,
              controller: _destinationController,
            ),

            /// Champ pour la Date avec `onTap`
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: ChampFormulaire(
                  label: "Date de départ",
                  texteduchamp: 'JJ/MM/AAAA',
                  cacheoupas: false,
                  controller: _dateController,
                ),
              ),
            ),

            /// Champ pour l'Heure avec `onTap`
            GestureDetector(
              onTap: () => _selectTime(context),
              child: AbsorbPointer(
                child: ChampFormulaire(
                  label: "Horaire de départ",
                  texteduchamp: 'HH:MM',
                  cacheoupas: false,
                  controller: _horaireController,
                ),
              ),
            ),

            ChampFormulaire(
              label: "Places disponibles",
              texteduchamp: '',
              cacheoupas: false,
              controller: _placesdispoController,
            ),
            ChampFormulaire(
              label: "Lieu de RDV",
              texteduchamp: '',
              cacheoupas: false,
              controller: _lieurdvController,
            ),
            Center(child: PriveouPublic()),
            Center(
              child: CustomButton(
                label: 'Ajouter',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccueilView(),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



 @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF6F2F2),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _openDatePicker(context);
              },
              child: Text('Date Picker'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _openDatePickerWithButtonStyle(context);
              },
              child: Text('Date Picker with button style'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _openMonthYearPicker(context);
              },
              child: Text('Month Year Picker'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _openRangeDatePicker(context);
              },
              child: Text('Range Date Picker'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _openRangeTimePicker(context);
              },
              child: Text('Range Time Picker'),
            ),
          ),
        ]
      )
    );
  }  


  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(1998),
      minDateTime: DateTime(1980),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openMonthYearPicker(BuildContext context) {
    BottomPicker.monthYear(
      pickerTitle: Text(
        'Set your Birth Month',
      ),
      initialDateTime: DateTime(1996, 10, 22),
      onChange: (index) {
        print(index);
      },
    ).show(context);
  }

  void _openDatePickerWithButtonStyle(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        'Set your Birthday',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(1996, 10, 22),
      maxDateTime: DateTime(1998),
      minDateTime: DateTime(1980),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      buttonStyle: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blue[200]!,
        ),
      ),
      buttonWidth: 200,
      buttonContent: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select date',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    ).show(context);
  }

  void _openRangeDatePicker(BuildContext context) {
    BottomPicker.range(
      pickerTitle: Text(
        'Set date range',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      pickerDescription: Text(
        'Please select a first date and an end date',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      dateOrder: DatePickerDateOrder.dmy,
      initialSecondDate: DateTime.now().add(Duration(days: 230)),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onRangeDateSubmitPressed: (firstDate, secondDate) {
        print(firstDate);
        print(secondDate);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  void _openRangeTimePicker(BuildContext context) {
    BottomPicker.rangeTime(
      pickerTitle: Text(
        'Set Time range',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      pickerDescription: Text(
        'Please select a first time and an end time',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      onRangeTimeSubmitPressed: (firstDate, secondDate) {
        print(firstDate);
        print(secondDate);
      },
    ).show(context);
  }