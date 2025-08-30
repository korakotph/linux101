#!/bin/bash

# # สร้างไฟล์ข้อมูลผู้ใช้
# cat > users.txt << EOF
# John 25 Engineer
# Mary 30 Designer  
# Peter 28 Manager
# Sarah 35 Developer
# EOF

# # 1. แสดงคอลัมน์ที่ 1 (ชื่อ)
# echo "=== ชื่อทั้งหมด ==="
# awk '{print $1}' users.txt

# # 2. แสดงคอลัมน์ที่ 1 และ 3 (ชื่อ และ ตำแหน่ง)
# echo ""
# echo "=== ชื่อ และ ตำแหน่ง ==="
# awk '{print $1, "เป็น", $3}' users.txt

# # 3. กรองเงื่อนไข (อายุ > 28)
# echo ""
# echo "=== คนที่อายุมากกว่า 28 ==="
# awk '
# $2 > 28 {
#     print $1, "age", $2
# }' users.txt

# สร้างไฟล์คะแนน
cat > scores.txt << EOF
John 85
Mary 92
Peter 78
Sarah 95
Tom 88
EOF

# คำนวณค่าเฉลี่ย
echo "=== คำนวณค่าเฉลี่ย ==="
awk '{
    sum += $2   # บวกคะแนน
    count++     # นับจำนวนคน
} 
END {
    avg = sum / count
    print "คะแนนรวม:", sum
    print "จำนวนคน:", count
    print "คะแนนเฉลี่ย:", avg
}' scores.txt