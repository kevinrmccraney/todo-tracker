#! /bin/sh

function help () {
echo "todo - a script that uses obsessive-compulsion and git to get things done."
echo ""
echo "		syntax:		  todo FILENAME 'optional description'"
echo ""	
echo "		todo count		- count number of todos";
echo "		todo del FILE		- delete FILE";
echo "		todo meta 'QUERY'	- search todos for 'QUERY'";
echo "		todo old		- return the name of the oldest todo";
echo "		todo purge		- delete all todos";
echo ""
echo "								  Any questions?"
}

if [ $1 ]
then
  case "$1" in
  "count")
    ls -l ./*.todo 2> /dev/null | wc -l
  ;;
  "meta")
    if [[ $2 ]]
    then
      grep --include=\*.todo -rnw . -e "$2"
    fi
  ;;
  "old")
    ls -t -l *.todo | head -n 1
  ;;
  "purge")
    read -p "Press Y to purge all todo files and any other key to cancel." RESP
    if [ "$RESP" = "y" ]
    then
      rm *.todo
    else
      echo "You cancelled the .todo purge."
    fi
  ;;
  del)
    if [[ $2 ]]
    then
      rm $2.todo
    fi
  ;;
  *)
    if [[ $2 ]]
    then
      echo "$2" > "$1".todo
    else
     touch "$1".todo
    fi
  ;;
  esac
else
  "help";
fi
