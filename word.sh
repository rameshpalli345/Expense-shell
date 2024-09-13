#!\bin\bash
SOURCE_FILE=$1
#count the number of words in given file
number_words='wc --word <$SOURCE_FILE'
# Display the number of the words in the file
echo "number of the words in the file"$number_words



