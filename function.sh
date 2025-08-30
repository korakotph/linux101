#!/bin/bash

# # วิธีสร้าง function
# say_hello() {
#     echo "สวัสดีครับ!"
# }

# # วิธีเรียกใช้ function
# say_hello

# # Function ที่รับชื่อ
# greet_user() {
#     NAME=$1  # $1 = ค่าแรกที่ส่งมา
#     SURNAME=$2  # $1 = ค่าแรกที่ส่งมา
#     echo "สวัสดีคุณ $SURNAME $NAME"
# }

# # เรียกใช้พร้อมส่งค่า
# greet_user "สมชาย" "นามสกุล1"
# greet_user "สมหญิง" "นามสกุล2"

# Function ตรวจสอบและสร้างไฟล์
check_and_create_file() {
    FILENAME=$1
    
    if [ -f "$FILENAME" ]; then
        echo "✅ พบไฟล์ $FILENAME แล้ว"
        echo "ขนาด $(ls -lh $FILENAME | awk '{print $5}')"
    else
        echo "❌ ไม่พบไฟล์ $FILENAME"
        echo "กำลังสร้างไฟล์ใหม่..."
        touch "$FILENAME"
        echo "✅ สร้างไฟล์เสร็จแล้ว"
    fi
}

# ใช้ function ตรวจสอบหลายไฟล์
check_and_create_file "config.txt"
check_and_create_file "data.txt"
check_and_create_file "log.txt"