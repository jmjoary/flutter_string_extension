import 'package:validators/validators.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String upperFirstLetter() =>
      isNotEmpty ? "${this[0].toUpperCase()}${substring(1)}" : "";

  String toTitleCase() {
    String temp = toLowerCase().replaceAll(RegExp(' +'), ' ');
    Iterable<String> list = temp.split(' ');
    list = list.map((str) => str.upperFirstLetter());
    temp = list.join(' ');
    list = temp.split("-");
    list = list.map((str) => str.upperFirstLetter());
    temp = list.join("-");

    return temp;
  }

  String removeWWW() => replaceFirst(RegExp(r'^www\.'), "");

  String? hostDomain() {
    String url = this;
    if (!url.startsWith("https://") && !url.startsWith("http://")) {
      url = "https://$this";
    }

    if (isURL(url)) {
      final Uri uri = Uri.parse(url);
      return uri.host.removeWWW();
    }

    return null;
  }
}
