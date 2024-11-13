#!/bin/bash
display_menu(){

echo "1.Create the file "
echo "2.View a file  "
echo "3.Add recods to file "
echo "4.Delete a file "
echo "5.Modify a file "
echo "6.Exit "


}

Create_file(){
    read -p "Enter a file name" filename
    if [ -e "$filename" ]; then
        rm "$filename"
    else
        echo -e "Name\tPhone.n0\t\tAddres\n==========================\n">"$filename"
        Add_record
    fi
}

Add_record(){
    count=1
    while [ "$count" -ne 0 ]; do
      read -p "Enter name" name
      read -p "Phone no" Phone_no
      read -p "Address" Address
      echo -e "$name\t$Phone_no\t\t$Address">>"$filename"

      read -p "Exit 0 r 1" count
    done 

}
View_record(){
    echo "===VIEW RECORD==="
    cat "$filename"
}

Delete_record(){
    read -p "Enter name" pattren
    grep -v "$pattren" "$filename">temp && mv temp "$filename"
}
Modify_record(){
    Delete_record
    read -p "Enter name" name
    read -p "Phone no" Phone_no
    read -p "Address" Address
    echo -e "$name\t$Phone_no\t\t$Address">>"$filename"
}

option=0

while [ "$option" -ne 6 ]; do
  display_menu
  read -p "Choose an option: " option

  case $option in
   1)Create_file;;
   2)View_record;;
   3)Add_record;;
   4)Delete_record;;
   5)Modify_record;;
   6)echo "Exit"; break ;;
   *)echo "Invalid option";;
  esac
 done