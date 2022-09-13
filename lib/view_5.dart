import 'package:flutter/material.dart';

class View5 extends StatefulWidget {
  const View5({Key? key}) : super(key: key);

  @override
  State<View5> createState() => _View5State();
}

class _View5State extends State<View5> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: const [
          Center(child: Text('View5')),
        ],
      ),
    );
  }
}
