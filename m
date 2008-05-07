From: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>
Subject: RE: accept rule not working.
Date: Thu, 8 May 2008 00:25:46 +0300 (IDT)
Message-ID: <200805072125.m47LPku7018772@indigo.cs.bgu.ac.il>
References: <001101c8b057$23a5c950$6af15bf0$@info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001101c8b057$23a5c950$6af15bf0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org


On Wed 07 May 18:29 2008 Rob Sterenborg wrote:
> > I've created this rule:
> > /sbin/iptables -A INPUT -i eth0 -p tcp -m state --state NEW --sport
> > 80 -s 192.168.113.94 -j ACCEPT
> > 
> > but the firewall still blocks it, I guess there is a typo somewhere
> > but I cant seem to be able to find it any hints?
> 
> Since the packets are still dropped, either the rule doesn't match the packets you expect it to match, or another blocking rule matches before it can be accepted by this one.
> 
> Also, you're using "--sport 80". Are you sure the packets are COMING FROM source port 80 instead of GOING TO port 80 (--dport 80)?
> 
> 
> Grts,
> Rob
> 
> 
> 

both mangle and raw return this:
FATAL: Module ip_tables not found.
iptables v1.3.8: can't initialize iptables table `mangle': Table does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

iptables -t nat -vnL
Chain PREROUTING (policy ACCEPT 32M packets, 3282M bytes)
pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 2990K packets, 215M bytes)
pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 2991K packets, 215M bytes)
pkts bytes target     prot opt in     out     source               destination

Chain INPUT (policy DROP 240 packets, 23748 bytes)
pkts bytes target     prot opt in     out     source               destination
1468 1977K ACCEPT     all  --  *      *       127.0.0.1            0.0.0.0/0  
607K  804M ACCEPT     all  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
   0     0 ACCEPT     tcp  --  eth0   *       192.168.113.94       0.0.0.0/0           state NEW tcp spt:80
   0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            255.255.255.255     state NEW udp dpt:67
   0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            255.255.255.255     state NEW udp dpt:68
2141  321K ACCEPT     udp  --  eth0   *       0.0.0.0/0            255.255.255.255     state NEW udp dpt:2222
   0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            255.255.255.255     state NEW udp dpt:2223
   0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW udp dpt:6111
   9   666 ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW udp dpt:161
1047 37692 ACCEPT     icmp --  eth0   *       192.168.111.249      0.0.0.0/0           icmp type 8 state NEW
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:21
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:443
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:80
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:873
   0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW udp dpt:873
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpts:6881:6886
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            192.168.114.0/20     state NEW tcp dpt:135
186K   21M ACCEPT     udp  --  eth0   *       0.0.0.0/0            192.168.114.0/20     state NEW udp dpts:137:139
3249  160K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            192.168.114.0/20     state NEW tcp dpts:137:139
   0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            192.168.114.0/20     state NEW tcp dpt:426
   9   436 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            192.168.114.0/20     state NEW tcp dpt:445
   8  2225 DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp flags:!0x17/0x02 state NEW
   0     0 DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp flags:0x3F/0x3F
   0     0 DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp flags:0x3F/0x00
   0     0 LOG        all  -f  eth0   *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `IPTABLES FRAGMENTS: '
   0     0 DROP       all  -f  eth0   *       0.0.0.0/0            0.0.0.0/0  
 930  574K LOG        all  --  eth0   *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `Rejected: '
 930  574K REJECT     all  --  eth0   *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable

rejection log example:
Rejected: IN=eth0 OUT= MAC=mymacaddress SRC=192.168.113.94 DST=192.168.114.2 LEN=40 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=80 DPT=59173 WINDOW=0 RES=0x00 RST URGP=0



