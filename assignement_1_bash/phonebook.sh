#!/bin/bash
clear
if [ ! -f phonebookDB.txt  ]; then
touch phonebookDB.txt;

fi

file=phonebookDB.txt;

#echo " -i insert new name&number"
#echo " -v view all contacts"
#echo " -s search by contact"
#echo " -e delete all records "
#echo " -d delate all contacts"

case $1 in 
-i) 
read -p"enter the name contact"  name
read -p"enter the number of contact"  number
echo $number

echo -n $name >> phonebookDB.txt
echo -e "\t"$number >> phonebookDB.txt 
;;
-v)
cat phonebookDB.txt
;;
-s)
read -p "enter the name u want search" key
cmd=$(grep -ci -w "$key" $file)
if [ "$cmd" != "0" ]; then 
grep $key phonebookDB.txt
#echo "the contact exsist"
else 
 echo "the contact not exsist"
fi 
;;
-e)
> phonebookDB.txt 
;;
-d)
read -p "enter the name u want delete" key
sed -i -e "/\<$key\>/d" phonebookDB.txt

;;
esac
