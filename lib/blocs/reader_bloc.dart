import 'dart:async';

import 'package:rx_subjects/resource/app_constants.dart';
import 'package:rxdart/subjects.dart';

class ReaderBloc {
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviorStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>(maxSize: 6);

  Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
  Stream<String> get publishStream => _publishStream.stream;
  Stream<String> get behaviorStream => _behaviorStream.stream;
  Stream<String> get replayStream =>
      _replayStream.stream.map((l) => _replayStream.values.join("\n"));

  startReading() async {
    for (final element in AppConstants.sonnets) {
      _dartStream.sink.add(element);
      _publishStream.add(element);
      _behaviorStream.add(element);
      _replayStream.add(element);

      await Future.delayed(const Duration(milliseconds: 4500));
    }
  }

  dispose() {
    _dartStream.close();
    _publishStream.close();
    _behaviorStream.close();
    _replayStream.close();
  }
}
