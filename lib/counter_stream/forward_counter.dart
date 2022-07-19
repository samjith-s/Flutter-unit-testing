import 'package:unit_test_demo/counter_stream/counter_stream.dart';

class ForwardCount extends CountStream{
  @override
  Stream<int> countStream(int bound)async* {
    for(int i=0;i<=bound;i++){
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}