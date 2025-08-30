#!/bin/bash

# # สร้างไฟล์ตัวอย่าง
# echo "I love coffee" > text.txt
# echo "Coffee is great" >> text.txt
# echo "I drink coffee everyday" >> text.txt

# # 1. แทนที่คำ (ครั้งแรกที่เจอ)
# echo "=== แทนที่ coffee -> tea ==="
# sed 's/coffee/tea/' text.txt

# # 2. แทนที่ทุกคำ (ใช้ g = global)
# echo ""
# echo "=== แทนที่ทุก coffee -> tea ==="
# sed 's/coffee/tea/g' text.txt

# # 3. แทนที่แบบไม่สนใจตัวพิมพ์ (i = ignore case)
# echo ""
# echo "=== แทนที่ไม่สนใจตัวพิมพ์ ==="
# sed 's/coffee/tea/gi' text.txt

# ตัวอย่าง log
LOG="2024-01-15 ERROR: Login failed for admin@company.com"

# 1. ซ่อน email
echo "=== ซ่อน Email ==="
echo "$LOG" | sed 's/[a-z]*@[a-z]*.com/***@***.com/'

# 2. เปลี่ยนระดับความสำคัญ
echo ""
echo "=== เปลี่ยน ERROR -> WARNING ==="
echo "$LOG" | sed 's/ERROR/WARNING/'

# 3. ลบวันที่ออก
echo ""
echo "=== ลบวันที่ ==="
echo "$LOG" | sed 's/^[0-9-]* //'