#!/bin/bash

# Function backup ไฟล์
backup_file() {
    SOURCE_FILE=$1
    BACKUP_DIR="backup"
    
    # สร้าง backup folder ถ้ายังไม่มี
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir "$BACKUP_DIR"
        echo "📁 สร้าง folder backup"
    fi
    
    # ตรวจสอบว่ามีไฟล์ต้นฉบับหรือไม่
    if [ ! -f "$SOURCE_FILE" ]; then
        echo "❌ ไม่พบไฟล์ $SOURCE_FILE"
        return 1  # return 1 = มีข้อผิดพลาด
    fi
    
    # สร้างชื่อไฟล์ backup พร้อมวันที่
    BACKUP_NAME="${SOURCE_FILE}_$(date +%Y%m%d_%H%M%S).bak"
    
    # ทำการ backup
    cp "$SOURCE_FILE" "$BACKUP_DIR/${BACKUP_NAME}"
    
    if [ $? -eq 0 ]; then
        echo "✅ Backup สำเร็จ $BACKUP_NAME"
        return 0  # return 0 = สำเร็จ
    else
        echo "❌ Backup ล้มเหลว"
        return 1
    fi
}

# ใช้งาน function
echo "=== เริ่มการ Backup ==="

backup_file "important.txt"
backup_file "database.db"
backup_file "config.conf"

echo "=== Backup เสร็จสิ้น ==="