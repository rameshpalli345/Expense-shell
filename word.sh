#!\bin\bash
SOURCE_FILE="/home/ec2-user/logs/filename.txt"
#count the number of words in given file
Number_words=$(wc --word <$SOURCE_FILE)
Number_lines=$( wc --lines <$SOURCE_FILE)
#Display no of words in the file
echo " Number of words in the file = $Number_words "
echo " Number of lines in the file = $Number_lines "




