#!/bin/bash

export CURSOR_PATH="/opt/cursor.AppImage"

cursor() {
    (nohup "$CURSOR_PATH" "$@" > /dev/null 2>&1 &)
}
alias c="cursor"
