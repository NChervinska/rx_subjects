abstract class AppConstants {
  static const sonnets = [
    '1. When I have seen by Times fell hand defaced',
    '2. The rich proud cost of outworn buried age;',
    '3. When sometime lofty towers I see down-razed',
    '4. And brass eternal slave to mortal rage;',
    '5. When I have seen the hungry ocean gain',
    '6. Advantage on the kingdom of the shore,',
    '7. And the firm soil win of the watery main,',
    '8. Increasing store with loss, and loss with store;',
    '9. When I have seen such interchange of state,',
    '10. Or state itself confounded to decay;',
    '11. Ruin hath taught me thus to ruminate',
    '12. That Time will come and take my love away.',
    '13. This thought is as a death which cannot choose',
    '14. But weep to have that which it fears to lose.',
  ];
  static const start = 'Start';
  static const stream = 'Stream';
  static const publish = 'Publish';
  static const behavior = 'Behavior';
  static const replay = 'Replay';
  static const standardDart = 'Standard Dart stream controller';
  static const publishSubject =
      'Exactly like a normal broadcast StreamController with one exception: this class is both a Stream and Sink.';
  static const behaviorSubject =
      'A special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.';
  static const replaySubject =
      'A special StreamController that captures all of the items that have been added to the controller, and emits those as the first items to any new listener.';
}
