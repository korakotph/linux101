#!/bin/bash

# วนแสดงเลข 1-5
# for NUMBER in {20..2..2}
# do
#     echo "รอบที่ $NUMBER"
# done

# รายชื่อไฟล์ที่ต้องการสร้าง
# FILES="report.txt data.txt backup.txt"

# for FILE in $FILES
# do
#     echo "กำลังสร้างไฟล์ $FILE"
#     touch $FILE
#     echo "สร้าง $FILE เรียบร้อย"
# done

# echo "สร้างไฟล์ทั้งหมดเสร็จสิ้น"

# COUNT=5

# echo "เริ่มนับถอยหลัง!"

# while [ $COUNT -gt 0 ]
# do
#     echo "$COUNT..."
#     COUNT=$((COUNT - 1))
#     sleep 1
# done

# echo "🚀 ปล่อยจรวด!"

echo "กำลังเริ่ม web server..."

# พยายาม 5 ครั้ง
TRY=1
MAX_TRY=5

while [ $TRY -le $MAX_TRY ]
do
    echo "ครั้งที่ $TRY ตรวจสอบ server..."
    
    # ตรวจสอบว่า server ตอบสนองหรือไม่
    if ping -c 1 localhost > /dev/null 2>&1; then
        echo "✅ Server ทำงานแล้ว!"
        break  # หยุด loop
    fi
    
    echo "ยังไม่ตอบสนอง รออีก 2 วินาที..."
    sleep 2
    
    TRY=$((TRY + 1))
done

# ตรวจสอบว่าสำเร็จหรือไม่
if [ $TRY -gt $MAX_TRY ]; then
    echo "❌ Server ไม่ตอบสนองหลังจากลอง $MAX_TRY ครั้ง"
fi