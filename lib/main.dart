import 'package:chewie/chewie.dart';
import 'package:fdvideo/VideoService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<VideoService>(
            create: (_) => VideoService(),
          ),
        ],
        child: MaterialApp(
          title: 'Video Player',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Video Player'),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final videoService =
        Provider.of<VideoService>(context).intializeController();
  }

  @override
  void dispose() {
    Provider.of<VideoService>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final video = Provider.of<VideoService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Chewie(
                controller: video.chewieController,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              video.chewieController.enterFullScreen();
            },
            child: Text('Fullscreen'),
          ),
        ],
      ),
    );
  }
}
