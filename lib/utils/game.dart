import 'dart:math';

class Game {
  static int score = 0;
  static List<String> choices = ["Rock", "Paper", "Scisor"];
  static String? randomChoice() {
    Random random = new Random();
    int robotChoiceIndex = random.nextInt(3);
    return choices[robotChoiceIndex];
  }
}

class choice {
  String? type = "";

  static var gameRule = {
    "Rock": {
      "Rock": "Its s draw🤷‍♂️",
      "Paper": "You Lose😥",
      "Scisor": "You Win😍🥳",
    },
    "Paper": {
      "Rock": "You Win😍🥳",
      "Paper": "Its s draw🤷‍♂️",
      "Scisor": "You Lose😥",
    },
    "Scisor": {
      "Rock": "You Lose😥",
      "Paper": "You Win😍🥳",
      "Scisor": "Its s draw🤷‍♂️",
    },
  };
  choice(this.type);
}
