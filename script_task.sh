#!/bin/bash

#echo command 


#Task 1

# Prompt for user's name
read -p "Enter your name: " name

# Prompt for user's age
read -p "Enter your age: " age

# Calculate the year of birth
current_year=$(date +%Y)
year_of_birth=$((current_year - age))

# Output the message with name and year of birth
echo "Hello, $name! You were born in $year_of_birth."

# Task 2: Create a new directory with a name provided by the user, and navigate into it.

# Prompt for directory name
read -p "Enter the directory name: " directory_name

# Create the directory
mkdir "$directory_name"

# Navigate into the directory
cd "./$directory_name"

# Print the current working directory
pwd


#Task 3 : List all files in the current directory, sorted by file size.

ls -laSh

# Task 4:Count the number of files in the current directory and output the result

ls | wc -l

#5 Take a list of numbers as input from the user and output the sum of those numbers enforcing numeric.

sum=0

echo "Enter a list of numbers (separated by spaces):"
read input_list

# Split the input into an array
IFS=" " read -ra numbers <<< "$input_list"

# Iterate over each number and calculate the sum
for number in "${numbers[@]}"; do
  # Check if the input is a valid number
  if [[ $number =~ ^[0-9]+$ ]]; then
    sum=$((sum + number))
  else
    echo "Invalid input: $number is not a number"
    exit 1
  fi
done

echo "The sum of the numbers is: $sum"

#Task6 : Output a random number between 1 and 100


# Generate a random number between 1 and 100
random_number=$((RANDOM % 100 + 1))

# Check if the generated number is valid
if [[ $random_number =~ ^[0-9]+$ ]]; then
  echo "Random number: $random_number"
else
  echo "Error: Failed to generate a valid random number"
  exit 1
fi

#Task7 : Create a backup of a specified file by copying it to a backup directory with a timestamp in the filename

#create a new file to be backedup 
touch file.txt

#create a new directory
mkdir backup_dir

# Specify the file you want to back up
file_to_backup="/Users/mac/dareyiochort/file.txt"

# Specify the backup directory
backup_directory="/Users/mac/dareyiochort/backup_dir"

# Create the backup filename with timestamp
timestamp=$(date +"%Y%m%d%H%M%S")
backup_filename=$(basename "$file_to_backup").backup_"$timestamp"

# Copy the file to the backup directory
cp "$file_to_backup" "$backup_directory/$backup_filename"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "Backup created successfully: $backup_directory/$backup_filename"
else
  echo "Error: Failed to create backup"
  exit 1
fi

#Task 8 : Check if a website is online and output a message indicating whether it is up or down

# Specify the website URL
website="https://www.google.com"

# Make a HEAD request to the website
response=$(curl --head --silent --output /dev/null --write-out "%{http_code}" "$website")

# Check the response code
if [ "$response" -eq 200 ]; then
  echo "The website $website is online."
else
  echo "The website $website is down."
fi

#Task 9 : Convert a temperature in Celsius to Fahrenheit, using input from the user.

#!/bin/bash

echo "Enter the temperature in Celsius:"
read celsius

# Convert Celsius to Fahrenheit
fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)

echo "The temperature in Fahrenheit is: $fahrenheit"

# Task 10: Ask the user for a sentence, then output the sentence in reverse order. For example, if the user enters “Hello, world!”, the script should output “!dlrow ,olleH”.

# Prompt the user for a sentence
read -p "Enter a sentence: " sentence

# Reverse the sentence
reversed_sentence=$(echo "$sentence" | rev)

# Output the reversed sentence
echo "Reversed sentence: $reversed_sentence"

