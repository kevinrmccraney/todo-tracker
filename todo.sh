#!/bin/sh

function help () {
echo "todo - a script that uses obsessive-compulsion and git to get things done."
echo ""
echo "	syntax:	todo FILENAME 'optional description'"
echo "	
echo "		todo init	- starts tracking todos in current directory (optional)";
echo "		todo history	- lists all todos since last interaction with program";
echo "		todo del FILE	- deletes FILE";
echo "		todo purge	- deletes all todos";
}

if [ $1 ]
then
  case "$1" in
  init)
  file= git
    if [ -f "$file" ]
    then
      if [ grep -l '!*.todo'  *.gitignore ]
        echo "Initalizing project tracking."
        echo "* /n !*.todo" > .gitignore
      else
        echo "You've already started tracking. You probably want to perform a commit instead."
      fi
    else
      echo "Sorry. You don't have all the dependencies. Download git and everything should work."
    fi
  purge)
    read -p  "This will purge all .todo files. Are you sure you want to? Press Y to confirm and any other key to cancel." RESP
    if [ "$RESP" = "y" ]; then
      rm *.todo
      git add .
      git commit -m "delete all todos"
    else
      echo "You cancelled the .todo purge."
    fi
  ;;
  history)
    git log
  ;;
  del)
    if [ $2 ]
    then
      rm $2.todo
      git add .
      git commit -m "delete $2"
    fi
  ;;
  *)
    if [ $2 ]
      echo "$2" > $1.todo
    else
      touch $1.todo
    fi
    git add .
    git commit -m "add $1"
  ;;
  esac
else
  help;
fi
}
