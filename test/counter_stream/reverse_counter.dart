import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/counter_stream/counter_stream.dart';
import 'package:unit_test_demo/counter_stream/reverse_counter.dart';

void main() {
  group('reverse_counter', () {
    late CountStream reverseCount;

    setUp(() => reverseCount = ReverseCount());

    test('should emit numbers in descending order', () {
      expect(reverseCount.countStream(2), emitsInOrder([2, 1, 0]));
    });

    test('should emit 0 at the end', () {
      expect(
        reverseCount.countStream(3),
        emitsInOrder([
          emitsThrough(0),
          emitsDone,
        ]),
      );
    });

    test('should emit numbers within the range(upperbound,0) inclusively', () {
      int bound = 3;
      reverseCount.countStream(bound).listen(
            expectAsync1(
              (value) => expect(value, inInclusiveRange(0, bound)),
              count: bound + 1,
            ),
          );
    });

    test('should not emit negative numbers', (){
      expect(reverseCount.countStream(2), neverEmits(isNegative));
    });
  });
}
