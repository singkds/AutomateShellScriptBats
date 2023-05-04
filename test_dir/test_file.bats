#!/usr/bin/env bash

setup(){
    load ../script_file.sh
}

# Test concatenate_strings function
@test "function concatenate_strings to concatenate list of strings and write result to output file" {
    local input_file="./test_dir/test_input/testConcatenate/test.txt"
    local expected_output_file="./test_dir/test_input/testConcatenate/expectedOutput.txt"
    local actual_output_file="./test_dir/test_input/testConcatenate/actualOutput.txt"
    
    local result=$(concatenate_strings "$input_file" "$actual_output_file")

      # Check that the output file exists
    [ -f "$actual_output_file" ]
    
    diff "$actual_output_file" "$expected_output_file"

}

# Test multiply_numbers function
@test "function multiply_numbers to multiply numbers in a list and write result to output file" {
    local input_file="./test_dir/test_input/testMultiply/test.txt"
    local expected_output_file="./test_dir/test_input/testMultiply/expectedOutput.txt"
    local actual_output_file="./test_dir/test_input/testMultiply/actualOutput.txt"
    
    local result=$(multiply_numbers "$input_file" "$actual_output_file")

      # Check that the output file exists
    [ -f "$actual_output_file" ]
    
    diff "$actual_output_file" "$expected_output_file"
}


# Test add_numbers function
@test "function add numbers in a list and write result to output file" {
    local input_file="./test_dir/test_input/testAdd/test.txt"
    local expected_output_file="./test_dir/test_input/testAdd/expectedOutput.txt"
    local actual_output_file="./test_dir/test_input/testAdd/actualOutput.txt"
    
    local result=$(add_numbers "$input_file" "$actual_output_file")

      # Check that the output file exists
    [ -f "$actual_output_file" ]
    
    diff "$actual_output_file" "$expected_output_file"
}


@test "should write logs" {
    skip "Logs are not implemented yet"

    local file_content=`cat ./test_dir/tmp/logs`
    [ "$file_content" == 'I logged something' ]
}

# Test remove_duplicates function
@test "funcation remove_duplicates function and write result to output file" {
    local input_file="./test_dir/test_input/testRemDup/test.txt"
    local expected_output_file="./test_dir/test_input/testRemDup/expectedOutput.txt"
    local actual_output_file="./test_dir/test_input/testRemDup/actualOutput.txt"

    local result=$(remove_duplicates "${input_file}" "${actual_output_file}")
    
    # Check that the output file exists
    [ -f "$actual_output_file" ]
    
    diff "$actual_output_file" "$expected_output_file"
}


# Test replace_substring function
@test "function Replace substring and write result to output file" {
    local input_file="./test_dir/test_input/testRepSubstr/test.txt"
    local expected_output_file="./test_dir/test_input/testRepSubstr/expectedOutput.txt"
    local actual_output_file="./test_dir/test_input/testRepSubstr/actualOutput.txt"

    local result=$(replace_substring "${input_file}" "${actual_output_file}")

    # Check that the output file exists
    [ -f "$actual_output_file" ]
    
    diff "$actual_output_file" "$expected_output_file"
}
