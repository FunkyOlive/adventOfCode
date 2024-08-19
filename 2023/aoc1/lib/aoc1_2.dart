import 'dart:convert';
import 'dart:io';

main() async {
  final file = File('input.txt');

  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {    
    int sum = 0;
    await for (final String line in lines) {
      print('line is $line');
      RegExp digitOrDigitStringExp =
          RegExp(r'\d|one|two|three|four|five|six|seven|eight|nine');

      Iterable<RegExpMatch> matches = digitOrDigitStringExp.allMatches(line);

      int firstDecimal = getNumFromMatch(matches, true);

      int secondDecimal = getNumFromMatch(matches, false);

      sum += firstDecimal + (10*secondDecimal);
      print('$firstDecimal + ${10*secondDecimal} -> $sum');
    }
    print('Sum is $sum. File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
}

int getNumFromMatch(Iterable<RegExpMatch> matches, bool lastNotFirst) {
  String match;
  if (lastNotFirst) {
    match = matches.elementAt(matches.length -  1)[0]!;
    print('lastNumber: $match');
  } else {
    match = matches.elementAt(0)[0]!;
    print('firstNumber: $match');
  }
  int num = int.tryParse(match) ?? convertIntWordToInt(match)!;
  return num;
}

int? convertIntWordToInt(String str) {
  var integer = <String, int>{
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9
  };
  return integer[str];
}

int calculate() {
  return 6 * 7;
}
