From: Douglas Rabe <drabe@sensis.com>
Subject: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 13:11:37 -0400 (EDT)
Message-ID: <200806181711.m5IHBbkX023710@doug.ats.sensis.com>
Reply-To: drabe@sensis.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings,

I dont understand why this traffic is dropped?

Jun 18 17:03:39 iahabs1 kernel: IN_DROP: IN=eth0 OUT= MAC=00:1c:23:ca:ec:1d:00:1b:53:87:68:c0:08:00 SRC=10.192.130.104 DST=192.168.51.1 LEN=40 TOS=0x00 PREC=0x00 TTL=119 ID=5563 DF PROTO=TCP SPT=35557 DPT=80 WINDOW=65149 RES=0x00 ACK FIN URGP=0 

iahabs1:~# iptables -nvL
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 337M   82G ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED 
 8747  559K ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW icmp type 8 
  19M 2104M ACCEPT     0    --  lo     *       0.0.0.0/0            0.0.0.0/0           
14686  450K ACCEPT     2    --  eth0   *       0.0.0.0/0            224.0.0.0/8         
26049 2169K ACCEPT     0    --  eth1   *       0.0.0.0/0            0.0.0.0/0           
37255 1790K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW multiport dports 80,30001 
9068K  602M ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW multiport dports 3210 
    0     0 ACCEPT     tcp  --  eth3   *       0.0.0.0/0            0.0.0.0/0           state NEW multiport dports 80,30001 
   91  3640 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `IN_DROP: ' 
   91  3640 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0           state INVALID LOG flags 0 level 4 prefix `FWD_INVAL: ' 
    0     0 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           state INVALID 
    0     0 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `FWD_DROP: ' 
    0     0 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 323M  271G ACCEPT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED 
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW icmp type 8 
  19M 2104M ACCEPT     0    --  *      lo      0.0.0.0/0            0.0.0.0/0           
 9792  313K ACCEPT     2    --  *      eth0    0.0.0.0/0            224.0.0.0/8         
 1020 69064 ACCEPT     0    --  *      eth1    0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW udp dpts:33435:33535 
    1    60 ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           state NEW multiport dports 22,30035 
60639 4487K ACCEPT     udp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           state NEW multiport dports 53 
   12  4332 LOG        0    --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `OUT_DROP: ' 
   12  4332 DROP       0    --  *      *       0.0.0.0/0            0.0.0.0/0           
iahabs1:~# 

-- 
Douglas Rabe
drabe@sensis.com
315-234-7995
