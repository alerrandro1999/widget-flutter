import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

abstract class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State <MyWidget> {
   Offset _offset = const Offset(200, 250);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                left: _offset.dx,
                top: _offset.dy,
                child: LongPressDraggable(
                  feedback: Image.network(
                    "http://tinyurl.com/95ncjeuu",
                    height: 200,
                    color: Colors.orangeAccent,
                    colorBlendMode: BlendMode.colorBurn,
                    ),
                      onDragEnd: ((details) {
                        setState(() {
                          double adjustment = MediaQuery.of(context).size.height - constraints.maxHeight;
                          _offset = Offset(
                            details.offset.dx, details.offset.dy - adjustment);
                        });
                      }),
                    child: Image.network(
                      "http://tinyurl.com/95ncjeuu",
                      height: 200,
                      ), 
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
