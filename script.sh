#!/bin/bash

# function to add numbers in a list
add_numbers() {

  local input_file=$1
  local output_file=$2
  > $output_file

  while IFS= read -r line; do
      # convert line into array of numbers
      local arr=($line)
      local total=0

      # iterate through each number in the array and add it to the sum
      for num in "${arr[@]}"; do
          total=$((total+num))
      done

  echo $total >> $output_file
  done < ${input_file}
}

# function to multiply list of numbers
multiply_numbers() {

  local input_file=$1
  local output_file=$2
  > $output_file
  
  while IFS= read -r line; do
      # convert line into array of numbers
      local arr=($line)
      local product=1

      # iterate through each number in the array and add it to the sum
      for num in "${arr[@]}"; do
          product=$((product*num))
      done

  echo $product >> $output_file
  done < ${input_file}

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
