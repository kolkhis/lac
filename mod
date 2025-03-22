#!/bin/bash
# TODO: Make all of these variables controllable from the command line
declare SEARCH_DIR='./src'
declare FILE_PATTERN='u*ws.md'
declare SEARCH_TEXT="Submit your input by following the link below"
declare UPDATED_TEXT="\n- The discussion posts are done in Discord threads. Click the 'Threads' icon on the top right and search for the discussion post."

declare -a FILES
IFS=$'\n' read -r -d '' -a FILES < <(find $SEARCH_DIR -name "$FILE_PATTERN")

for FILE in "${FILES[@]}"; do
    printf "File: %s\n" "$FILE"
    sed -i "/${SEARCH_TEXT}/s/:/./" "${FILE}" || {
        printf "Failed to replace colon with period.\n" && exit 1
    }
    sed -i "/$SEARCH_TEXT/a\\$UPDATED_TEXT" "$FILE" || {
        printf "Failed to append text.\n" && exit 1
    }
done

