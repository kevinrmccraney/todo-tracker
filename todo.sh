#! /bin/sh

function help () {
echo "todo - a script that uses obsessive-compulsion and git to get things done."
echo "		      be sure to isolate this from any other git-based projects."
echo "			 you have to get git installed for this to work. git it!"
echo ""
echo "		syntax:		  todo FILENAME 'optional description'"
echo ""	
echo "		todo init	- starts tracking todos in current directory";
echo "		todo history	- lists all todos since last interaction with program";
echo "		todo del FILE	- deletes FILE";
echo "		todo purge	- deletes all todos";
echo "		todo count	- counts number of todos";
echo ""
echo "								  Any questions?"
}

if [ $1 ]
then
  case "$1" in
  init)
    if [ -f ./.gitignore ]
    then
     echo "You've already started tracking. You probably want to perform a commit instead."
    else
      echo "Initalizing project tracking."
      echo '* \n!*.todo' >.gitignore
      git init -q
      git add .
      git commit -m "inital todo commit"
    fi
  ;;
  "count")
    ls -l ./*.todo 2> /dev/null | wc -l
  ;;
  "purge")
    read -p "Press Y to purge all todo files and any other key to cancel." RESP
    if [ "$RESP" = "y" ]
    then
      if [ -f ./.gitignore ]
      then
        rm *.todo
        git add .
        git commit -m 'delete all todos'
      else
        rm *.todo
      fi
    else
      echo "You cancelled the .todo purge."
    fi
  ;;
  "history")
    if [ -f ./.gitignore ]
    then
      git log
    else
      echo "Sorry, you don't have tracking enabled."
    fi
  ;;
  del)
    if [ $2 ]
    then
      rm "$2".todo
    fi
    if [ -f ./*.gitignore ]
    then
      git add .
      git commit -m 'delete "$2"'
    fi
  ;;
  *)
    if [ $2 ]
    then
      echo "$2" > "$1".todo
    else
      touch "$1".todo
    fi
    if [ -f ./*.gitignore ]
    then
      git add .
      git commit -m 'add "$1"'
    fi
  ;;
  esac
else
  "help";
fi
