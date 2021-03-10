import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Comment {
  String username;
  String comment;

  Comment(this.username, this.comment);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Comment> _comments;

  @override
  void initState() {
    super.initState();

    setState(() {
      _comments = [];
      _comments.add(Comment("miguel", "holaa"));
      _comments.add(Comment("miguel", "holaa"));
      _comments.add(Comment("miguel", "holaa"));
      _comments.add(Comment("miguel", "holaa"));
      _comments.add(Comment("miguel", "holaa"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram Clone",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      ),
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Column(children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://placeimg.com/40/40/any',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  "Miguel",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Santiago"),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  'https://placeimg.com/640/480/any',
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: Icon(Icons.favorite_outline),
                        padding: EdgeInsets.all(0),
                        onPressed: () => print("like"),
                      )),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        padding: EdgeInsets.all(0),
                        onPressed: () => print("like"),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Miguel",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("This is a caption")
                  ],
                ),
              ),
              // (this._comments.length - 2 <= 0)
              //     ? Container()
              //     : Text("View all ${this._comments.length - 2} comments"),
              // ListView.builder(
              //   itemCount: 2,
              //   itemBuilder: (context, index) {
              //     Comment current = this._comments[index];
              //     return RichText(
              //         text: TextSpan(
              //             text: current.username,
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //             children: [
              //           TextSpan(
              //               text: current.comment,
              //               style: TextStyle(color: Colors.grey))
              //         ]));
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Add a comment',
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        print("Se Envio");
                      },
                      child: Text("Post", style: TextStyle(color: Colors.blue)))
                ],
              ),
            ]));
          },
        ),
      ),
    );
  }
}
