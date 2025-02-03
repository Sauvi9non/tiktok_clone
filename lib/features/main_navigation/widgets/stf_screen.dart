import 'package:flutter/material.dart';

class StatefulNavition extends StatefulWidget {
  const StatefulNavition({super.key});

  @override
  State<StatefulNavition> createState() => _StatefulNavitionState();
}

class _StatefulNavitionState extends State<StatefulNavition> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_clicks.toString()),
          TextButton(
            onPressed: _increase,
            child: Text('+'),
          ),
        ],
      ),
    );
  }
}
