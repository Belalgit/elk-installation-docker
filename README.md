**ELK Stack**

A lightweight, secure Elasticsearch + Logstash + Kibana setup using Docker Compose.
Optimized for small EC2 instances and remote Filebeat/Metricbeat/Suricata agents.

What’s Inside
Elasticsearch → data store (internal port 9200)
Logstash → receives logs from remote Filebeat agents (port 5044)
Kibana → web UI for visualization (port 5601)
Quick Start
git clone https://github.com/InfraVsionary/ELK-essentials-.git
cd ELK-essentials-
make host-bootstrap
make up
- Kibana → [http://<EC2_PUBLIC_IP>:5601]
