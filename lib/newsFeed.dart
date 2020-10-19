import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListItemData {
  String title;
  String organization;
  String description;
  int likes;
  int remainings;
  String imageUrl;
  String logoUrl;

  ListItemData(
      {this.title,
      this.organization,
      this.description,
      this.likes,
      this.remainings,
      this.imageUrl,
      this.logoUrl});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              color: Colors.blue,
              child: SafeArea(
                child: Center(
                  child: Text(
                    "ABDUL MOGEES",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.group_work,
                color: Colors.blue,
              ),
              title: Text("Create Organization"),
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.adjust,
                color: Colors.blue,
              ),
              title: Text("Join Organization"),
              onTap: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.format_shapes,
                color: Colors.blue,
              ),
              title: Text("My Organizations"),
              onTap: () {
                Navigator.pushNamed(context, '/sixth');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.blue,
              ),
              title: Text("Add Complaint"),
              onTap: () {
                Navigator.pushNamed(context, '/fifth');
                ;
              },
            ),
            ListTile(
              leading: Icon(
                Icons.archive,
                color: Colors.blue,
              ),
              title: Text("Archieved Complaints"),
              onTap: () {
                print("Archieved Complaints Pressed");
              },
            ),
            Spacer(),
            Column(
              children: <Widget>[
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.blue,
                      ),
                      Text("  "),
                      InkWell(
                        child: Text("Settings"),
                        onTap: () {
                          print("Settings");
                        },
                        /*splashColor: Colors.blue.withOpacity(0.3),*/
                      ),
                      Text(" | "),
                      GestureDetector(
                        child: Text("Logout"),
                        onTap: () {
                          _auth.signOut();
                          Navigator.pushNamed(context, '/startup');
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/fifth');
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = [
    ListItemData(
      title: "Lack of Hygiene in CAFE",
      organization: "FAST NUCES",
      description:
          "Unfortunately Pakistan's top IT University badly fails to provide quality food to its students. It ...",
      likes: 12,
      remainings: 488,
      imageUrl: "https://khi.nu.edu.pk/assets/images/slider/slider-2.jpeg",
      logoUrl:
          "https://upload.wikimedia.org/wikipedia/en/thumb/e/e4/National_University_of_Computer_and_Emerging_Sciences_logo.png/250px-National_University_of_Computer_and_Emerging_Sciences_logo.png",
    ),
    ListItemData(
      title: "Broken Furniture",
      organization: "FAST NUCES",
      description:
          "Furniture is one of the most important need of the university students. But unfortunately the condition ...",
      likes: 69,
      remainings: 312,
      imageUrl: "https://i.ytimg.com/vi/S6vomz6c_tQ/maxresdefault.jpg",
      logoUrl:
          "https://upload.wikimedia.org/wikipedia/en/thumb/e/e4/National_University_of_Computer_and_Emerging_Sciences_logo.png/250px-National_University_of_Computer_and_Emerging_Sciences_logo.png",
    ),
    ListItemData(
      title: "Cleanliness Issues",
      organization: "NUST, Islamabad",
      description:
          "Unfortunately Pakistan's top IT University badly fails to provide quality food to its students. It ...",
      likes: 314,
      remainings: 20,
      imageUrl: "https://i.ytimg.com/vi/Ivp7PbvOx7c/maxresdefault.jpg",
      logoUrl:
          "https://upload.wikimedia.org/wikipedia/en/thumb/e/e4/National_University_of_Computer_and_Emerging_Sciences_logo.png/250px-National_University_of_Computer_and_Emerging_Sciences_logo.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.dehaze),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                    print("Drawer Button Pressed");
                  },
                  color: Colors.blue,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 8, bottom: 8),
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search"),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return ListItem(
                    logoUrl: data[i].logoUrl,
                    title: data[i].title,
                    organization: data[i].organization,
                    description: data[i].description,
                    imageUrl: data[i].imageUrl,
                    likes: data[i].likes,
                    remainings: data[i].remainings,
                  );
                },
                itemCount: data.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  String logoUrl;
  String title;
  String organization;
  String imageUrl;
  String description;
  int likes;
  int remainings;

  ListItem({
    this.logoUrl,
    this.title,
    this.organization,
    this.imageUrl,
    this.description,
    this.likes,
    this.remainings,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Image(
                    image: NetworkImage(logoUrl),
                  ),
                  width: 35,
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("$organization"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Image(
              image: NetworkImage("$imageUrl"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Text("$description"),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.only(right: 8.0),
                  color: Colors.blue.withOpacity(0.08),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        color: Colors.blue,
                        onPressed: () {
                          print("Like Button Pressed");
                        },
                      ),
                      Text(
                        "$likes",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "$remainings remaining",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
