import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_subjects/blocs/reader_bloc.dart';
import 'package:rx_subjects/pages/read_page.dart';

class SubjectApp extends StatelessWidget {
  const SubjectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ReaderBloc(),
      child: const MaterialApp(
        home: ReadPage(),
      ),
    );
  }
}
