import 'package:flutter/material.dart';

class View4 extends StatefulWidget {
  const View4({Key? key}) : super(key: key);

  @override
  State<View4> createState() => _View4State();
}

class _View4State extends State<View4> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: const [
          Center(child: Text('View4')),
        ],
      ),
    );
  }
}
