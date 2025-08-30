#!/bin/bash

# Function ทำความสะอาดเมื่อจบการทำงาน
cleanup() {
    echo ""
    echo "🧹 กำลังทำความสะอาด..."
    
    # ลบไฟล์ชั่วคราว
    rm -f /tmp/temp_*
    
    echo "✅ ทำความสะอาดเสร็จสิ้น"
}

# ตั้งให้เรียก cleanup เมื่อ
# - Script จบการทำงาน (EXIT)
# - กด Ctrl+C (INT)
# - มี error (ERR)
trap cleanup EXIT INT ERR

# Script หลัก
echo "🚀 เริ่มการทำงาน..."

# สร้างไฟล์ชั่วคราว
touch /tmp/temp_123.txt
echo "สร้างไฟล์ชั่วคราว"

# จำลองการทำงาน
echo "กำลังประมวลผล..."
sleep 3

echo "✅ ทำงานเสร็จสิ้น"
# cleanup จะถูกเรียกอัตโนมัติเมื่อ script จบ