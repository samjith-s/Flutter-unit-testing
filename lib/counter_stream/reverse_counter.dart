import 'package:unit_test_demo/counter_stream/counter_stream.dart';

class ReverseCount extends CountStream{
  @override
  Stream<int> countStream(int bound)async* {
    for(int i=bound;i>=0;i--){
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

}