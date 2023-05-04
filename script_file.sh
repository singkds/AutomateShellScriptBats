#!/bin/bash

# function to add numbers in a list
add_numbers() {

  local input_file=$1
  local total=0

#to read last line if newline character not present
  while read num || [[ -n "$num" ]]
  do
    total=$((total + num))
  done < $input_file
  
  local output_file=$2

#write to file, skipping the newline character by echo
  echo -n $total > $output_file
}

# function to multiply list of numbers
multiply_numbers() {

  local input_file=$1
  local product=1

#to read last line if newline character not present
  while read num || [[ -n "$num" ]]
  do
    echo "$num"
    product=$((product * num))
  done < $input_file

  local output_file=$2
  echo -n $product > $output_file

}

#function to concatenate list strings
concatenate_strings(){
  local input_file=$1
  local concatenated_strings=""

# To read the space at the end of string using read command with -r option 
#(disables the interpretation of backslash escapes and treats each input line as a raw string)
  while IFS= read -r str || [[ -n "$str" ]]
  do
    concatenated_strings="$concatenated_strings$str"
  done < $input_file
  
  local output_file=$2
  echo -n $concatenated_strings > $output_file
}

# Function to Replaces all occurrences of a substring in a string
function remove_duplicates {
    local input_file="$1"
    
    #shorthand way of reading and storing contents in a string
    local list=($(<"$input_file"))
    
    local output_file=$2
    echo -n "${list[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ' | sed 's/ *$//' > "$output_file"
}

# Function to Replaces all occurrences of a substring in a string
function replace_substring {
    local input_file="$1"

    mapfile -t strings < ${input_file}

    local input_string=${strings[0]}
    local old_substring=${strings[1]}
    local new_substring=${strings[2]}

    local output_file=$2
    echo -n "${input_string//$old_substring/$new_substring}" > "$output_file"
}
