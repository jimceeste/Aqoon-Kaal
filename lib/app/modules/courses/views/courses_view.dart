import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoursesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CoursesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
