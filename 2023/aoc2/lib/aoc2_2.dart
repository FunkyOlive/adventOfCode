import 'dart:convert';
import 'dart:io';
import 'dart:math';

main() async {
  final file = File('input.txt');

  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    int sum = 0;

    await for (final String line in lines) {
      int maxBlue = -1;
      int maxRed = -1;
      int maxGreen = -1;

      int gameNr;
      print('line is $line');

      //get game Nr
      RegExp gameNrRegExp = RegExp(r'Game (\d+):');
      gameNr = getIntFromRegEx(gameNrRegExp, line)!;
      print('gameNr is $gameNr');

      //get game = line without game Nr
      String game = line.split(':')[1];

      //get max cubes
      for (String turn in game.split(';')) {
        print('turn is $turn');

        RegExp blueRegExp = RegExp(r'(\d+) blue');
        int? blue = getIntFromRegEx(blueRegExp, turn);
        if (blue == null) {
          print('blue is null');
        } else {
          maxBlue = max(maxBlue, blue);
          print('maxBlue is $maxBlue');
        }

        RegExp redRegExp = RegExp(r'(\d+) red');
        int? red = getIntFromRegEx(redRegExp, turn);
        if (red == null) {
          print('red is null');
        } else {
          maxRed = max(maxRed, red);
          print('maxRed is $maxRed');
        }

        RegExp greenRegExp = RegExp(r'(\d+) green');
        int? green = getIntFromRegEx(greenRegExp, turn);
        if (green == null) {
          print('green is null');
        } else {
          maxGreen = max(maxGreen, green);
          print('maxGreen is $maxGreen');
        }
      }
      //add product of max cubes
      sum += (maxGreen * maxRed * maxBlue);
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
