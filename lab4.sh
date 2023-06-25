#!/bin/bash

if [ "$1" == "--date" ]; then
  dzisiaj=$(date +%Y-%m-%d)
  echo "Dzisiaj jest: $dzisiaj"

elif [ "$1" == "--logs" ]; then
  if [ -z "$2" ]; then
    echo "Podaj liczbę plików jako argument dla opcji --logs"
    exit 1
  fi

  liczba_plikow=$2

  if [[ ! $liczba_plikow =~ ^[0-9]+$ ]]; then
    echo "Nieprawidłowa liczba plików: $liczba_plikow"
    exit 1
  fi

  for ((i=1; i<=$liczba_plikow; i++)); do
    nazwa_pliku="log$i.txt"
    nazwa_skryptu="$0"
    dzisiaj=$(date +%Y-%m-%d)

    echo "Nazwa pliku: $nazwa_pliku" > "$nazwa_pliku"
    echo "Nazwa skryptu: $nazwa_skryptu" >> "$nazwa_pliku"
    echo "Data: $dzisiaj" >> "$nazwa_pliku"

    echo "Utworzono plik: $nazwa_pliku"
  done

elif [ "$1" == "--help" ]; then
  echo "Dostępne opcje:"
  echo "--date - wyświetla dzisiejszą datę"
  echo "--logs [liczba_plików] - tworzy określoną liczbę plików logów"
  echo "--help - wyświetla dostępne opcje"

else
  echo "Nieznany argument: $1"
fi
