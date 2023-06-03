import 'package:flutter/material.dart';

class SampleMain extends StatefulWidget {
  const SampleMain({super.key, required this.token});
  final String token;

  @override
  State<SampleMain> createState() => _SampleMainState();
}

class _SampleMainState extends State<SampleMain> {
  String? token;

  @override
  void initState() {
    super.initState();
    token = widget.token;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(token!),
    );
  }
}