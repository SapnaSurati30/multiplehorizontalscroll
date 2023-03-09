import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Horizontal list'),
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

//your list
  List<String> list = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
  ];

//empty chunks list
  List<List<String>> chunksList = [];

  @override
  void initState() {
    //split list into chunks of list
    splitInChunks();
    super.initState();
  }

  splitInChunks() {
    // you can increase decrease 'chunkSize' as your requirement in horizontal list
    int chunkSize = 4;

    for (var i = 0; i < list.length; i += chunkSize) {
      chunksList.add(list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunksList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chunksList.map((e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < e.length; i++)
                        GestureDetector(
                          onTap: () {
//
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(right: 16, bottom: 16),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 1)]),
                            child: Column(
                              children: [
                                FlutterLogo(size: 80),
                                SizedBox(height: 16),
                                Text(e[i], textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
