From: Alfonso Ortega <alfonso@micasaverde.com>
Subject: DNAT seems to be working, but nothing goes out on the wire.
Date: Wed, 30 Jun 2010 17:55:20 -0700
Message-ID: <2E25EA97-7A28-49D5-947A-F6ABEC235321@micasaverde.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Aaron Bergen <aaron@micasaverde.com>

Ok, I'm at a loss here. I've tried tutorials, IRC, forums, and now i'm turning to the iptables mailing list to see if I can find some kind of resolution.

What I'm trying to do is to get iptables to act as a sort of transparent proxy using NAT and forward packets sent to the gateway(ip of 192.168.2.37) on port 5000 to another device on port 80.


In my nat table, I have these chains defining the DNAT behavior:
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
prerouting_rule  all  --  anywhere             anywhere            
prerouting_wan  all  --  anywhere             anywhere   
Chain prerouting_rule (1 references)
target     prot opt source               destination         
LOG        tcp  --  anywhere             anywhere            tcp dpt:5000 LOG level warning prefix `prerouting_rule hit: ' 

Chain prerouting_wan (1 references)
target     prot opt source               destination         
DNAT       tcp  --  anywhere             anywhere            multiport dports 5000 to:192.168.2.31:80 
DNAT       udp  --  anywhere             anywhere            multiport dports 5000 to:192.168.2.31:80 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
postrouting_rule  all  --  anywhere             anywhere            
LOG        all  --  anywhere             192.168.2.31        LOG level warning prefix `POSTROUTING: ' 
ACCEPT     all  --  anywhere             anywhere  


in my filter table, I have these chains that the packet hits:
Chain FORWARD (policy DROP)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            state INVALID 
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED 
forwarding_rule  all  --  anywhere             anywhere            
forwarding_wan  all  --  anywhere             anywhere   

Chain forwarding_rule (1 references)
target     prot opt source               destination         

Chain forwarding_wan (1 references)
target     prot opt source               destination         
LOG        all  --  anywhere             192.168.2.31        LOG level warning prefix `forwarding_wan hit with: ' 
ACCEPT     tcp  --  anywhere             192.168.2.31        tcp dpt:80 
ACCEPT     udp  --  anywhere             192.168.2.31        udp dpt:80 


when I do a logread -f, and attempt to access 192.168.2.37:5000(the aforementioned gateway), i see:
logread -f
Jun 30 17:47:41 (none) user.warn kernel: prerouting_rule hit: IN=eth0.1 OUT= MAC=00:c0:02:9f:91:c9:00:1a:92:e5:e5:d6:08:00:45:00:00:40 SRC=192.168.2.111 DST=192.168.2.37 LEN=64 TOS=0x00 PREC=0x00 TTL=128 ID=56724 DF PROTO=TCP SPT=2030 DPT=5000 WINDOW=65535 RES=0x00 SY
Jun 30 17:47:41 (none) user.warn kernel: forwarding_wan hit with: IN=eth0.1 OUT=eth0.1 SRC=192.168.2.111 DST=192.168.2.31 LEN=64 TOS=0x00 PREC=0x00 TTL=127 ID=56724 DF PROTO=TCP SPT=2030 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0 
Jun 30 17:47:41 (none) user.warn kernel: POSTROUTING: IN= OUT=eth0.1 SRC=192.168.2.111 DST=192.168.2.31 LEN=64 TOS=0x00 PREC=0x00 TTL=127 ID=56724 DF PROTO=TCP SPT=2030 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0 
Jun 30 17:47:44 (none) user.warn kernel: forwarding_wan hit with: IN=eth0.1 OUT=eth0.1 SRC=192.168.2.111 DST=192.168.2.31 LEN=64 TOS=0x00 PREC=0x00 TTL=127 ID=56729 DF PROTO=TCP SPT=2030 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0 
Jun 30 17:47:50 (none) user.warn kernel: forwarding_wan hit with: IN=eth0.1 OUT=eth0.1 SRC=192.168.2.111 DST=192.168.2.31 LEN=64 TOS=0x00 PREC=0x00 TTL=127 ID=56780 DF PROTO=TCP SPT=2030 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0 


doing a tcpdump on eth0.1 shows that the packets seem to be going out, but when I sniff the wire with wireshark I don't see anything.
17:49:07.487586 IP 192.168.2.111.2042 > 192.168.2.37.5000: S 3414273544:3414273544(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 0 0,nop,nop,sackOK>
17:49:07.547964 IP 192.168.2.111.2042 > 192.168.2.31.80: S 3414273544:3414273544(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 0 0,nop,nop,sackOK>


Can anyone give me some sort of hint as to why the packets aren't actually getting sent out? Sorry if this is a lot of text, but it should be all of the relevant information ot the situation. If you need anything else, I can provide it.

Thanks in advance,
Alfonso