import 'package:flutter/material.dart';

class View3 extends StatefulWidget {
  const View3({Key? key}) : super(key: key);

  @override
  State<View3> createState() => _View3State();
}

class _View3State extends State<View3> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: const [
          Center(child: Text('View3')),
        ],
      ),
    );
  }
}
