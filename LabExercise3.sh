#!/bin/bash

backup_files() {
    echo "🔄 เริ่ม Backup..."
    echo "==============================="

    # 1. กำหนดตัวแปร (ใช้โฟลเดอร์ภายใน workspace)
    SOURCE_DIR="./backup"   # <-- สร้างโฟลเดอร์นี้และใส่ไฟล์ที่ต้องการ backup
    BACKUP_DIR="./backup-auto"      # <-- เก็บ backup ใน project folder
    DATE=$(date +%Y%m%d_%H%M%S)

    # 2. สร้าง backup directory ถ้ายังไม่มี
    mkdir -p "$BACKUP_DIR"

    # 3. ทำการ backup ด้วย tar
    BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"
    if tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .; then
        echo "✅ Backup สำเร็จ: $BACKUP_FILE"
    else
        echo "❌ Backup ล้มเหลว!"
        return 1
    fi

    # 4. ลบ backup เก่าเกิน 7 วัน
    find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm -f {} \;
    echo "🗑️ ลบไฟล์ backup เก่าเกิน 7 วันเรียบร้อย"

    echo "==============================="
    echo "🔄 Backup เสร็จสิ้น"
}

# เรียกใช้ function
backup_files
