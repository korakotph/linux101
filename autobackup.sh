#!/bin/bash

# Simple Daily Backup Script
# รันทุกวันเวลา 2:00 AM

# กำหนดค่าต่างๆ
BACKUP_DIR="./backup"
SOURCE_DIR="./important"
DATE=$(date +%Y%m%d)
KEEP_DAYS=7  # เก็บ backup 7 วัน

# Function แสดงข้อความ
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

log_message "🚀 เริ่ม Backup ประจำวัน"

# สร้าง backup directory
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    chmod 777 "$BACKUP_DIR"
    log_message "📁 สร้าง backup directory"
fi
if [ ! -d "$SOURCE_DIR" ]; then
    mkdir -p "$SOURCE_DIR"
    chmod 777 "$SOURCE_DIR"
    log_message "⚠️  สร้าง source directory $SOURCE_DIR อัตโนมัติ (ยังไม่มีไฟล์)"
fi

# สร้างชื่อไฟล์ backup
BACKUP_FILE="$BACKUP_DIR/backup_${DATE}.tar.gz"

# ทำการ backup
log_message "📦 กำลัง backup $SOURCE_DIR..."
tar czf "$BACKUP_FILE" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    SIZE=$(ls -lh "$BACKUP_FILE" | awk '{print $5}')
    log_message "✅ Backup สำเร็จ! ขนาด: $SIZE"
else
    log_message "❌ Backup ล้มเหลว!"
    exit 1
fi

# ลบ backup เก่าที่เกิน 7 วัน
log_message "🗑️  ลบ backup เก่า..."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$KEEP_DAYS -delete

log_message "✅ เสร็จสิ้น!"