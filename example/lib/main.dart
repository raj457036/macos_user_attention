import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macos_user_attention/macos_user_attention.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? lastRequestId;
  final _macosUserAttentionPlugin = MacosUserAttention();

  @override
  void initState() {
    super.initState();
    requestCriticalAttention();
  }

  Future<void> requestCriticalAttention() async {
    // delaying because requesting attention in foreground doesn't make any
    // sense.
    await Future.delayed(const Duration(seconds: 3));
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      lastRequestId = await _macosUserAttentionPlugin.requestUserAttention(
        RequestUserAttentionType.critical,
      );
    } on PlatformException {
      log("Something went wrong");
    }
  }

  Future<void> requestInformationalAttention() async {
    // delaying because requesting attention in foreground doesn't make any
    // sense.
    await Future.delayed(const Duration(seconds: 3));
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      lastRequestId = await _macosUserAttentionPlugin.requestUserAttention(
        RequestUserAttentionType.informational,
      );
    } on PlatformException {
      log("Something went wrong");
    }
  }

  Future<void> cancelLastRequest() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    if (lastRequestId == null) {
      log("No request to cancel");
      return;
    }
    try {
      await _macosUserAttentionPlugin.cancelAttentionRequest(lastRequestId!);
    } on PlatformException {
      log("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: requestCriticalAttention,
                child: const Text("Request critical attention"),
              ),
              ElevatedButton(
                onPressed: requestInformationalAttention,
                child: const Text("Request informational attention"),
              ),
            ],
          )),
    );
  }
}
