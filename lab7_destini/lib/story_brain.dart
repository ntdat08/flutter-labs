import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Your car has a flat tire on a deserted road deep in the forest. Your phone has no signal. You decide to walk and see a rusty pickup truck stop beside you. A man wearing a wide-brimmed hat looks at you and asks, "Need a ride, kid?".',
      choice1: 'I will get in. Thank you very much!',
      choice2: 'I should probably ask if you are a murderer first.',
    ),
    Story(
      storyTitle:
          'The man slowly nods, seemingly not bothered by your question. "Most people do not ask that," he says as he opens the truck door for you.',
      choice1: 'At least he is honest. I will get in.',
      choice2: 'Wait a minute. I know how to change a tire. I will do it myself!',
    ),
    Story(
      storyTitle:
          'As soon as you get into the truck, the man starts mumbling about a recent bank robbery. He looks at you through the rearview mirror with a mysterious smile.',
      choice1: 'I love dangerous adventures! Tell me more, buddy!',
      choice2: 'Stop the truck right now! Let me out!',
    ),
    Story(
      storyTitle:
          'You become friends with the mysterious man. The two of you escape together and become the most notorious criminal duo in the area! (THE VILLAIN HAS A HAPPY ENDING)',
      choice1: 'Play Again',
      choice2: '',
    ),
    Story(
      storyTitle:
          'As soon as you get out of the truck, the man speeds away into the darkness. You are left standing alone and realize that you accidentally left your car keys in his truck. (DEAD END)',
      choice1: 'Play Again',
      choice2: '',
    ),
    Story(
      storyTitle:
          'You go back and successfully change your tire. Then you drive safely home and have dinner with your family. A completely safe choice! (SAFE ENDING)',
      choice1: 'Play Again',
      choice2: '',
    ),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 5;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 3;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 ||
        _storyNumber == 4 ||
        _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber == 0 ||
        _storyNumber == 1 ||
        _storyNumber == 2;
  }
}
