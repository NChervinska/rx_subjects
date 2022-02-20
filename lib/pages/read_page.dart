import 'package:flutter/material.dart';
import 'package:rx_subjects/blocs/reader_bloc.dart';
import 'package:rx_subjects/resource/app_constants.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late final ReaderBloc _readerBloc;

  @override
  void initState() {
    _readerBloc = ReaderBloc();
    _readerBloc.startReading();
    super.initState();
  }

  @override
  void dispose() {
    _readerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: AppConstants.publish),
              Tab(text: AppConstants.behavior),
              Tab(text: AppConstants.replay),
            ],
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        Scaffold(
          body: _tabBody(
            _readerBloc.publishStream,
            AppConstants.publishSubject,
          ),
        ),
        Scaffold(
          body: _tabBody(
            _readerBloc.behaviorStream,
            AppConstants.behaviorSubject,
          ),
        ),
        Scaffold(
          body: _tabBody(
            _readerBloc.replayStream,
            AppConstants.replaySubject,
          ),
        ),
      ],
    );
  }

  Widget _tabBody(Stream<String> stream, String title) {
    return ListView(
      children: [
        Text(title),
        const SizedBox(height: 20.0),
        const Divider(),
        StreamBuilder<String>(
          stream: stream,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData && data != null) {
              return Text(
                data,
                style: const TextStyle(fontSize: 22.0),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
