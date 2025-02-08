# PART 1: Basic File System Operations

## Exercise 1: Directory Navigation
```bash
# Move to your home directory
cd ~

# Verify your location
ls

# Create initial directory
mkdir evaluation

# Attempt to create nested directories (this will fail)
mkdir evaluation/test/round6

# Create nested directories properly
mkdir -p evaluation/test/round6

# Navigate to evaluation directory
cd evaluation

# Print working directory
pwd
# Expected output: /home/yourusername/evaluation
```

## Exercise 2: File Creation and Basic Listing
```bash
# Create first test file
touch testfile1

# Verify file creation
ls

# Create multiple files using brace expansion
touch testfile{2..10}

# List files to see the difference
ls

# Create hidden files
touch .hfile .hfile2 .hfile3

# Standard listing (hidden files won't show)
ls

# List all files including hidden
ls -a

# Long listing format with hidden files
ls -la
```

### Practical Challenges

1. **Basic Operations:**
   ```bash
   # Task: Recreate this sequence
   cd ~
   mkdir practice
   cd practice
   touch file1
   ls -l file1
   ```

2. **Directory Creation:**
   ```bash
   # Task: Create this structure in one command
   # ~/lab/
   #   └── test/
   #       └── files/
   
   # Hint: Use mkdir -p
   ```

3. **File Manipulation:**
   ```bash
   # Task: In your lab directory
   # 1. Create 5 numbered files
   # 2. Create 3 hidden files
   # 3. List only the hidden files
   ```

### Understanding the Output

1. When using `ls -l`, understand each column:
   - Permissions (first column)
   - Number of links
   - Owner
   - Group
   - File size
   - Last modified date/time
   - Filename

2. Hidden files:
   - Start with a dot (.)
   - Not shown in regular ls
   - Shown with ls -a

3. Common mistakes to avoid:
   - Not checking your current directory before operations
   - Forgetting to use -p for nested directories
   - Not verifying file creation with ls
  

# PART 2: System Information Gathering

## Exercise 1: Basic System Information
```bash
# Get hostname information
hostname
hostnamectl

# Check RHEL version
cat /etc/redhat-release

# Kernel information
uname
uname -a
uname -r

# Practice:
# 1. What kernel version are you running?
# 2. What is the full hostname of your system?
# 3. Which version of RHEL 9 is installed?
```

## Exercise 2: Memory Information
```bash
# View memory information
cat /proc/meminfo

# Check memory usage in different formats
free
free -m    # Megabytes
free -h    # Human readable

# Practice Tasks:
# 1. How much total RAM does your system have?
# 2. How much memory is currently free?
# 3. How much memory is in the buffer/cache?
```

## Exercise 3: Processor Information
```bash
# View CPU details
cat /proc/cpuinfo

# Count number of processors
cat /proc/cpuinfo | grep processor | wc -l

# Practice Tasks:
# 1. How many CPU cores does your system have?
# 2. What model of processor do you have?
# 3. What is the CPU speed?
```

## Exercise 4: Storage Information
```bash
# Check disk space
df
df -h    # Human readable format

# Check specific filesystems
df -h | grep -i var
df -h | grep -i sd

# View mounted filesystems
mount
mount | grep -i home

# Check your home directory filesystem
cd ~
pwd
df -h .

# Practice Tasks:
# 1. How much free space is on your root filesystem?
# 2. Which filesystem contains your home directory?
# 3. List all mounted ext4 filesystems
```

## Practical Challenges

1. **System Overview Report**
   ```bash
   # Create a simple report showing:
   # - RHEL version
   # - Kernel version
   # - Hostname
   # - Total RAM
   # - Number of CPUs
   ```

2. **Storage Analysis**
   ```bash
   # For each mounted filesystem:
   # - Show total size
   # - Show used space
   # - Show available space
   # - Show mount point
   ```

3. **Memory Status Check**
   ```bash
   # Display:
   # - Total RAM in GB
   # - Used RAM percentage
   # - Free RAM percentage
   # - Buffer/cache usage
   ```

 # PART 3: System Monitoring

## Exercise 1: System Uptime and Load
```bash
# Check system uptime and load averages
uptime

# Understanding the output:
# 14:23:15              -> Current time
# up 23 days, 2:47      -> System uptime
# 3 users               -> Number of logged in users
# load average: 0.52, 0.58, 0.59  -> 1, 5, 15 minute load averages

# Practice Tasks:
# 1. How long has your system been running?
# 2. What are your current load averages?
# 3. How many users are logged in?
```

## Exercise 2: Load Average Analysis
```bash
# Monitor load over time
uptime
sleep 60
uptime

# Compare the differences:
# - Has the load increased or decreased?
# - Which average changed the most? (1, 5, or 15 minute)

# Practice Task:
# Check load average every minute for 5 minutes
# Record the changes and explain what they mean
```

## Exercise 3: Understanding Load Numbers
```bash
# On a single CPU system:
# Load of 1.0 = 100% CPU usage
# Load of 0.5 = 50% CPU usage
# Load of 2.0 = System is overloaded, processes are waiting

# Check your CPU count
nproc

# Practice:
# 1. Calculate what constitutes a "high load" for your system
# 2. Monitor your system's load for signs of being:
#    - Underutilized (load << CPU count)
#    - Properly loaded (load ≈ CPU count)
#    - Overloaded (load >> CPU count)
```

## Practical Challenges

1. **Basic Load Monitoring**
```bash
# Create a simple monitoring loop
while true; do
    uptime
    sleep 60
done

# Run this and observe:
# - How stable is the load?
# - What patterns do you notice?
# (Use Ctrl+C to stop)
```

2. **System Load Analysis**
```bash
# Create a monitoring record:
# 1. Check load every 5 minutes for 30 minutes
# 2. Record the values
# 3. Calculate average load
# 4. Compare with CPU count
```

3. **Load Pattern Recognition**
```bash
# Monitor and record load during:
# - System idle time
# - Running a basic command (ls -R /)
# - Compare the differences
```
  
