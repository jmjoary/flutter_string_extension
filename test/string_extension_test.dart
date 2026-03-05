import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_string_extension/string_extension.dart';

void main() {
  group('toCapitalized', () {
    test('capitalise la première lettre et met le reste en minuscules', () {
      expect('hello world'.toCapitalized(), 'Hello world');
    });

    test('fonctionne avec une chaîne déjà capitalisée', () {
      expect('HELLO'.toCapitalized(), 'Hello');
    });

    test('fonctionne avec des -', () {
      expect('HELLO-WORLD'.toCapitalized(), 'Hello-world');
    });

    test('retourne une chaîne vide pour une chaîne vide', () {
      expect(''.toCapitalized(), '');
    });

    test('fonctionne avec un seul caractère', () {
      expect('a'.toCapitalized(), 'A');
    });
  });

  group('upperFirstLetter', () {
    test('met en majuscule uniquement la première lettre', () {
      expect('hello world'.upperFirstLetter(), 'Hello world');
    });

    test('ne modifie pas le reste de la chaîne', () {
      expect('hELLO'.upperFirstLetter(), 'HELLO');
    });

    test('retourne une chaîne vide pour une chaîne vide', () {
      expect(''.upperFirstLetter(), '');
    });

    test('fonctionne avec un seul caractère', () {
      expect('a'.upperFirstLetter(), 'A');
    });
  });

  group('toTitleCase', () {
    test('met en title case une phrase simple', () {
      expect('hello world'.toTitleCase(), 'Hello World');
    });

    test('gère les espaces multiples', () {
      expect('hello  world'.toTitleCase(), 'Hello World');
    });

    test('met en majuscule après un tiret', () {
      expect('saint-étienne'.toTitleCase(), 'Saint-Étienne');
    });

    test('fonctionne avec une chaîne déjà en majuscules', () {
      expect('HELLO WORLD'.toTitleCase(), 'Hello World');
    });

    test('fonctionne avec une chaîne vide', () {
      expect(''.toTitleCase(), '');
    });
  });

  group('removeWWW', () {
    test('supprime le préfixe www.', () {
      expect('www.example.com'.removeWWW(), 'example.com');
    });

    test('ne modifie pas une URL sans www', () {
      expect('example.com'.removeWWW(), 'example.com');
    });

    test('ne supprime pas www en milieu de chaîne', () {
      expect('my-www.example.com'.removeWWW(), 'my-www.example.com');
    });
  });

  group('hostDomain', () {
    test('extrait le domaine depuis une URL https', () {
      expect('https://www.example.com/path'.hostDomain(), 'example.com');
    });

    test('extrait le domaine depuis une URL http', () {
      expect('http://www.example.com'.hostDomain(), 'example.com');
    });

    test('ajoute https si le schéma est manquant', () {
      expect('www.example.com'.hostDomain(), 'example.com');
    });

    test('retourne null pour une chaîne invalide', () {
      expect('not a url'.hostDomain(), null);
    });

    test('extrait le domaine sans www', () {
      expect('https://example.com'.hostDomain(), 'example.com');
    });
  });
}
