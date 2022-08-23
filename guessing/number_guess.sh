#!/bin/bash
#LIAM MERRITT RELATIONAL DB NUMBER GUESSING GAME CHALLENGE

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

BEGIN_GAME(){
  if [[ -z $GUESS ]]
    then
      echo "Guess the secret number between 1 and 1000:"
      ATTEMPTS=1
  else
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
      then
        echo "That is not an integer, guess again:"
    elif (( $GUESS > $SECRET_NUMBER ))
      then
        echo "It's lower than that, guess again:"
        ATTEMPTS=$(( ATTEMPTS+1 ))
    elif (( $GUESS < $SECRET_NUMBER ))
      then
        echo "It's higher than that, guess again:"
        ATTEMPTS=$(( ATTEMPTS+1 ))
    else
      echo -e "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!\n"
      if [[ -z $PB  ]] || (( $ATTEMPTS < $PB ))
        then
          UPDATE_PB=$($PSQL "UPDATE gamers SET games_played = $(( GAMES_PLAYED+1 )), best_game = $ATTEMPTS WHERE user_id = $USER_ID")
        else
          UPDATE_PB=$($PSQL "UPDATE gamers SET games_played = $(( GAMES_PLAYED+1 )) WHERE user_id = $USER_ID")
      fi
      exit 0
    fi  
  fi

  read GUESS
  BEGIN_GAME
}

echo -e "\n~~ Number Guessing Game ~~\n"

SECRET_NUMBER=$(( RANDOM%1000 + 1 ))

echo "Enter your username: "
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM gamers WHERE name = '$USERNAME'")
echo $USER_ID
if [[ -z $USER_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO gamers (name) VALUES ('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM gamers WHERE name = '$USERNAME'")
else
    USER_HISTORY=$($PSQL "SELECT games_played, best_game FROM gamers WHERE user_id = $USER_ID")
    GAMES_PLAYED=$(echo $USER_HISTORY | sed -E 's/(^[0-9]+).+$/\1/')
    PB=$(echo $USER_HISTORY | sed -E 's/^.+\ ([0-9]+)$/\1/')
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $PB guesses."
fi

BEGIN_GAME
