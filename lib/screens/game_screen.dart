import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/main_screen.dart';

import '../utils/game.dart';
import '../widgets/game_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gamechoice, {Key? key}) : super(key: key);
  final choice gamechoice;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    String? robotChoice = Game.randomChoice();
    String robotChoicePath = "";
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "assets/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "assets/paper_btn.png";
        break;
      case "Scisor":
        robotChoicePath = "assets/scisor_btn.png";
        break;
      default:
    }

    String? player_choice;
    switch (widget.gamechoice.type) {
      case "Rock":
        player_choice = "assets/rock_btn.png";
        break;
      case "Paper":
        player_choice = "assets/paper_btn.png";
        break;
      case "Scisor":
        player_choice = "assets/scisor_btn.png";
        break;
      default:
    }
    if (choice.gameRule[widget.gamechoice.type]![robotChoice] ==
        "You Win😍🥳") {
      setState(() {
        Game.score++;
      });
    }

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gamechoice.type}",
                      child: gameButton(null, player_choice!, btnWidth),
                    ),
                    Text(
                      "VS",
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                    gameButton(null, robotChoicePath, btnWidth),
                  ],
                ),
              ),
            ),
            Text(
              "${choice.gameRule[widget.gamechoice.type]![robotChoice]}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                },
                padding: EdgeInsets.all(16.0),
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 5.0),
                ),
                child: Text(
                  "Play again",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
