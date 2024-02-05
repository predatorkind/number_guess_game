#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# generate random number between 1 and 1000
SECRET_NUMBER=$((1 + RANDOM % 1000))
echo Enter your username:
read USER_NAME
# check if user exists and obtain user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME';")
# if user does not exist create user and print welcome message
if [[ -z $USER_ID ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USER_NAME');")
  if [[ $INSERT_USER_RESULT == 'INSERT 0 1' ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME';")
    echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
  fi
# if user exists get stats of previous games and include them in welcome message
else
  TOTAL_GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID';")
  BEST_SCORE=$($PSQL "SELECT MIN(score) FROM games WHERE user_id='$USER_ID';")
  echo -e "Welcome back, $USER_NAME! You have played $TOTAL_GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."

fi
GUESS=""
NUMBER_OF_GUESSES=0
# prompt user for guess
echo -e "\nGuess the secret number between 1 and 1000:"
while [[ $GUESS != $SECRET_NUMBER ]]
do
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif (( GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
    ((NUMBER_OF_GUESSES++))
  elif (( GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
    ((NUMBER_OF_GUESSES++))
  fi

done
((NUMBER_OF_GUESSES++))
# save result and print end game message
SAVE_RESULT=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!" 