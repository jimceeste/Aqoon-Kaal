import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanguageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LanguageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
