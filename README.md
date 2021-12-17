# Reference list
# GitHub Link
[GitHub Repo](https://github.com/kimbstocker/KimStocker_T1A3)
## Help Guide
This application requires Ruby version 3.0.3 to run. To check if your computer have Ruby (or version of your Ruby), puts in your terminal
```
ruby --version
```
If you do not have Ruby 3.0.3 version, run the below line on your terminal to install the latest version of Ruby.
```
$ brew install ruby
``` 
Visit https://www.ruby-lang.org/en/documentation/installation/ for more info on how to install Ruby on your device.

To have the best experience with this App, please also install Ruby Gems 'colorize' and 'terminal-table'.

You could run a script file below to automatically install all Gems and dependencies. 

Navigate to the route folder of the application, folder name "KimStocker_T1A3", in your terminal puts the below command to check the script

```
cat src/script/install-dependencies.sh
```
and to run the script put
```
src/script/install-dependencies.sh
```
Once everything is set up, you can use the below script to start the program
```
src/script/start-quiz.sh
```
Another way to start the program is to Navigate to 'KimStocker_T1A3/src' folder and run
```
ruby main.rb
```
For help menu, in 'KimStocker_T1A3/src' folder run
```
ruby main.rb -help
```
The programm requires you to enter your username and Quiz difficulty level (1,2 or 3) before you can start answering any questions. 

A shortcut to start the Quiz is to use the below script and command line arguments. Kindly change 'username' to your username, 'level' to 1, 2 or 3 only.
```
src/script/start-quiz.sh username level
```
# Software Development Plan
## Purpose
In recent years, devices such as computers, phones, calculators etc. have done extremely well at taking over the role of processing and solving mathematical problems for humans. However, learning and understanding math is still evidently an important skill for our everyday life. Mathematics, particularly mental arithmetic operations calculations are also known to help increase the human’s brain capacity. 

Daily brain exercises such as learning a new language, playing Sudoku, playing Chess etc. are also proven to reduce the risk of having alzheimer's disease. This Math Quiz App is developed with the hope to help engaging kids as well as adults in practicing and challenging themselves at mental arithmetic operations (except division). And as a result, improving their intelligence and brain's capacity. 
## Scope
This application is designed for school age children as well as anyone who love Math and wants to practice solving arithmetic operations (except division) using their brain instead of a calculator. 

There are 10 questions in a quiz and users will see their score for each question as well as their overall score at the end of the Quiz.

They will be offered to save their score at the end of each quiz and option to continue playing until they choose to exit the program.

All usernames and scores will be stored (for the life of the program) for progress tracking. This would also incentivise users to keep playing and to reach the top of the leaderboard.

**User Interface & User Experience:**

- Once user execute the program, they will be invited to enter their username.
- The user will see the first question of the quiz once they choose the difficulty level (1,2 or 3)
- The user will then need to enter their answer.
- Once answer is entered, the user will see if their answer is *right* or *wrong* as well as the next question of the quiz. 
- This process will be repeated for a total of 10 questions. (User have the option to Quit at any time of the Quiz by simply enter 'q')
- After answering the 10th question, the user will see their score card. 
- If the user hit the perfect score 10/10, they will be praised with a message. This will encourage users to get a perfect score and come back to the app to keep playing the Quiz.
- If the user is on top of the leaderboard, they will also be notified with a message. All user scores are stored in the program even it the user exit the program and reentered. This is also a good incentive for user to come back and be competitive to either beat their own score or other user score.
- They will also see an option to save their scorecard if they finish all 10 questions.
- If the user choose to save the scorecard as a file, they will be invited to name the file. A file with the name input by user and UTC date, time details will be created and saved in the "scorecards" folder and a message with the file location will be displayed to the user.
- The user will then see options to replay the game or to quit the program. 
- The program continue to run unless the user chose "q" to exit the program.
## Features
### Feature 1: The Quiz
This feature contains 10 randomly generated arithmetic operations questions and users can input their answers. The answers provided will then be checked by the system for scoring. Users will see if their answers are right(green) or wrong(red) after submitting their answer to each question. At the end of the quiz, scores will be tallied up and displayed to the user.
### Feature 2: Difficulty Levels
Users are offered with unlimited quizzes with 3 difficulty levels
- Easy: each question in this level will be randomly generated from 2 arithmetic operators (either +, -, *), 2 single digit numbers and 1 double digit number. 
- Medium: this level include random questions with 2 arithmetic operators (either +, -, *), 1 single digit number and 2 double digit numbers.
- Hard: each question in this level will contain 3 arithmetic operators (either +,-,* or **), 1 single digit number, 2 double digit numbers and 1 triple digit number.
### Feature 3: Saving Scorecard
Once finished their quiz, users can print out their scorecard that list out all 10 questions, the correct answers, their answers and their scores for each questions as well as their overall score.
## Control Flow Diagram
  ![Control Flow Diagram](docs/KimStocker_T1A3_Control_Flow_Diagram.png "Diagram")
## Software Developement Plan and Implementation
- outlines how each feature will be implemented and a checklist of tasks for each feature. Please see more Trello screenshots in docs/Trello Screenshots folder to see the movements of the features items from one column to another.
  ![Trello Board](docs/TrelloHome.png "TrelloBoard")
  ![Trello Difficulty Level Feature](docs/TrelloDifficultyLevel.png "DifficultyLevelFeature")
  ![Trello The Quiz Feature](docs/TrelloTheQuiz.png "TheQuizFeature")
  ![Trello Printing Scorecard Feature](docs/TrelloPrintingScorecard.png "PrintingScorecardFeature")

  

