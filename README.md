# DamnSmallScan
Compact and detailed nmap scanner.

# Download
```bash
wget https://raw.githubusercontent.com/Menesay/DamnSmallScan/refs/heads/main/damnsmallscan.sh
chmod +x damnsmallscan.sh
```

# Run
```bash
./damnsmallscan.sh 1.3.3.7
```

***

## HIW

First, open ports are identified, then an aggressive scan is performed on those ports.

### 1. Detect open ports and save them to `openservices.txt`:

```bash
sudo nmap --min-rate 10000 10.10.10.10 -p- | grep open > openservices.txt
```

### 2. Extract only the port numbers from `openservices.txt` and save them to `openports.txt`:

```bash
cat openservices.txt | sed 's/\// /g' | awk '{print $1}' | tr "\n" "," | sed 's/,$//' > openports.txt
```

### 3. Perform a detailed scan on the discovered ports:

```bash
sudo nmap -v -sVC 192.168.1.1 -p $(cat openports.txt) | tee nmap.txt
```

---


