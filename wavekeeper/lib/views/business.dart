import 'package:flutter/material.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Business Works"),
      ),
    );
  }
}