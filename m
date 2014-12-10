From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Problem setting up nftables dnat : dport set to 0 instead of requested
 value (22)
Date: Wed, 10 Dec 2014 15:39:04 +0100
Message-ID: <54885B08.1010700@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Cc: GUITTON Alex <alex.guitton@c-s.fr>

Hi,

I'm trying to redirect incoming tcp connections for port 222 to local 
port 22 (because I will dnat incoming connections for port 22 to another 
destination).
I've set the following ruleset, and logs shows that the port get value 0 
instead of 22.

What am I doing wrong ?

Thanks
Christophe

[ 7621.325382] IN=eth0 OUT= 
MAC=08:00:51:20:44:5b:08:00:27:fe:42:1e:08:00 SRC=172.25.231.37 
DST=172.25.231.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=18010 DF PROTO=TCP 
SPT=54872 DPT=222 WINDOW=14600 RES=0x00 SYN URGP=0
[ 7621.325785] IN=eth0 OUT= 
MAC=08:00:51:20:44:5b:08:00:27:fe:42:1e:08:00 SRC=172.25.231.37 
DST=172.25.231.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=18010 DF PROTO=TCP 
SPT=54872 DPT=0 WINDOW=14600 RES=0x00 SYN URGP=0

# nft list ruleset -nn
table ip filter {
         chain input {
                  type filter hook input priority 0;
                  oifname "lo" accept
                  ct state established,related accept
                  ct state new tcp dport 22 log accept
                  ip protocol icmp accept
                  udp dport { 138, 1534, 137, 17500, 67, 631, 68} drop
                  log reject with icmp type host-prohibited
         }
}
table ip nat {
         chain prerouting {
                  type nat hook prerouting priority 0;
                  tcp dport 222 counter packets 1 bytes 60 log dnat :22
         }

         chain postrouting {
                  type nat hook postrouting priority 0;
                  ip saddr 192.168.0.3 oif eth1 masquerade
         }
}

