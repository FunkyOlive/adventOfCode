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
  Iterable<Match>? lastSonderzeichen;
  String? secLastLine;
  Iterable<Match>? secLastSonderzeichen;
  try {
    await for (final String line in lines) {
      print('lLLine is $secLastLine');
      print(' lLine is $lastLine');
      print('  line is $line');

      RegExp regExpSonderzeichen = RegExp(r'[^\d\.]');
      Iterable<Match> sonderzeichen = regExpSonderzeichen.allMatches(line);
      for (var el in sonderzeichen) {
        print('sonderzeichen: ${el[0]} at index ${el.start}');
      }

      if (lastLine != null) {
        RegExp regExpNumbers = RegExp(r'\d+');
        Iterable<Match> numbers = regExpNumbers.allMatches(lastLine);

        for (Match number in numbers) {
          print('number is ${number[0]}, at index ${number.start}.');
          bool validNumber = false;

          Set<int> adjLineAdjacentIndicesBuilder = {};
          for (int i = number.start - 1; i <= number.end; i++) {
            adjLineAdjacentIndicesBuilder.add(i);
          }
          final adjLineAdjacentIndices = adjLineAdjacentIndicesBuilder;
          final Set<int> sameLineAdjacentIndices = {
            number.start - 1,
            number.end
          };
          print('adjLineAdjacentIndxs: ${adjLineAdjacentIndices.toString()}');
          print('sameLineAdjacentIndxs: ${sameLineAdjacentIndices.toString()}');

          for (Match sz in sonderzeichen) {
            if (adjLineAdjacentIndices.contains(sz.start) ||
                secLastSonderzeichen != null &&
                    adjLineAdjacentIndices.contains(sz.start)) {
              validNumber = true;
            }
          }
          if (lastSonderzeichen != null) {
            for (Match sz in lastSonderzeichen) {
              if (sameLineAdjacentIndices.contains(sz.start)) {
                validNumber = true;
              }
            }
          }
          if (secLastSonderzeichen != null) {
            for (Match sz in secLastSonderzeichen) {
              if (adjLineAdjacentIndices.contains(sz.start)) {
                validNumber = true;
              }
            }
          }

          if (validNumber) {
            print('adding $number[0]');
            sum += int.parse(number[0]!);
          }
        }
      }

      secLastLine = lastLine;
      secLastSonderzeichen = lastSonderzeichen;
      lastLine = line;
      lastSonderzeichen = sonderzeichen;
    }

    RegExp regExpNumbers = RegExp(r'\d+');
    Iterable<Match> numbers = regExpNumbers.allMatches(lastLine!);

    for (Match number in numbers) {
      print('number is ${number[0]}, at index ${number.start}.');
      bool validNumber = false;

      Set<int> adjLineAdjacentIndicesBuilder = {};
      for (int i = number.start - 1; i <= number.end; i++) {
        adjLineAdjacentIndicesBuilder.add(i);
      }
      final adjLineAdjacentIndices = adjLineAdjacentIndicesBuilder;
      final Set<int> sameLineAdjacentIndices = {number.start - 1, number.end};
      print('adjLineAdjacentIndxs: ${adjLineAdjacentIndices.toString()}');
      print('sameLineAdjacentIndxs: ${sameLineAdjacentIndices.toString()}');

      if (lastSonderzeichen != null) {
        for (Match sz in lastSonderzeichen) {
          if (sameLineAdjacentIndices.contains(sz.start)) {
            validNumber = true;
          }
        }
      }
      if (secLastSonderzeichen != null) {
        for (Match sz in secLastSonderzeichen) {
          if (adjLineAdjacentIndices.contains(sz.start)) {
            validNumber = true;
          }
        }
      }

      if (validNumber) {
        print('adding ${number[0]}');
        sum += int.parse(number[0]!);
      }
    }

    print('Sum is $sum. File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
}

int calculate() {
  return 6 * 7;
}
