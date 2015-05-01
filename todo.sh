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
echo ""
echo "								  Any questions?"
}

if [ $1 ]
then
  case "$1" in
  init)
    if [ -a .gitignore ]
    then
      echo "Initalizing project tracking."
      echo '* \n !*.todo' >.gitignore
    else
      echo "You've already started tracking. You probably want to perform a commit instead."
    fi
  ;;
  "purge")
    read -p  "This will purge all .todo files. Are you sure you want to? Press Y to confirm and any other key to cancel." RESP
    if [ "$RESP" = "y" ]
    then
      if [ -a .gitignore ]
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
    if [ -a .gitignore ]
    then
      git log
    else
      echo "Sorry, you don't have tracking enabled."
    fi
  ;;
  del)
    if [ $2 ]
    then
      rm $2.todo
    fi
    if [ -a .gitignore ]
    then
      git add .
      git commit -m 'delete $2'
    fi
  ;;
  *)
    if [ $2 ]
    then
      echo "$2" > $1.todo
    else
      touch $1.todo
    fi
    if [ -a .gitignore ]
    then
      git add .
      git commit -m 'add $1'
    fi
  ;;
  esac
else
  "help";
fi
