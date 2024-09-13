#!\bin\bash
SOURCE_FILE="/home/ec2-user/logs/filename.txt"
#count the number of words in given file
Number_words=$(wc --word <$SOURCE_FILE)
#Display no of words in the file
echo " Number of words in the file = $Number_words "




