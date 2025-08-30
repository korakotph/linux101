#!/bin/bash

# Function แสดงข้อผิดพลาดและออกจากโปรแกรม
error_exit() {
    echo "❌ ERROR: $1"
    exit 1
}

# Function แสดงคำเตือน
warning() {
    echo "⚠️  WARNING: $1"
}

# ตัวอย่างการใช้งาน
FILE="data.txt"

# ตรวจสอบว่ามีไฟล์หรือไม่
if [ ! -f "$FILE" ]; then
    error_exit "ไม่พบไฟล์ $FILE"
fi

# ตรวจสอบว่ามีสิทธิ์อ่านหรือไม่
if [ ! -r "$FILE" ]; then
    error_exit "ไม่มีสิทธิ์อ่านไฟล์ $FILE"
fi

# ตรวจสอบขนาดไฟล์
FILE_SIZE=$(stat -f%z "$FILE" 2>/dev/null || stat -c%s "$FILE" 2>/dev/null)

if [ -z "$FILE_SIZE" ]; then
    warning "ไม่สามารถตรวจสอบขนาดไฟล์ได้"
elif [ "$FILE_SIZE" -eq 0 ]; then
    warning "ไฟล์ว่างเปล่า"
else
    echo "✅ ไฟล์มีขนาด $FILE_SIZE bytes"
fi

echo "✅ การตรวจสอบเสร็จสิ้น"