# PART 1 - Linux File Operations

## Module 1: Creating Empty Files

### Exercise 1.1: Basic File Creation
```bash
# Create working directory
mkdir ~/lab_essentials
cd ~/lab_essentials

# Create single empty file
touch testfile1
ls -l testfile1

# Observe the file size in bytes
ls -l testfile1
```

### Exercise 1.2: Multiple File Creation
```bash
# Create multiple files using BASH brace expansion
touch testfile{2..10}
ls -l testfile*

# Compare the sizes of all created files
ls -l | grep testfile
```

### Exercise 1.3: Dynamic File Names
```bash
# Create files using system information
touch file."$(hostname)"
touch file."$(hostname)"."$(date +%F)"
touch file."$(hostname)"."$(date +%F)"."$(date +%s)"

# List and examine the created files
ls -l file.*

# Practice with date command formats
date +%y  # Two-digit year
date +%e  # Day of month
date +%C  # Century
```

## Module 2: Creating Files with Content

### Exercise 2.1: Using Redirects
```bash
# Create file with content
echo "grapes 5" > fruits.txt
cat fruits.txt

# Observe what happens with new content
echo "apples 3" > fruits.txt
cat fruits.txt

# Clear file content
echo "" > fruits.txt

# Add content using append
echo "grapes 5" >> fruits.txt
echo "apples 3" >> fruits.txt
cat fruits.txt
```

### Exercise 2.2: Using vim
```bash
# Install vim if needed
sudo dnf install -y vim

# Create and edit new file
vim somefile.txt
```
Add these lines (press 'i' to enter insert mode):
```
grapes 5
apples 7
oranges 3
bananas 2
pears 6
pineapples 9
```
Save and exit (ESC then :wq)

## Module 3: File Operations

### Exercise 3.1: Copying Files
```bash
# Create backup copy
cp somefile.txt backupfile.txt
ls -l *file.txt

# Verify file contents
cat backupfile.txt
```

### Exercise 3.2: Moving/Renaming Files
```bash
# Rename file
mv somefile.txt fruits.txt
ls -l *.txt

# Verify file contents
cat fruits.txt
```

## Module 4: Search and Sort

### Exercise 4.1: Filtering Content
```bash
# View full file
cat fruits.txt

# Search for specific content using BASH pipes
cat fruits.txt | grep apple
cat fruits.txt | grep APPLE

# Case-insensitive search
cat fruits.txt | grep -i apple

# Search for lines beginning with 'apple'
cat fruits.txt | grep -i "^apple"
```

### Exercise 4.2: Sorting Content
```bash
# Sort alphabetically
sort fruits.txt

# Sort by the second column (numbers)
sort -k 2 fruits.txt

# Save sorted outputs
sort fruits.txt > sort_by_alphabetical.txt
sort -k 2 fruits.txt > sort_by_price.txt

# Verify sorted files
cat sort_by_alphabetical.txt
cat sort_by_price.txt
```
# PART 2 - Linux Redirection Fundamentals

## Module 1: Basic Input/Output Redirection

### Exercise 1.1: File Output Redirection
```bash
# Create working directory
mkdir ~/redirection_lab
cd ~/redirection_lab

# Overwriting output (>)
echo "grapes 5" > fruits.txt
cat fruits.txt

# Appending output (>>)
echo "apples 3" >> fruits.txt
cat fruits.txt

# Understanding the difference
echo "oranges 4" > fruits.txt     # Overwrites entire file
echo "bananas 2" >> fruits.txt    # Adds to existing content
cat fruits.txt
```

### Exercise 1.2: Using the Pipe Operator
```bash
# Basic pipe usage
cat fruits.txt | grep apple

# Multiple pipes
cat fruits.txt | grep apple | sort

# Understanding data flow
cat fruits.txt | grep apple | sort | nl
```

## Module 2: Using tee Command

### Exercise 2.1: Basic tee Usage
```bash
# Display and save output simultaneously
date | tee datefile
cat datefile

# Append mode with tee
date | tee -a datefile
cat datefile
```

### Exercise 2.2: Multiple Outputs
```bash
# Create test data
echo "test data" | tee file1.txt file2.txt
cat file1.txt
cat file2.txt
```

## Module 3: Error Redirection

### Exercise 3.1: Redirecting Errors
```bash
# Generate an error
ls nonexistent_file
ls nonexistent_file 2> errors.log
cat errors.log

# Suppress error output
ls nonexistent_file 2> /dev/null
```

### Exercise 3.2: Collecting Error Logs
```bash
# Redirect errors while keeping normal output
ls existing_file nonexistent_file >> output.log 2>> errors.log

# View both logs
echo "=== Output Log ==="
cat output.log
echo "=== Error Log ==="
cat errors.log
```

## Module 4: Practical Examples

### Exercise 4.1: Process Information
```bash
# Install required package if needed
sudo dnf install -y bzip2

# Basic command with redirection
time dd if=/dev/urandom bs=1024k count=1 | bzip2 -9 >> /dev/null
```

### Exercise 4.2: Simple Input Script
```bash
# Create a test script
cat > testscript.sh << 'EOF'
#!/bin/bash
read value
echo "The first value is $value"
read value
echo "The second value is $value"
EOF

# Make it executable
chmod 755 testscript.sh

# Test with input redirection
echo -e "yes\nno" | ./testscript.sh
```

# PART 3 - Linux Permissions Fundamentals

## Module 1: Understanding Linux Permissions

### Exercise 1.1: Viewing Permissions
```bash
# Create working directory
mkdir ~/permissions_lab
cd ~/permissions_lab

# Create test files
touch testfile.txt
mkdir testdir

# View permissions
ls -l testfile.txt
ls -ld testdir
```

### Exercise 1.2: Understanding Permission Format
```bash
# Permission string breakdown:
# -rwxrwxrwx
# |_________|
# |---|---|---|
# | 1 | 2 | 3 |
#
# Position indicators:
# First character: File type
# - : Regular file
# d : Directory
# l : Symbolic link
#
# Sections 1,2,3:
# 1: Owner permissions
# 2: Group permissions
# 3: Others permissions
#
# Permission indicators:
# r : Read permission
# w : Write permission
# x : Execute permission
# - : No permission
```

## Module 2: Reading Permissions

### Exercise 2.1: Examining System Files
```bash
# View home directory permissions
ls -ld /home
ls -ld $HOME

# View root directory permissions
ls -ld /root

# Compare different file types
ls -l /bin/bash
ls -l /etc/passwd
ls -ld /tmp
```

### Exercise 2.2: Permission Analysis
```bash
# Create files with different permissions
touch file1
chmod 644 file1
ls -l file1

touch file2
chmod 755 file2
ls -l file2

# Analyze the differences:
# 644 = rw-r--r--
# 755 = rwxr-xr-x
```

## Module 3: Modifying Permissions

### Exercise 3.1: Using chmod with Letters
```bash
# Create test file
touch permissions_test
ls -l permissions_test

# Add execute permission for user
chmod u+x permissions_test
ls -l permissions_test

# Remove read permission for others
chmod o-r permissions_test
ls -l permissions_test

# Add write permission for group
chmod g+w permissions_test
ls -l permissions_test
```

### Exercise 3.2: Using chmod with Numbers
```bash
# Understanding numeric permissions:
# 4 = read (r)
# 2 = write (w)
# 1 = execute (x)
#
# Common permission combinations:
chmod 644 file1    # rw-r--r--
chmod 755 file2    # rwxr-xr-x
chmod 600 file3    # rw-------
chmod 777 file4    # rwxrwxrwx
```

## Module 4: File Ownership

### Exercise 4.1: Viewing Ownership
```bash
# View file ownership
ls -l testfile.txt

# Understanding ownership format:
# -rw-r--r-- 1 user group size date filename
#              |    |
#              |    +-- Group owner
#              +------- User owner
```

### Exercise 4.2: Changing Ownership
```bash
# Note: These commands require sudo
# Change user ownership
sudo chown user1 testfile.txt

# Change group ownership
sudo chown :group1 testfile.txt

# Change both user and group
sudo chown user1:group1 testfile.txt
```

# PART 1: File Operations Challenge Script

## Challenge Exercise
Create a BASH script that:
1. Creates three files with different names based on current date
2. Adds different fruit entries to each file
3. Combines all files into a single file
4. Sorts the combined file by price
5. Shows only fruits that cost more than 5

```bash
#!/bin/bash

# Script Name: fruit_processor.sh
# Purpose: Demonstrate file operations, sorting, and filtering based on Part 1 concepts
# Usage: ./fruit_processor.sh

# Create three files with different names based on current date components
echo "Creating data files..."

# File 1: Using hour
HOUR_FILE="fruits_$(date +%H).txt"
echo "apples 7" > "$HOUR_FILE"
echo "grapes 4" >> "$HOUR_FILE"
echo "bananas 3" >> "$HOUR_FILE"

# File 2: Using minute
MINUTE_FILE="fruits_$(date +%M).txt"
echo "mangoes 6" > "$MINUTE_FILE"
echo "peaches 8" >> "$MINUTE_FILE"
echo "plums 2" >> "$MINUTE_FILE"

# File 3: Using second
SECOND_FILE="fruits_$(date +%S).txt"
echo "oranges 5" > "$SECOND_FILE"
echo "kiwis 9" >> "$SECOND_FILE"
echo "cherry 4" >> "$SECOND_FILE"

# Display created files
echo -e "\nCreated files:"
ls -l fruits_*.txt

# Combine all files into one
echo -e "\nCombining files..."
cat fruits_*.txt > all_fruits.txt

# Display combined content
echo -e "\nCombined content:"
cat all_fruits.txt

# Sort by price (second column)
echo -e "\nSorting by price..."
sort -k 2 -n all_fruits.txt > sorted_fruits.txt

# Display sorted content
echo -e "\nSorted content:"
cat sorted_fruits.txt

# Filter fruits costing more than 5
echo -e "\nFiltering expensive fruits (cost > 5)..."
grep " [6-9]" sorted_fruits.txt > expensive_fruits.txt

# Display final results
echo -e "\nExpensive fruits:"
cat expensive_fruits.txt

# Clean up intermediate files
rm fruits_*.txt
rm sorted_fruits.txt

echo -e "\nScript completed. Results saved in expensive_fruits.txt"

```

---


Let me explain each part of the script and how it relates to what we learned from Part 1:

1. File Creation:
```bash
HOUR_FILE="fruits_$(date +%H).txt"
echo "apples 7" > "$HOUR_FILE"
echo "grapes 4" >> "$HOUR_FILE"
```
- Uses `date` command with formatting as learned in Exercise 1.3
- Demonstrates both overwrite `>` and append `>>` from Exercise 2.1
- Uses dynamic file naming like we learned in Exercise 1.3

2. Listing Files:
```bash
ls -l fruits_*.txt
```
- Uses file listing with wildcard as shown in Exercise 1.2
- Shows file attributes as practiced throughout Module 1

3. Combining Files:
```bash
cat fruits_*.txt > all_fruits.txt
```
- Uses `cat` for file viewing as learned in Module 2
- Demonstrates output redirection from Exercise 2.1

4. Sorting:
```bash
sort -k 2 -n all_fruits.txt > sorted_fruits.txt
```
- Uses `sort` with column specification as learned in Exercise 4.2
- Demonstrates saving sorted output to new file

5. Filtering:
```bash
grep " [6-9]" sorted_fruits.txt > expensive_fruits.txt
```
- Uses `grep` for pattern matching as learned in Exercise 4.1
- Shows practical application of filtering and redirection

6. File Cleanup:
```bash
rm fruits_*.txt
```
- Demonstrates file removal with wildcards
- Shows practical file management

The script brings together all major concepts from Part 1:
- File creation and manipulation
- Using system information in filenames
- Input/output redirection
- File content filtering and sorting
- Basic file operations

# PART 2: Redirection Challenge Script

## Challenge Exercise

Create a script that:
1. Creates several files with different permissions
2. Displays their initial permissions
3. Modifies permissions using both symbolic and numeric notation
4. Shows the permission changes
5. Demonstrates proper ownership changes (if sudo access available)

```bash
#!/bin/bash

# Script Name: redirection_demo.sh
# Purpose: Demonstrate input/output redirection concepts from Part 2

# Create log directory
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

# Define log files using descriptive names
OUTPUT_LOG="${LOG_DIR}/operations.log"
ERROR_LOG="${LOG_DIR}/errors.log"

# Function to log messages with timestamp
log_message() {
    # Get current timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    # Echo message to both console and log file using tee
    echo "[$timestamp] $1" | tee -a "$OUTPUT_LOG"
}

# Clear previous logs
> "$OUTPUT_LOG"
> "$ERROR_LOG"

# Display welcome message
log_message "Starting redirection demonstration"

# Prompt for user input with error handling
echo "Please enter your name: " | tee -a "$OUTPUT_LOG"
read -r username || {
    echo "Error reading username" 2>> "$ERROR_LOG"
    exit 1
}

# Log the received input
log_message "Received input from user: $username"

# Create a test file with user's name
echo "Hello, $username!" > "user_greeting.txt" 2>> "$ERROR_LOG"
log_message "Created greeting file"

# Demonstrate searching within created file
echo "Searching for username in greeting file..." | tee -a "$OUTPUT_LOG"
if grep -q "$username" "user_greeting.txt" 2>> "$ERROR_LOG"; then
    log_message "Found username in greeting file"
else
    echo "Warning: Username not found in file" 2>> "$ERROR_LOG"
fi

# Demonstrate error redirection with non-existent file
echo "Testing error redirection..." | tee -a "$OUTPUT_LOG"
ls nonexistent_file 2>> "$ERROR_LOG"
log_message "Previous command error was captured in error log"

# Create a summary using multiple redirections
{
    echo "=== Operation Summary ==="
    echo "User: $username"
    echo "Files created:"
    ls -l "$LOG_DIR" "user_greeting.txt" 2>> "$ERROR_LOG"
    echo "======================="
} | tee -a "$OUTPUT_LOG"

# Display final status
log_message "Script completed successfully"
echo -e "\nLogs are available at:"
echo "Output Log: $OUTPUT_LOG"
echo "Error Log: $ERROR_LOG"
```

---

Let me explain the key redirection concepts demonstrated in this script from Part 2:

1. Basic Output Redirection:
```bash
> "$OUTPUT_LOG"              # Clear file using overwrite
echo "Hello, $username!" > "user_greeting.txt"  # Redirect output to file
```
- Shows use of `>` for overwriting files
- Demonstrates creating new files with content

2. Error Redirection:
```bash
ls nonexistent_file 2>> "$ERROR_LOG"  # Redirect errors to error log
```
- Uses `2>>` to append stderr to error log
- Shows practical error handling

3. Using tee for Dual Output:
```bash
log_message() {
    echo "[$timestamp] $1" | tee -a "$OUTPUT_LOG"
}
```
- Demonstrates `tee` for simultaneous console and file output
- Uses `-a` flag for append mode

4. Input Redirection:
```bash
read -r username || {
    echo "Error reading username" 2>> "$ERROR_LOG"
    exit 1
}
```
- Shows handling of input with error checking
- Demonstrates error redirection in case of failure

5. Compound Redirections:
```bash
{
    echo "=== Operation Summary ==="
    # Multiple commands here
} | tee -a "$OUTPUT_LOG"
```
- Uses command grouping with redirections
- Shows how to handle multiple lines of output

The script demonstrates all key concepts from Part 2:
- Input/output redirection
- Error handling and logging
- Using tee for dual output
- Append vs overwrite modes
- Practical logging implementation

# PART 3: Permissions Challenge Script

## Challenge Exercise
Create a script that:
1. Creates several files with different permissions
2. Displays their initial permissions
3. Modifies permissions using both symbolic and numeric notation
4. Shows the permission changes
5. Demonstrates proper ownership changes (if sudo access available)

```bash
#!/bin/bash

# Script Name: permissions_demo.sh
# Purpose: Demonstrate file permissions and ownership concepts from Part 3

# Function to display file permissions
show_permissions() {
    local file="$1"
    local perms=$(ls -l "$file" | awk '{print $1, $3, $4}')
    echo "File: $file"
    echo "Permissions: $perms"
    echo "-------------------"
}

# Create a working directory
echo "Creating working directory..."
WORK_DIR="./permissions_test_$(date +%s)"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR" || exit 1

# Create test files with different initial permissions
echo "Creating test files..."

# File 1: Regular text file (default permissions)
touch regular_file.txt
echo "This is a regular file" > regular_file.txt
show_permissions "regular_file.txt"

# File 2: Script file (needs execute permission)
echo "Creating script file..."
cat > script.sh << 'EOF'
#!/bin/bash
echo "This script works!"
EOF
show_permissions "script.sh"

# File 3: Private file (restricted permissions)
touch private_file.txt
echo "This is private data" > private_file.txt
show_permissions "private_file.txt"

echo "Modifying permissions using symbolic notation..."

# Add execute permission to script using symbolic notation
chmod u+x script.sh
show_permissions "script.sh"

# Remove read permission for others using symbolic notation
chmod o-r regular_file.txt
show_permissions "regular_file.txt"

echo "Modifying permissions using numeric notation..."

# Set private file to user read/write only (600)
chmod 600 private_file.txt
show_permissions "private_file.txt"

# Create a directory with specific permissions
echo "Creating directory with specific permissions..."
mkdir shared_dir
chmod 755 shared_dir
show_permissions "shared_dir"

# Demonstrate ownership changes (if running with sudo)
echo "Attempting ownership changes..."
if [ "$(id -u)" -eq 0 ]; then
    # Only run these if script is run with sudo
    echo "Changing ownership (requires sudo)..."
    
    # Change user ownership
    chown "$SUDO_USER" regular_file.txt
    show_permissions "regular_file.txt"
    
    # Change group ownership
    chown :"$SUDO_USER" private_file.txt
    show_permissions "private_file.txt"
    
    # Change both user and group
    chown "$SUDO_USER":"$SUDO_USER" script.sh
    show_permissions "script.sh"
else
    echo "Note: Ownership changes require sudo privileges"
    echo "Run script with sudo to demonstrate ownership changes"
fi

# Summary of permission bits
echo -e "\nPermission Reference:"
echo "4 = read (r)"
echo "2 = write (w)"
echo "1 = execute (x)"
echo ""
echo "Common permission combinations:"
echo "644 (rw-r--r--) = Regular file"
echo "755 (rwxr-xr-x) = Executable or directory"
echo "600 (rw-------) = Private file"

# Display final directory contents
echo -e "\nFinal directory contents and permissions:"
ls -la

# Cleanup option
read -rp "Do you want to clean up the test directory? (y/n): " cleanup
if [[ $cleanup =~ ^[Yy]$ ]]; then
    cd ..
    rm -rf "$WORK_DIR"
    echo "Cleanup completed."
fi
```

---

Let me explain each major component of this script and its relevance to permissions from Part 3:

1. Permission Display Function:
```bash
show_permissions() {
    local perms=$(ls -l "$file" | awk '{print $1, $3, $4}')
    echo "Permissions: $perms"
}
```
- Uses `ls -l` to show detailed file information
- Extracts permissions, user, and group information
- Provides consistent formatting for display

2. File Creation with Different Purposes:
```bash
# Regular file (default permissions)
touch regular_file.txt
# Script file (needs execute)
touch script.sh
# Private file (restricted access)
touch private_file.txt
```
- Demonstrates different file types
- Shows default permission assignments
- Creates files for different use cases

3. Symbolic Permission Changes:
```bash
chmod u+x script.sh      # Add user execute
chmod o-r regular_file.txt   # Remove other read
```
- `u+x`: Add execute for user
- `o-r`: Remove read for others
- Shows symbolic notation usage

4. Numeric Permission Changes:
```bash
chmod 600 private_file.txt   # rw-------
chmod 755 shared_dir        # rwxr-xr-x
```
- `600`: User read/write only
- `755`: Common directory permissions
- Demonstrates numeric notation

5. Ownership Changes (with sudo):
```bash
if [ "$(id -u)" -eq 0 ]; then
    chown "$SUDO_USER" regular_file.txt
    chown :"$SUDO_USER" private_file.txt
```
- Checks for root privileges
- Changes user ownership
- Changes group ownership
- Shows both separate and combined changes

6. Educational Elements:
```bash
echo "Permission Reference:"
echo "4 = read (r)"
echo "2 = write (w)"
echo "1 = execute (x)"
```
- Includes permission references
- Shows common combinations
- Provides practical examples

Key Learning Points:
1. Permission Notation:
   - Symbolic (u+x, o-r)
   - Numeric (644, 755)
2. File Types:
   - Regular files
   - Executable scripts
   - Directories
3. Ownership:
   - User ownership
   - Group ownership
   - Permission requirements
