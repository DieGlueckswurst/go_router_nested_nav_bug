import 'package:flutter/material.dart';

class View2 extends StatefulWidget {
  const View2({Key? key}) : super(key: key);

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: const [
          Center(child: Text('View2')),
        ],
      ),
    );
  }
}
