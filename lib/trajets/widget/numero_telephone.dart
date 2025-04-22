import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Supprime tous les espaces
    String digitsOnly = newValue.text.replaceAll(' ', '');

    // Ajoute un espace tous les deux chiffres
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 2 == 0) {
        formatted += ' ';
      }
      formatted += digitsOnly[i];
    }

    // Retourne le texte formaté
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}