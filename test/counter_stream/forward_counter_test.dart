import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/counter_stream/counter_stream.dart';
import 'package:unit_test_demo/counter_stream/forward_counter.dart';
import 'package:unit_test_demo/counter_stream/reverse_counter.dart';

void main() {
  group('forward_count', () {
    late CountStream forwardCount;

    setUp(() => forwardCount = ForwardCount());
    test('should emit number in ascending order', () {
      expect(forwardCount.countStream(2), emitsInOrder([0, 1, 2]));
    });

    test('should always emit bound at the end', () {
      int bound = 3;
      expect(
        forwardCount.countStream(bound),
        emitsInOrder([emitsThrough(bound), emitsDone]),
      );
    });

    test('should always emit number within the range(bound,0) inclusively', () {
      int bound = 3;
      forwardCount.countStream(bound).listen(expectAsync1(
            (value) => expect(value, inInclusiveRange(0, bound)),
            count: bound + 1,
          ));
    });
  });
}
