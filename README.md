# flutter_string_extension

Extensions sur le type `String` pour Flutter, regroupant des utilitaires de mise en forme et de manipulation d'URL.

## Installation

```yaml
dependencies:
  flutter_string_extension:
    path: ./
```

## Extensions disponibles

### `toCapitalized()`

Met la première lettre en majuscule et le reste en minuscules.

```dart
'hello world'.toCapitalized() // 'Hello world'
'HELLO'.toCapitalized()       // 'Hello'
```

---

### `upperFirstLetter()`

Met uniquement la première lettre en majuscule, sans toucher au reste de la chaîne.

```dart
'hello world'.upperFirstLetter() // 'Hello world'
'hELLO'.upperFirstLetter()       // 'HELLO'
```

> Différence avec `toCapitalized()` : le reste de la chaîne n'est pas mis en minuscules.

---

### `toTitleCase()`

Met en title case chaque mot, séparé par des espaces ou des tirets. Les espaces multiples sont normalisés.

```dart
'hello world'.toTitleCase()   // 'Hello World'
'hello  world'.toTitleCase()  // 'Hello World'
'saint-étienne'.toTitleCase() // 'Saint-Étienne'
'HELLO WORLD'.toTitleCase()   // 'Hello World'
```

---

### `removeWWW()`

Supprime le préfixe `www.` en début de chaîne. N'a aucun effet si `www.` n'est pas en début de chaîne.

```dart
'www.example.com'.removeWWW()    // 'example.com'
'example.com'.removeWWW()        // 'example.com'
'my-www.example.com'.removeWWW() // 'my-www.example.com'
```

---

### `hostDomain()`

Extrait le nom de domaine depuis une URL (sans `www.`). Ajoute automatiquement `https://` si le schéma est absent. Retourne `null` si la chaîne n'est pas une URL valide.

```dart
'https://www.example.com/path'.hostDomain() // 'example.com'
'http://www.example.com'.hostDomain()        // 'example.com'
'www.example.com'.hostDomain()               // 'example.com'
'https://example.com'.hostDomain()           // 'example.com'
'not a url'.hostDomain()                     // null
```

## Dépendances

- [`validators`](https://pub.dev/packages/validators) — utilisé pour la validation d'URL dans `hostDomain()`.
