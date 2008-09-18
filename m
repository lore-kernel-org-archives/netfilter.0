From: Brent Clark <brentgclarklist@gmail.com>
Subject: marking is not working out my eth0 interface
Date: Thu, 18 Sep 2008 12:07:13 +0200
Message-ID: <48D22851.4080601@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

I dont know if its a state of panic or what, I rebooted my FW, and the 
next thing I know marking is not working

#here i do marking

/usr/local/sbin/iptables -t mangle -A PREROUTING -i eth1 -p tcp -m 
multiport --dport 8080,8087,993,22,80,443 -s 192.168.111.0/24 -j MARK 
--set-mark 0x1

#heres the result (OUT, should be eth2)
Sep 18 11:51:22 cptgate kernel: [ 2915.617078] [FORWARD  DROP]: IN=eth1 
OUT=eth0 SRC=192.168.111.9 DST=66.102.9.127 LEN=60 TOS=0x00 PREC=0x00 
TTL=63 ID=52056 DF PROTO=TCP SPT=41618 DPT=80 WINDOW=5840 RES=0x00 SYN 
URGP=0 MARK=0x1

#My entry in the rt_table
root@gate:/root/iptables_sub_scripts# cat /etc/iproute2/rt_tables
#
# reserved values
#
255    local
254    main
253    default
0    unspec
#
# local
#
#1    inr.ruhep
201    TELKOM

root@gate:/root/iptables_sub_scripts# ip rule list
0:    from all lookup local
32765:    from all fwmark 0x1 lookup TELKOM
32766:    from all lookup main
32767:    from all lookup default

# My entry for iptables
/usr/local/sbin/iptables -t filter -A FORWARD -i eth1 -o eth2 -p tcp -s 
192.168.111.9 -m multiport --dport 80,443,8087 -m state --state NEW -j 
ACCEPT

#sysctl.conf
net.ipv4.ip_forward=1
