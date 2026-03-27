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

  static const _accentMap = {
    'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a',
    'æ': 'ae',
    'ç': 'c',
    'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e',
    'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i',
    'ð': 'd',
    'ñ': 'n',
    'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o',
    'œ': 'oe',
    'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u',
    'ý': 'y', 'ÿ': 'y',
    'À': 'a', 'Á': 'a', 'Â': 'a', 'Ã': 'a', 'Ä': 'a', 'Å': 'a',
    'Æ': 'ae',
    'Ç': 'c',
    'È': 'e', 'É': 'e', 'Ê': 'e', 'Ë': 'e',
    'Ì': 'i', 'Í': 'i', 'Î': 'i', 'Ï': 'i',
    'Ð': 'd',
    'Ñ': 'n',
    'Ò': 'o', 'Ó': 'o', 'Ô': 'o', 'Õ': 'o', 'Ö': 'o',
    'Œ': 'oe',
    'Ù': 'u', 'Ú': 'u', 'Û': 'u', 'Ü': 'u',
    'Ý': 'y',
  };

  String toCamelCase() {
    final normalized = splitMapJoin(
      RegExp('.', dotAll: true),
      onMatch: (m) => _accentMap[m.group(0)!] ?? m.group(0)!,
    );

    final words = normalized
        .split(RegExp(r'[\s\-_]+'))
        .where((w) => w.isNotEmpty)
        .toList();

    if (words.isEmpty) return '';

    return words.first.toLowerCase() +
        words.skip(1).map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase()).join();
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
