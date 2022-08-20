#!/bin/bash
#Liam Merritt 8/20/22 freeCodeCamp Salon DB Challenge

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ The Merritt Salon ~~~~~\n"
echo -e "Welcome to The Merritt Salon, what can I do for you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

SERVICE_RESULTS=$($PSQL "SELECT service_id, name FROM services") 
    echo "$SERVICE_RESULTS" | while read ID BAR NAME
        do
        echo "$ID) $NAME"
    done
    read SERVICE_ID_CHOSEN
    SERVICE_NAMES=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_CHOSEN")

    if [[ -z $SERVICE_NAMES ]]
        then
            MAIN_MENU "Service not found. Please enter a valid service."   
        else
            echo -e "\nWhat's your phone number?"
            read PHONE_NUM
            CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUM'")
            if [[ -z $CUSTOMER ]]
                then
                    echo -e "\nNo record for that phone number, what's your name?"
                    read CUSTOMER 
                    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER', '$PHONE_NUM')")
            fi
                CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUM'")
                echo -e "\nWhat time would you like your cut, $CUSTOMER?"
                read SERVICE_TIME
                INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_CHOSEN)")
                echo -e "\nI have put you down for your appointment at $SERVICE_TIME, $CUSTOMER."
    fi
}

MAIN_MENU
