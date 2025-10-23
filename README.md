# 🧩 ELK Stack

A **lightweight, secure** Elasticsearch + Logstash + Kibana setup using **Docker Compose** — optimized for small EC2 instances and remote agents (Filebeat, Metricbeat, Suricata).

---

## 🚀 What’s Inside

| Component       | Role | Default Port |
|-----------------|------|--------------|
| **Elasticsearch** | Central data store | `9200` |
| **Logstash**      | Receives logs from remote Filebeat agents | `5044` |
| **Kibana**        | Web UI for visualization | `5601` |

---

## ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/Belalgit/elk-installation-docker.git

# Enter the project directory
sudo mv elk-installation-docker/ /var/www/example.com
cd /var/www/example.com/

# Prepare host dependencies (Docker, volumes, sysctl tuning)
sudo apt install make 
make host-bootstrap

# Start the ELK stack
make up


Once running:
Kibana Dashboard: http://<EC2_PUBLIC_IP>:5601


**🧠 Notes**
Designed for ARM64/AMD64 EC2 instances
Tested with Filebeat, Metricbeat, and Suricata agents
Includes sane defaults for memory, ILM, and pipeline management
Production-ready security (credentials + network isolation)

**🛠️ Optional Integrations**
Filebeat → /var/log/nginx, /var/log/syslog
Metricbeat → host metrics
Suricata → network IDS logs

📂 Directory Structure
ELK-essentials-/
├── docker-compose.yml
├── stack/
│   ├── elasticsearch/
│   ├── logstash/
│   └── kibana/
├── scripts/
│   ├── host-bootstrap.sh
│   └── cleanup.sh
└── docs/
    └── operations.md
