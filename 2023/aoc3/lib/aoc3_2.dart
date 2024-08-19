import 'dart:convert';
import 'dart:io';

main() async {
  final file = File('input.txt');

  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.

  int sum = 0;
  String? lastLine;
  String? secLastLine;
  Iterable<Match>? lastNumberMatches;
  Iterable<Match>? secLastNumberMatches;
  try {
    await for (final String currentLine in lines) {
      // print('lLLine is $secLastLine');
      // print(' lLine is $lastLine');
      // print('  line is $line');
      Iterable<Match> numberMatches = RegExp(r'\d+').allMatches(currentLine);

      //for (var gear in gears) {
      //  print('gears: ${gear[0]} at index ${gear.start}');
      //}

      if (lastLine == null) {
        //case line 0: test current line only
        Iterable<Match> gearMatches = RegExp(r'\*').allMatches(currentLine);

        for (Match gearMatch in gearMatches) {
          List<int> adjacentNumbers = [];

          final Set<int> sameLineAdjIndxs = {gearMatch.start - 1, gearMatch.end};

          //test current line (with current numbers)
          adjacentNumbers.addAll(getAdjacentNumberPair(numberMatches, sameLineAdjIndxs));

          //add valid gear ratios to sum
          if (adjacentNumbers.length == 2) {
            sum += adjacentNumbers[0] * adjacentNumbers[1];
          }
        }
      } else {
        //test last line and its 2 adjacents (seclast and current) (with last numbers)
        Iterable<Match> lastGearMatches = RegExp(r'\*').allMatches(lastLine);

        for (Match gearMatch in lastGearMatches) {
          List<int> adjacentNumbers = [];

          final Set<int> adjLineAdjIndxs = {gearMatch.start - 1, gearMatch.start, gearMatch.end};
          final Set<int> sameLineAdjIndxs = {gearMatch.start - 1, gearMatch.end};

          //test current line
          adjacentNumbers.addAll(getAdjacentNumberPair(numberMatches, adjLineAdjIndxs));
          
          //test last line
          adjacentNumbers.addAll(getAdjacentNumberPair(lastNumberMatches!, sameLineAdjIndxs));
          
          if (secLastNumberMatches != null) {
            //test second last line
            adjacentNumbers.addAll(getAdjacentNumberPair(secLastNumberMatches, adjLineAdjIndxs));
          } //else case line 1: no 2nd last line

          //add valid gear ratios to sum
          if (adjacentNumbers.length == 2) {
            sum += adjacentNumbers[0] * adjacentNumbers[1];
          }
        }

      }

      secLastLine = lastLine;
      lastLine = currentLine;
      secLastNumberMatches = lastNumberMatches;
      lastNumberMatches = numberMatches;
    }

    //case line 2ndlast: no currentLine
      Iterable<Match> lastGearMatches = RegExp(r'\*').allMatches(lastLine!);

      for (Match gearMatch in lastGearMatches) {
        List<int> adjacentNumbers = [];

        final Set<int> adjLineAdjIndxs = {gearMatch.start - 1, gearMatch.start, gearMatch.end};
        final Set<int> sameLineAdjIndxs = {gearMatch.start - 1, gearMatch.end};
        
        //test last line
        adjacentNumbers.addAll(getAdjacentNumberPair(lastNumberMatches!, sameLineAdjIndxs));
        
        //test second last line
        adjacentNumbers.addAll(getAdjacentNumberPair(secLastNumberMatches!, adjLineAdjIndxs));

        //add valid gear ratios to sum
        if (adjacentNumbers.length == 2) {
          sum += adjacentNumbers[0] * adjacentNumbers[1];
        }
      }


      secLastLine = lastLine;
      secLastNumberMatches = lastNumberMatches;

      //case line last: only secLastLine
      Iterable<Match> secLastGearMatches = RegExp(r'\*').allMatches(secLastLine);

      for (Match gearMatch in secLastGearMatches) {
        List<int> adjacentNumbers = [];

        final Set<int> sameLineAdjIndxs = {gearMatch.start - 1, gearMatch.end};

        //test second last line (only)
        adjacentNumbers.addAll(getAdjacentNumberPair(secLastNumberMatches!, sameLineAdjIndxs));

        //add valid gear ratios to sum
        if (adjacentNumbers.length == 2) {
          sum += adjacentNumbers[0] * adjacentNumbers[1];
        }
      }

    print('Sum is $sum. File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
}

/// returns the list of [adjacentNumbers] out of [numberMatches] for which any of [adjIndxs] are within the length of a [numberMatch].
List<int> getAdjacentNumberPair(Iterable<Match> numberMatches, Set<int> adjIndxs) {
  List<int> adjacentNumbers = [];
  for (Match numberMatch in numberMatches) {
    if (adjIndxs.any((i) => (numberMatch.start < i && i < numberMatch.end))) {
      adjacentNumbers.add(int.parse(numberMatch[0]!));
    }
  }
  return adjacentNumbers;
}
