#!/usr/bin/env bash
set -euo pipefail

# ---- Kernel requirement for Elasticsearch ----
echo "[*] Setting vm.max_map_count=262144"
sudo sysctl -w vm.max_map_count=262144
echo "vm.max_map_count=262144" | sudo tee /etc/sysctl.d/99-elasticsearch.conf >/dev/null
sudo sysctl --system >/dev/null

# ---- Create swap (2G) if none exists ----
if ! sudo swapon --show | grep -q 'partition\|file'; then
  echo "[*] Creating 2G swapfile at /swapfile"
  if ! sudo fallocate -l 2G /swapfile; then
    echo "[*] fallocate not available, using dd..."
    sudo dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
  fi
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  grep -q '/swapfile' /etc/fstab || echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab >/dev/null
else
  echo "[*] Swap already present, skipping."
fi

echo "[*] Host prerequisites complete."
free -h
