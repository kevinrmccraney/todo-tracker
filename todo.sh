#!/bin/sh

# this first part is carving up the script into parts
# functionality should be todo -flag TASKNAME "meta"
# if no taskname is provided, then syntax should be
# todo help provides help 
# todo init enables tracking
# todo list lists all todos 
# todo purge

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
# git add .
# git commit -m "add $1"
# echo '$2' > $1.todo
# the second argument should be optional, so:
}

function todo_history() {
# git log
}

function todo_init() {
# check for presence of gitignore file that ignores everything but .todo
# if gitignore is not there,
# touch .gitignore containing
# *
# !*.todo
# else perform a commit
# 
}

function todo_del() {
# rm [ $1 ].todo
}

function todo_purge() {
# rm *.todo
}
