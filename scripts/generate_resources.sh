#!/bin/bash
# To be run in the project's root directory
declare RESOURCES_FILE='./src/resources.md'
declare SEARCH_DIR="./src"
declare FILE_PATTERN="*.md"
declare -A ADDED_LINKS

declare -a FILES
IFS=$'\n' read -r -d '' -a FILES < <(find "$SEARCH_DIR" -maxdepth 1 -mindepth 1 -name "$FILE_PATTERN")

# truncate file
: > "$RESOURCES_FILE"

debug() {
    printf "[ \033[33mDEBUG\033[0m ]: "
    printf "%s\n" "$*"
}

pull-links() {
    local -i COUNT_MD_LINKS=0
    local -i COUNT_REG_LINKS=0
    local -i COUNT_UF_LINKS=0
    local -i DUPLICATES
    for FILE in "${FILES[@]}"; do
        local UNIT=
        [[ "$FILE" == *resources.md ]] && continue  

        declare -a RESOURCES

        IFS=$'\n' read -r -d '' -a RESOURCES < <(
            grep -i -E '\<https://' "$FILE" |
                # grep -v -E '(img)? ?src=|discord\.(gg|com)|user-attachments|.*\.png'
                grep -v -E '(img)? ?src=|discord\.(gg|com)|user-attachments'
        )

        for RESOURCE in "${RESOURCES[@]}"; do
            local RESOURCE
            local MARKDOWN_LINK=
            [[ $FILE =~ .*u([0-9]+).*\.md ]] && UNIT="${BASH_REMATCH[1]}"
            [[ -n $UNIT ]] && printf "\033[32mUNIT NUMBER: %s\n \033[0m" "${UNIT}"

            # extract the link from the line
            MARKDOWN_LINK="$(printf "%s" "$RESOURCE" | sed -E -e 's/.*(\[.*\]\(.*\)).*/\1/')" 

            debug "$MARKDOWN_LINK"
            if [[ $MARKDOWN_LINK =~ .*(<.*>).* ]]; then
                # Link is formatted as: <http://example.com>
                MARKDOWN_LINK="${BASH_REMATCH[1]}"
                COUNT_REG_LINKS+=1
            elif [[ $MARKDOWN_LINK =~ .*[^[\<\(](https://[^ \)]+).* ]]; then
                # Link is unformatted: http://example.com
                MARKDOWN_LINK="${BASH_REMATCH[1]}"
                COUNT_UF_LINKS+=1
                continue
            else
                # Link is formatted as: [Link](http://example.com)
                COUNT_MD_LINKS+=1
            fi

            if printf "%s" "$MARKDOWN_LINK" | grep -i 'github.com'; then
                printf "Found GH link in unit %s: %s\n" "$UNIT" "$MARKDOWN_LINK"
            fi

            if grep -i "${MARKDOWN_LINK}" "${RESOURCES_FILE}"; then
                debug "Duplicate found"
                DUPLICATES+=1
            fi

            # Fix duplicate problem
            # Using grep to check for duplicates created a race condition
            # - Add associative array containing links already added
            #   - Bash can't parse markdown links as associative array keys
            #   - use md5sum hashes
            LINK_HASH=$(printf "%s" "${MARKDOWN_LINK,,}" | md5sum | cut -d ' ' -f1)
            if [[ -z "${ADDED_LINKS["$LINK_HASH"]}" ]]; then
                [[ -n $UNIT ]] && sed -i "/^## Unit $UNIT$/a- $MARKDOWN_LINK" "$RESOURCES_FILE"
                [[ -z $UNIT && -n "$MARKDOWN_LINK" ]] && sed -i "/^## Misc$/a- $MARKDOWN_LINK" "$RESOURCES_FILE"
                ADDED_LINKS["$LINK_HASH"]=1
            fi

        done

    done

    TOTAL_LINK_COUNT=$(( COUNT_MD_LINKS + COUNT_UF_LINKS + COUNT_REG_LINKS ))
    printf "\nREPORT:\n- Markdown Links\t%s\n- Regular Links\t\t%s\n- Unformatted Links\t%s\n\nTotal Links: %s\n" "$COUNT_MD_LINKS" "$COUNT_REG_LINKS" "$COUNT_UF_LINKS" "$TOTAL_LINK_COUNT"
    printf 'Duplicates: %s\n' "$DUPLICATES"

}

format-resources() {
    cat <<- EOF >> "$RESOURCES_FILE"
	<div class="flex-container">
	        <img src="https://github.com/ProfessionalLinuxUsersGroup/img/blob/main/Assets/Logos/ProLUG_Round_Transparent_LOGO.png?raw=true" width="64" height="64"></img>
	    <p>
	        <h1>Course Resources</h1>
	    </p>
	</div>
	This is a comprehensive list of all external resources used in this course.

	EOF

    for i in {1..16}; do
        if ! grep -qi -E "^## Unit ${i}$" "$RESOURCES_FILE"; then
            printf "## Unit %s\n\n" "$i" >> "$RESOURCES_FILE"
        fi
    done

    if ! grep -qi -E "^## Misc$" "$RESOURCES_FILE"; then
        printf "## Misc\n" >> $RESOURCES_FILE
    fi
}

format-resources
pull-links

: ' Example CI/CD integration 
      - name: Generate resources.md dynamically
        run: ./scripts/generate_resources.sh

      - name: Check for uncommitted changes
        run: |
          git diff --exit-code || (echo "::error::resources.md is outdated. Run the script and commit it." && exit 1)
'
