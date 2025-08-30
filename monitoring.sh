#!/bin/bash

# Server Health Check Script
# ตรวจสอบสถานะ server และแจ้งเตือน

echo "📊 === Server Health Check ==="
echo "วันที่: $(date)"
echo ""

# 1. ตรวจสอบพื้นที่ Disk
echo "💾 พื้นที่ Disk:"
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 80 ]; then
    echo "  ⚠️  คำเตือน: ใช้ไป $DISK_USAGE%"
elif [ $DISK_USAGE -gt 60 ]; then
    echo "  ⚠️  ข้อควรระวัง: ใช้ไป $DISK_USAGE%"
else
    echo "  ✅ ปกติ: ใช้ไป $DISK_USAGE%"
fi

# 2. ตรวจสอบ Memory
echo ""
echo "🟩 Memory:"
MEM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
MEM_USED=$(free -h | grep Mem | awk '{print $3}')
MEM_FREE=$(free -h | grep Mem | awk '{print $4}')

echo "  ทั้งหมด: $MEM_TOTAL"
echo "  ใช้ไป: $MEM_USED"
echo "  เหลือ: $MEM_FREE"

# 3. ตรวจสอบ CPU
echo ""
echo "📊 CPU:"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "  การใช้งาน: $CPU_USAGE%"

# 4. ตรวจสอบ Services
echo ""
echo "🔧 Services:"
SERVICES="nginx mysql ssh"

for SERVICE in $SERVICES
do
    if service $SERVICE status > /dev/null 2>&1; then
        echo "  ✅ $SERVICE: ทำงานปกติ"
    else
        echo "  ❌ $SERVICE: หยุดทำงาน!"
    fi
done

# 5. ตรวจสอบการเชื่อมต่อ Internet
echo ""
echo "🌐 Internet:"
if ping -c 1 google.com > /dev/null 2>&1; then
    echo "  ✅ เชื่อมต่อได้"
else
    echo "  ❌ เชื่อมต่อไม่ได้!"
fi

echo ""
echo "========================================="