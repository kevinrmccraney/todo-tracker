#!/bin/sh

# this first part is carving up the script into parts
# functionality should be todo -flag TASKNAME "meta"
# if no taskname is provided, then syntax should be 

if [ $1 ]
then
    # do stuff
else
    help
fi


function help() {
echo "todo - a script that uses obsessive-compulsion and git to get things done."
echo "
echo "	syntax:	todo FILENAME "optional description"
echo "	
echo "		todo init	- starts tracking todos in current directory (optional);
echo "		todo history	- lists all todos since last interaction with program;
echo "		todo del FILE	- deletes FILE;
echo "		todo purge	- deletes all todos;
}

function todo() {
if [ $2 ]
    echo "$2" > $1.todo
else
    touch $1.todo
fi
git add .
git commit -m "add $1"
}

function todo_history() {
git log
}

function todo_init() {

# check for presence of gitignore file that ignores everything but .todo
# grep .gitignore
if
    # gitignore is not there
    echo "* /n !*.todo" > .gitignore
else
    echo "You've already performed this command. You probably want to perform a commit instead."
fi
}

function todo_del() {
rm $1.todo
git add .
git commit -m "delete $1"
}

function todo_purge() {
rm *.todo
git add .
git commit -m "delete all todos"
}
