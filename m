From: Whit Blauvelt <whit@transpect.com>
Subject: How might incoming SMB probes from public IPs be ariving on the
 internal interfaces?
Date: Fri, 22 Jul 2011 20:36:17 -0400
Message-ID: <20110723003617.GA17279@black.transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

We've been running iptables v1.3.8 happily for a few years, and just
recently noticed that someone was managing to get probes to a Samba server
(which sits on the firewall) through the firewall. Since the Samba server
only allows logins from LAN addresses, the attempted connections only have
been refused. Still, Samba seeing the requests at all what we expected. This
was a brand new thing in the last few weeks. (We keep our logs for a _long_
time.)

After adding extra rules to make double sure that the smbd/nmbd ports were
blocked on the external interfaces, there were still failed logins happening
from external IPs. So I blocked everything on the smbd/nmbd ports regardless
of interface. That did the trick. But it leaves open the mystery of how
probes are managing to come in on the wrong ports. For example:

Jul 22 19:40:56 firewall2 kernel: [15358673.237154] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.99 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16385 DF PROTO=TCP SPT=3303 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:56 firewall2 kernel: [15358673.631689] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.100 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16472 DF PROTO=TCP SPT=3342 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:57 firewall2 kernel: [15358673.924561] Samba TCP: IN=eth1 OUT= MAC=00:1e:0b:5e:16:fc:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.101 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16539 DF PROTO=TCP SPT=3366 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:57 firewall2 kernel: [15358674.359341] Samba TCP: IN=eth2 OUT= MAC=00:1c:c4:48:5e:4c:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.103 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16661 DF PROTO=TCP SPT=3447 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:57 firewall2 kernel: [15358674.577988] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.104 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16714 DF PROTO=TCP SPT=3478 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:58 firewall2 kernel: [15358674.845582] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.105 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16799 DF PROTO=TCP SPT=3503 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:58 firewall2 kernel: [15358675.118500] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.106 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=16872 DF PROTO=TCP SPT=3532 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:59 firewall2 kernel: [15358676.152236] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.99 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17145 DF PROTO=TCP SPT=3303 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:59 firewall2 kernel: [15358676.438063] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.109 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17192 DF PROTO=TCP SPT=3641 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:40:59 firewall2 kernel: [15358676.611885] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.100 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17228 DF PROTO=TCP SPT=3342 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:00 firewall2 kernel: [15358676.918421] Samba TCP: IN=eth1 OUT= MAC=00:1e:0b:5e:16:fc:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.101 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17311 DF PROTO=TCP SPT=3366 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:00 firewall2 kernel: [15358677.258672] Samba TCP: IN=eth2 OUT= MAC=00:1c:c4:48:5e:4c:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.103 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17435 DF PROTO=TCP SPT=3447 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:00 firewall2 kernel: [15358677.481513] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.104 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17487 DF PROTO=TCP SPT=3478 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:01 firewall2 kernel: [15358677.900259] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.105 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17586 DF PROTO=TCP SPT=3503 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:01 firewall2 kernel: [15358678.128048] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.106 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17653 DF PROTO=TCP SPT=3532 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:02 firewall2 kernel: [15358679.430171] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.109 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=17950 DF PROTO=TCP SPT=3641 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:03 firewall2 kernel: [15358680.551399] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.124 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=18279 DF PROTO=TCP SPT=4061 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:05 firewall2 kernel: [15358682.163911] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.99 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=18664 DF PROTO=TCP SPT=3303 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:05 firewall2 kernel: [15358682.611803] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.100 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=18744 DF PROTO=TCP SPT=3342 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:06 firewall2 kernel: [15358682.941205] Samba TCP: IN=eth1 OUT= MAC=00:1e:0b:5e:16:fc:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.101 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=18856 DF PROTO=TCP SPT=3366 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:06 firewall2 kernel: [15358683.255435] Samba TCP: IN=eth2 OUT= MAC=00:1c:c4:48:5e:4c:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.103 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=18960 DF PROTO=TCP SPT=3447 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:06 firewall2 kernel: [15358683.478190] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.104 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=19001 DF PROTO=TCP SPT=3478 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:06 firewall2 kernel: [15358683.578231] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.124 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=19013 DF PROTO=TCP SPT=4061 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:07 firewall2 kernel: [15358683.912897] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.105 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=19089 DF PROTO=TCP SPT=3503 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:07 firewall2 kernel: [15358684.122432] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.106 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=19136 DF PROTO=TCP SPT=3532 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:08 firewall2 kernel: [15358685.439300] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.109 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=19407 DF PROTO=TCP SPT=3641 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 
Jul 22 19:41:12 firewall2 kernel: [15358689.581183] Samba TCP: IN=eth5 OUT= MAC=00:1c:c4:48:5e:4e:00:0b:5f:fb:d0:80:08:00 SRC=206.126.124.39 DST=11.222.201.124 LEN=48 TOS=0x00 PREC=0x00 TTL=116 ID=20295 DF PROTO=TCP SPT=4061 DPT=445 WINDOW=65535 RES=0x00 SYN URGP=0 

To decode that, eth5 is an external interface, while eth1 and eth2 are
separate LANs. The (numbers altered here) "11.222.*" addresses are on eth5.
This is clearly a scan sequence, going over almost the same IPs in about the
same sequential order 3 times. But for two of the IPs in that sequence - the
same 2 each time - it looks to be coming in on eth1 and eth2 instead of
eth5.

This is the public-facing firewall. So how could these several probes show
up on the internal interfaces? (And these aren't the only ones. We're
getting them from IPs around the world.) Does this imply a compromised
internal machine that's relaying that part of the scan? Or some way to spoof
interfaces? It's new to us, and we've been running a stable firewall
configuration for a few years.

TIA,
Whit
