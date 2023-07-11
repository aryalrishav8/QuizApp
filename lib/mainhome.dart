import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatefulWidget {
  final String? name;
  const MyHome({super.key, @required this.name});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 231, 219, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quiz",
                          style: TextStyle(
                            fontSize: 65,
                            fontFamily: GoogleFonts.oswald().fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5),
                        FaIcon(
                          FontAwesomeIcons.trophy,
                          color: Color.fromARGB(255, 221, 205, 56),
                          size: 60,
                        ),
                      ],
                    ),
                    //SizedBox(width: 90),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.amber),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.diamond),
                            SizedBox(width: 6),
                            Text("20"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  // "Challenge your friends and family with our Quiz app, lets see who comes out on top as the ultimate quiz champion,",
                  'Welcome ${widget.name}',
                  style: TextStyle(
                      fontSize: 21,
                      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.crown,
                          color: Color.fromARGB(255, 177, 164, 48),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Upgrade pro",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.robotoCondensed()
                                        .fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "Upgrade to remove ads",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.robotoCondensed()
                                        .fontFamily,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 142, 142, 140)),
                              ),
                            ]),
                      ],
                    )),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Text("Upgrade",
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.robotoCondensed().fontFamily)),
                    )
                  ],
                ),
                Row(children: [
                  Text(
                    'Popular Games',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 4),
                  FaIcon(
                    FontAwesomeIcons.fire,
                    color: Color.fromARGB(255, 229, 211, 54),
                  )
                ]),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    height: 290,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 250, 59, 45)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 25,
                                width: 55,
                                child: Center(
                                  child: Text(
                                    "Tech",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.robotoCondensed()
                                          .fontFamily,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black),
                              ),
                              // SizedBox(width: 200),
                              Container(
                                height: 25,
                                width: 40,
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.heartbeat,
                                    color: Colors.red,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Technology",
                            // textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily:
                                  GoogleFonts.robotoCondensed().fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Explore the world of technology with the interesting Technology quiz and see if you can become a tech master!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily:
                                  GoogleFonts.robotoCondensed().fontFamily,
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/techquiz.png',
                              height: 135,
                              width: 250,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Recently played",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: 20,
                    minLeadingWidth: 3,
                    leading: FaIcon(FontAwesomeIcons.brain),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Technology",
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.robotoCondensed().fontFamily,
                              fontSize: 18,
                            ),
                          ),
                          // Text("contemporary issues")
                        ],
                      ),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz');
                      },
                      child: Text(
                        "Play again",
                        style: TextStyle(
                          fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Card(
                  child: ListTile(
                    horizontalTitleGap: 20,
                    minLeadingWidth: 3,
                    leading: FaIcon(FontAwesomeIcons.puzzlePiece),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Social Sciences",
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.robotoCondensed().fontFamily,
                              fontSize: 18,
                            ),
                          ),
                          // Text("contemporary issues")
                        ],
                      ),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz');
                      },
                      child: Text(
                        "Play again",
                        style: TextStyle(
                          fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
