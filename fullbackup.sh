#!/bin/bash

# Script สำหรับ backup ไฟล์สำคัญ
BACKUP_DIR="backup"
DATE=$(date +%Y%m%d)

echo "🔄 เริ่มการ Backup วันที่ $DATE"

# สร้าง backup directory
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "📁 สร้าง folder backup"
fi

# รายการไฟล์ที่ต้อง backup
FILES_TO_BACKUP="
config.txt
data.txt
important.doc
"

# วน loop backup แต่ละไฟล์
for FILE in $FILES_TO_BACKUP
do
    if [ -f "$FILE" ]; then
        # สร้างชื่อไฟล์ backup
        BACKUP_NAME="${FILE}_backup_${DATE}"
        
        # คัดลอกไฟล์
        cp "$FILE" "$BACKUP_DIR/$BACKUP_NAME"
        
        echo "✅ Backup: $FILE -> $BACKUP_NAME"
    else
        echo "⚠️  ไม่พบไฟล์: $FILE"
    fi
done

# นับจำนวนไฟล์ที่ backup
COUNT=$(ls -1 $BACKUP_DIR | wc -l)
echo ""
echo "📊 สรุป: Backup ทั้งหมด $COUNT ไฟล์"

# ลบ backup เก่าที่เกิน 7 วัน
echo "🗑️  ลบ backup เก่าที่เกิน 7 วัน..."
find $BACKUP_DIR -name "*_backup_*" -mtime +7 -delete

echo "✅ Backup เสร็จสิ้น!"