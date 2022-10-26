import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extended Image Crop Callback Spike',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Extended Image Crop Callback Spike'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Rect? rect;

  final GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text(
            'Rect: $rect',
            style: const TextStyle(fontSize: 24.0),
          ),
          Expanded(
            child: ExtendedImage(
              image: ExtendedNetworkImageProvider(
                'https://media.istockphoto.com/photos/interference-static-distorted-test-card-or-test-pattern-with-colour-picture-id1169082305?b=1&k=20&m=1169082305&s=170667a&w=0&h=wT8uiyiSiF4Fi9objW_78rUwq8dJyapl1KPBTbUkmRs=',
              ),
              extendedImageEditorKey: editorKey,
              fit: BoxFit.contain,
              mode: ExtendedImageMode.editor,
              rectCallback: (rect) {
                setState(
                  () {
                    this.rect = rect;
                  },
                );
              },
              initEditorConfigHandler: (state) {
                return EditorConfig(
                  cornerColor: Colors.pink,
                  maxScale: 8.0,
                  cropRectPadding: const EdgeInsets.all(20.0),
                  hitTestSize: 20.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
