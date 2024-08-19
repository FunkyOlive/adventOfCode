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
            int first = int.parse(line[line.lastIndexOf(RegExp(r'\d'))]);
            int second = 10 * int.parse(line[line.indexOf(RegExp(r'\d'))]);
            sum += first + second;
            print('$first + $second -> $sum');
        }
        print('Sum is $sum. File is now closed.');
    } catch (e) {
        print('Error: $e');
    }
}

int calculate() {
  return 6 * 7;
}
