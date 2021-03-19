import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Username",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://placeimg.com/40/40/any',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    Text("7",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("posts",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Text("7",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("followers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Text("7",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("following",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))
                  ],
                ))
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Bio\n"
                          "Ecuuuuuuuuuuucha\n"
                          "mortal\n"
                          "Humano\n",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 40),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      primary: Colors.lightBlue),
                  onPressed: () {},
                  child: Text('Follow',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )),

            //TODO: Post Grid

            GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("Se Envio");
                  },
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://placeimg.com/500/500/any',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ]
      ),
    );
  }
}
