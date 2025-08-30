#!/bin/bash

# # สร้างไฟล์ตัวอย่าง
# cat > server.log << EOF
# 2024-01-15 10:00:00 INFO Server started
# 2024-01-15 10:00:05 INFO User login admin
# 2024-01-15 10:00:10 ERROR Database connection failed
# 2024-01-15 10:00:15 WARNING Low memory
# 2024-01-15 10:00:20 ERROR File not found config.txt
# 2024-01-15 10:00:25 INFO User logout admin
# EOF

# # 1. ค้นหาคำง่ายๆ
# echo "=== ค้นหาคำว่า 'ERROR' ==="
# grep "ERROR" server.log

# # 2. นับจำนวนครั้งที่เจอ
# echo ""
# echo "=== นับจำนวน ERROR ==="
# grep -c "ERROR" server.log

# # 3. ค้นหาแบบไม่สนใจตัวพิมพ์ใหญ่/เล็ก
# echo ""
# echo "=== ค้นหา 'error' (ไม่สนใจตัวพิมพ์) ==="
# grep -i "error" server.log

# # 4. แสดงเลขบรรทัด
# echo ""
# echo "=== แสดงพร้อมเลขบรรทัด ==="
# grep -n "ERROR" server.log

LOG_FILE="server.log"

echo "📊 === สรุปการวิเคราะห์ Log ==="
echo ""

# นับแต่ละระดับ
INFO_COUNT=$(grep -c "INFO" $LOG_FILE)
ERROR_COUNT=$(grep -c "ERROR" $LOG_FILE)
WARNING_COUNT=$(grep -c "WARNING" $LOG_FILE)

echo "ℹ️  INFO: $INFO_COUNT รายการ"
echo "❌ ERROR: $ERROR_COUNT รายการ"
echo "⚠️  WARNING: $WARNING_COUNT รายการ"

# แจ้งเตือนถ้ามี ERROR
if [ $ERROR_COUNT -gt 0 ]; then
    echo ""
    echo "🚨 พบข้อผิดพลาด! รายละเอียด"
    grep "ERROR" $LOG_FILE
fi