#!/bin/bash

# วิธีที่ 1: ใช้ $? (exit code)
# ping -c 1 localhost > /dev/null 2>&1

# if [ $? -eq 0 ]; then
#     echo "✅ อินเทอร์เน็ตทำงานปกติ"
# else
#     echo "❌ ไม่มีอินเทอร์เน็ต"
# fi

# ตรวจสอบในบรรทัดเดียว
if ping -c 1 google.com > /dev/null 2>&1; then
    echo "✅ เชื่อมต่อได้"
else
    echo "❌ เชื่อมต่อไม่ได้"
fi