import 'dart:async';
import 'dart:math';

List<String> generateStringList(int quantity) =>
    List<String>.generate(quantity, (i) => "Item $i");

int randomNumber(int max, {int min = 0}) =>
    min + Random().nextInt((max + 1) - min);

List<int> randomListNumber(int max) =>
    List<int>.generate(max, (int index) => (index + 1))..shuffle();

List<int> listNumber(int max) =>
    List<int>.generate(max, (int index) => (index + 1));

int _start = 10;

void countdown(int seconds, Function() callback) {
  var oneSec = Duration(seconds: seconds);
  Timer.periodic(
    oneSec,
    (Timer timer) {
      if (_start == 0) {
        timer.cancel();
        callback();
      } else {
        _start--;
      }
    },
  );
}

void _main() {
  var _randomSeed = Random();
  var _min = 110;
  var _max = 112;
  var _numberList =
      List<int>.generate(10, (int index) => _randomSeed.nextInt(100));
  print(_numberList);
  var _numberLisr = List<int>.generate(
      10, (int index) => _min + _randomSeed.nextInt(_max - _min));
  print(_numberLisr);
}
