# EmMEUHnez-moi App

Une application Flutter moderne conçue pour être exécutée sur des émulateurs Android et iOS.

## Installation et exécution sur un émulateur

### Prérequis

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installé
- [Android Studio](https://developer.android.com/studio) OU [Xcode](https://developer.apple.com/xcode/) (pour iOS)
- Un émulateur Android ou iOS configuré

### Étapes d'installation

1. **Cloner le dépôt du projet**

```bash
git clone https://github.com/EmMEUHnez-moi/App.git
cd ton-projet
```

2. **Installer les dépendances Flutter**

```bash
flutter pub get
```

3. **Démarrer un émulateur Android ou iOS**

- **Android :** via Android Studio → Device Manager → Lancer un AVD
- **iOS :** via Xcode → Window → Devices and Simulators → Lancer un simulateur

4. **Lancer l'application sur l'émulateur**

```bash
flutter run
```

> Astuce : Utilisez `flutter devices` pour voir les émulateurs disponibles.


## Dépannage

- Assurez-vous que l’émulateur est lancé **avant** d’exécuter `flutter run`
- Vérifiez que le device est bien détecté avec `flutter devices`
- Pour iOS : assurez-vous d’avoir accepté les licences et que le projet est ouvert avec Xcode au moins une fois

## Auteur

- [EmMEUHnez-moi](https://github.com/EmMEUHnez-moi)

## Licence

Distribué sous licence propriétaire. Voir `LICENSE` pour plus d'informations.
