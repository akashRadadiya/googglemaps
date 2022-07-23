
import 'package:flutter/material.dart';

class SharchPlascesScreen extends StatefulWidget {
  const SharchPlascesScreen({Key? key}) : super(key: key);

  @override
  State<SharchPlascesScreen> createState() => _SharchPlascesScreenState();
}

class _SharchPlascesScreenState extends State<SharchPlascesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Sharch Please"),
      ),
    );
  }
}
