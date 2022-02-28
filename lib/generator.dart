import 'dart:math';

final Random random = Random();
final List<String> lowerAlphabets = arrayFromRange(97, 122);
final List<String> upperAlphabets = arrayFromRange(65, 90);
final List<String> digits = arrayFromRange(48, 57);
final List<String> symbols = arrayFromRange(33, 47) +
    arrayFromRange(58, 64) +
    arrayFromRange(91, 96) +
    arrayFromRange(123, 126);

String generatePassword(int length, Map<String, bool> includes) {
  final List<String> characterSet = [];
  final List<String> passwordList = [];

  if (includes['lower']!) {
    characterSet.addAll(lowerAlphabets);
    length--;
    int randInt = random.nextInt(lowerAlphabets.length);
    passwordList.add(lowerAlphabets[randInt]);
  }
  if (includes['upper']!) {
    characterSet.addAll(upperAlphabets);
    length--;
    int randInt = random.nextInt(upperAlphabets.length);
    passwordList.add(upperAlphabets[randInt]);
  }
  if (includes['numbers']!) {
    characterSet.addAll(digits);
    length--;
    int randInt = random.nextInt(digits.length);
    passwordList.add(digits[randInt]);
  }
  if (includes['symbols']!) {
    characterSet.addAll(symbols);
    length--;
    int randInt = random.nextInt(symbols.length);
    passwordList.add(symbols[randInt]);
  }

  for (int i = 0; i < length; i++) {
    int randInt = random.nextInt(characterSet.length);
    passwordList.add(characterSet[randInt]);
  }

  return shuffle(passwordList).join();
}

List<String> arrayFromRange(int start, int end) {
  final List<String> characters = [];
  for (int i = start; i <= end; i++) {
    characters.add(String.fromCharCode(i));
  }
  return characters;
}

List<String> shuffle(List<String> characterSet) {
  final List<String> characters = [];
  int length = characterSet.length;
  while (length > 0) {
    int randInt = random.nextInt(length);
    characters.add(characterSet[randInt]);
    characterSet.removeAt(randInt);
    length--;
  }
  return characters;
}
