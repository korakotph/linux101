#!/bin/bash

# # รับค่าจาก user
# echo "Your score :"
# read SCORE

# # ตรวจสอบเงื่อนไข
# if [ $SCORE -ge 80 ]; then
#     echo "เกรด A"
# elif [ $SCORE -ge 70 ]; then
#     echo "เกรด B"
# elif [ $SCORE -ge 60 ]; then
#     echo "เกรด C"
# elif [ $SCORE -ge 50 ]; then
#     echo "เกรด D"
# else
#     echo "เกรด F"
# fi

# ตรวจสอบว่ามีไฟล์หรือไม่
# FILE="data.txt"
echo "Select file :"
read FILE

if [ -f "$FILE" ]; then
    echo "พบไฟล์ $FILE"
    echo "เนื้อหาในไฟล์"
    cat $FILE
else
    echo "ไม่พบไฟล์ $FILE"
    echo "กำลังสร้างไฟล์ใหม่..."
    echo "Hello World" > $FILE
    echo "สร้างไฟล์เรียบร้อย"
fi