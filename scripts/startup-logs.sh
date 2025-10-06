#!/usr/bin/env bash
set -e
LOG_DIR="/workspace/logs"
mkdir -p "$LOG_DIR"
mkdir -p /workspace/logs
echo "🚀 Codespace startup at $(date)" > "$LOG_DIR/startup.log"
echo "▶ Checking frontend (Vite / React)" >> "$LOG_DIR/startup.log"
if lsof -i:3000 >/dev/null 2>&1; then echo "✅ Port 3000 active" >> "$LOG_DIR/startup.log"; else echo "❌ Port 3000 inactive" >> "$LOG_DIR/startup.log"; fi
echo "▶ Checking backend (Laravel / PHP)" >> "$LOG_DIR/startup.log"
if lsof -i:8000 >/dev/null 2>&1; then echo "✅ Port 8000 active" >> "$LOG_DIR/startup.log"; else echo "❌ Port 8000 inactive" >> "$LOG_DIR/startup.log"; fi
if [ -f "apps/api/storage/logs/laravel.log" ]; then tail -n 20 "apps/api/storage/logs/laravel.log" >> "$LOG_DIR/startup.log"; else echo "ℹ️ Laravel log not found yet" >> "$LOG_DIR/startup.log"; fi
if [ -f "$LOG_DIR/vite.log" ]; then tail -n 20 "$LOG_DIR/vite.log" >> "$LOG_DIR/startup.log"; else echo "ℹ️ vite.log not found yet" >> "$LOG_DIR/startup.log"; fi
echo "✅ Startup diagnostic finished" >> "$LOG_DIR/startup.log"
chmod +x scripts/startup-logs.sh
