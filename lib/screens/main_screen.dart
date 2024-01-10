import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/game_screen.dart';
import 'package:rock_paper_scissors/utils/game.dart';
import 'package:rock_paper_scissors/widgets/game_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;

    return Scaffold(
      backgroundColor: Color(0xff060a47),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 34.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SCORE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.score}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                  child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: MediaQuery.of(context).size.width / 2 -
                        btnWidth / 2 -
                        20,
                    child: Hero(
                      tag: "Rock",
                      child: gameButton(() {
                        print("Tou choose rock!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              choice("Rock"),
                            ),
                          ),
                        );
                      }, "assets/rock_btn.png", btnWidth),
                    ),
                  ),
                  Positioned(
                    top: btnWidth,
                    left: MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                    child: Hero(
                      tag: "Paper",
                      child: gameButton(() {
                        print("Tou choose paper!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              choice("Paper"),
                            ),
                          ),
                        );
                      }, "assets/paper_btn.png", btnWidth),
                    ),
                  ),
                  Positioned(
                    top: btnWidth,
                    right:
                        MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                    child: Hero(
                      tag: "Scisor",
                      child: gameButton(() {
                        print("Tou choose scisor!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              choice("Scisor"),
                            ),
                          ),
                        );
                      }, "assets/scisor_btn.png", btnWidth),
                    ),
                  )
                ],
              )),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {},
                padding: EdgeInsets.all(16.0),
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 5.0),
                ),
                child: Text(
                  "RULES",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
            Text(
              "⚡Mohd Sayeed S Mulla⚡",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
