#!\bin\bash
SOURCE_FILE=$1
USAGE(){
     echo -e  " $R USAGE:: $N sh word.sh filepath/filename"
   }

 if [ ! -d $SOURCE_FILE ]
    then  
       echo " Source file does not exit ... please check"
       USAGE
       exit 1
  fi

#count the number of words in given file
number_words="wc --word <$SOURCE_FILE"
# Display the number of the words in the file
echo "number of the words in the file"$number_words



