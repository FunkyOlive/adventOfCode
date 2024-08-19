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
    int limitRed = 12;
    int limitGreen = 13;
    int limitBlue = 14;

    await for (final String line in lines) {
      bool validLine = true;
      int gameNr;
      print('line is $line');

      //get game Nr
      RegExp gameNrRegExp = RegExp(r'Game (\d+):');
      gameNr = getIntFromRegEx(gameNrRegExp, line)!;
      print('gameNr is $gameNr');

      //get turns = line without game Nr
      String turns = line.split(':')[1];

      //check each turn for validity against limitInts
      for (String turn in turns.split(';')) {
        RegExp blueRegExp = RegExp(r'(\d+) blue');
        int blue = getIntFromRegEx(blueRegExp, turn) ?? 0;
        print('blue is $blue');

        RegExp redRegExp = RegExp(r'(\d+) red');
        int red = getIntFromRegEx(redRegExp, turn) ?? 0;
        print('red is $red');

        RegExp greenRegExp = RegExp(r'(\d+) green');
        int green = getIntFromRegEx(greenRegExp, turn) ?? 0;
        print('green is $green');

        if (blue > limitBlue || red > limitRed || green > limitGreen) {
          validLine = false;
        }
      }
      if (validLine) {
        sum += gameNr;
      }
    }
    print('Sum is $sum. File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
}

/// Takes input String and Regex with one capture group,
/// gives parsed int from that group.
int? getIntFromRegEx(RegExp expr, String input) {
  RegExpMatch? match = expr.firstMatch(input);
  int? target;
  if (match == null) {
    print('no match for ${expr.toString()}');
  } else {
    target = int.parse(match.group(1)!);
  }
  return target;
}

int calculate() {
  return 6 * 7;
}
