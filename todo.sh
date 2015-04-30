#!/bin/sh

# this first part is carving up the script into parts
# functionality should be todo -flag TASKNAME "meta"

function help(
# list functionality here
)

function todo(
# git add .
# git commit -m "add $1"
)

function todo_list(
# git log
)

function todo_init(
# check for presence of gitignore file that ignores everything but .todo
# if gitignore is not there,
# touch .gitignore containing
# *
# !*.todo
# else perform a commit
# 
)

function todo_purge(
# rm *.todo
)
