# SSL Certificate Expiry Monitoring for Zabbix

It provides a Bash script and a Zabbix 6.0 template to monitor SSL certificate expiration dates for given hostnames from Zabbix server. Alerts will be triggered based on how close the certificate is to expiring.

## ️Installation Instructions

### 1. Copy the Script

Place the `ssl_expiry_check.sh` script into Zabbix's external script directory (usually ```/usr/lib/zabbix/externalscripts/```):

```
sudo cp ssl_expiry_check.sh /usr/lib/zabbix/externalscripts/
sudo chmod +x /usr/lib/zabbix/externalscripts/ssl_expiry_check.sh
```
Check if the script works: 
run ```/usr/lib/zabbix/externalscripts/ssl_expiry_check.sh yourdomain```

### 2. Import the Template

1. Log in to the Zabbix frontend.
2. Go to Configuration → Templates → Import.
3. Upload the provided YAML file (e.g., zbx_ssl_expiry_template.yaml).
4. Click Import and ensure all checkboxes are selected.

### 3. Link the Template to Hosts

1. Go to Configuration → Hosts.
2. Choose the host you want to monitor.
3. Go to the Templates tab.
4. Click Link new templates and choose ```SSL Certificate Expiry```.
