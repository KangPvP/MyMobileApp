import 'package:flutter/material.dart';


class VerifTelPage extends StatefulWidget {
  const VerifTelPage({super.key});

  @override
  State<VerifTelPage> createState() => _VerifTelPageState();
}

class _VerifTelPageState extends State<VerifTelPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Validation numero'),
      ),
    );
  }
}