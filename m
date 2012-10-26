From: Kim Emax <kimemax@gmail.com>
Subject: 2 nics and traffic delayed/lost on LAN
Date: Fri, 26 Oct 2012 17:19:14 +0200
Message-ID: <CAG5MBdXsm-bD2diJKif3mF3p=h6YCfbV__SY55gjtas81ForqA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=kYcvqtvH/XlhWwP7TWPNJhaa0pN+GvaErv5/wU03A38=;
        b=hBYNYOLw0UETYJk7RZjdWvxk7dZh2YRVQsoG2AjBddPreGV1T+xu+HG+oxyZ3LvuZz
         F09LQ0hfV6BNrjmKV78yf8ylPO2LR9X7oQ7wt7AQ65alvSZ8FDuSUqJuDNu/VGgx5IbE
         bvGPlWTK1hQaa0wTwud3YOp2DLCbieAZx/pqLqhIsMj1bce6z8yI00tsF7VgZusJRufn
         h2G2Au6tPptvwCfJw16VK8xc4FhvQxCQS15ZwBFIJdecx3stY7eDnDhIlNLGy62G8Lvz
         2wXElmpPCUq7nmHW6N41/CJT6l5k7zmnyFZXDnv7mKaBM727iD9rFNFxcRgNOOk4o9om
         Fvjg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello

I have two nics and a DHCP server on my server (192.168.0.1), which
iptables controlled fine for years, but when i got a new job and
switched to a new server + started working through VPN i saw some
problems.
I'm having issues with the VPN, i can sit for like 10 minutes an try
to make a proper connection with Ciscos anyConnect against the company
network, getting all kinds of responses, often not even a connect
prompt. The local firewall has been disabled on this PC
192.168.0.132). If i plug this PC straight to the WAN instead of the
server, VPN works fine and fast.

It seems that the traffic on my internal network somehow is being
delayed, for instance SSH, i can wait for 30 seconds before the
keystrokes are shown on the screen. I don't recall that was an issue
before the VPN issue appeared.

Also there seems to be some packageloss, sending 10 packages from the
company PC at home to the server/gateway results in packageloss from
10 to 40%

Anyone got an idea for this? I've been trying to figure out the
problem for some time now and thought i had solved it some months ago,
but apparently not.
WAN is connected to eth0 and LAN to eth1
LAN is 192.168.0.0/24

chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
    0     0 LOG        tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            tcp dpt:22 state NEW recent: SET name: SSH side:
source LOG flags 0 level 7 prefix "iptables denied SSH: "
    0     0 DROP       tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            tcp dpt:22 state NEW recent: UPDATE seconds: 60
hit_count: 3 TTL-Match name: SSH side: source
    0     0 DROP       all  --  eth0   *       83.133.227.121
0.0.0.0/0
    0     0 DROP       all  --  eth0   *       82.96.90.170
0.0.0.0/0
    0     0 DROP       all  --  eth0   *       93.159.16.170
0.0.0.0/0
   22  7257 ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            state NEW multiport dports 20,21,22
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            multiport dports 22,80,4000,8080
    8  3134 ACCEPT     all  --  eth1   *       192.168.0.0/24
0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       212.97.132.102
0.0.0.0/0            tcp dpt:3306
    0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0            udp spt:68 dpt:67
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            udp spt:67 dpt:68
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0            tcp dpt:80
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0            tcp dpt:8080
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            tcp dpt:443
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            udp dpt:443
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0            tcp dpt:443
    0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0            udp dpt:443
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            tcp dpts:6891:6901
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0            udp dpts:6891:6901
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 ACCEPT     tcp  --  eth1   *       192.168.0.0/24
192.168.0.0/24       tcp spts:1024:65535 dpt:139
    0     0 ACCEPT     tcp  --  eth1   *       192.168.0.0/24
192.168.0.0/24       tcp spts:1024:65535 dpt:445
    0     0 ACCEPT     udp  --  eth1   *       192.168.0.0/24
192.168.0.0/24       udp spts:1024:65535 dpts:137:138
    0     0 ACCEPT     udp  --  eth1   *       192.168.0.0/24
192.168.0.0/24       udp spts:137:138 dpts:137:138
    0     0 ACCEPT     tcp  --  eth1   *       192.168.0.0/24
192.168.0.0/24       tcp spt:139 dpt:139
    0     0 ACCEPT     tcp  --  eth1   *       192.168.0.0/24
192.168.0.0/24       tcp spt:445 dpt:445

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      *       192.168.0.0/24
0.0.0.0/0
    0     0 REJECT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            reject-with icmp-port-unreachable

Chain OUTPUT (policy ACCEPT 9 packets, 630 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  *      lo      0.0.0.0/0
0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       212.97.132.102
0.0.0.0/0            tcp dpt:3306
   17  2481 ACCEPT     tcp  --  *      eth0    0.0.0.0/0
0.0.0.0/0            tcp dpt:443
    0     0 ACCEPT     udp  --  *      eth0    0.0.0.0/0
0.0.0.0/0            udp dpt:443
    0     0 ACCEPT     tcp  --  *      eth1    0.0.0.0/0
0.0.0.0/0            tcp dpt:443
    0     0 ACCEPT     udp  --  *      eth1    0.0.0.0/0
0.0.0.0/0            udp dpt:443
    0     0 ACCEPT     tcp  --  *      *       192.168.0.0/24
192.168.0.0/24       tcp spt:139 dpts:1024:65535
    0     0 ACCEPT     tcp  --  *      *       192.168.0.0/24
192.168.0.0/24       tcp spt:445 dpts:1024:65535
    0     0 ACCEPT     udp  --  *      *       192.168.0.0/24
192.168.0.0/24       udp spts:137:138 dpts:1024:65535
    0     0 ACCEPT     udp  --  *      *       192.168.0.0/24
192.168.0.0/24       udp spts:137:138 dpts:137:138
    0     0 ACCEPT     tcp  --  *      *       192.168.0.0/24
192.168.0.0/24       tcp spt:139 dpt:139
    0     0 ACCEPT     tcp  --  *      *       192.168.0.0/24
192.168.0.0/24       tcp spt:445 dpt:445

******************************
***************************'
I also tried another approach, building a new FW from scratch with a
online configurator, same problem:
# iptables rules created with Easy firewall generator:
http://easyfwgen.morizot.net/gen/index.php

Chain INPUT (policy DROP 62500 packets, 17M bytes)
 pkts bytes target     prot opt in     out     source
destination
74779   57M ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
  15M   13G bad_packets  all  --  *      *       0.0.0.0/0
0.0.0.0/0
 5581  179K DROP       all  --  *      *       0.0.0.0/0
224.0.0.1
1064K  206M ACCEPT     all  --  eth1   *       192.168.0.0/24
0.0.0.0/0
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.255
  402  171K ACCEPT     udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0            udp spt:68 dpt:67
  14M   13G ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0            state RELATED,ESTABLISHED
 7810  425K tcp_inbound  tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0
71472   18M udp_inbound  udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0
    0     0 icmp_packets  icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0
    2   338 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0            PKTTYPE = broadcast
20243 4239K LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0            limit: avg 3/min burst 3 LOG flags 0 level 4
prefix "INPUT packet died: "

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
5214K 4815M bad_packets  all  --  *      *       0.0.0.0/0
0.0.0.0/0
1700K  161M tcp_outbound  tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0
 109K   12M udp_outbound  udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0
17426  795K ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0
3367K 4640M ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0            state RELATED,ESTABLISHED
    8   408 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
192.168.0.132        tcp dpt:443
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0            limit: avg 3/min burst 3 LOG flags 0 level 4
prefix "FORWARD packet died: "

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       icmp --  *      *       0.0.0.0/0
0.0.0.0/0            state INVALID
46773   49M ACCEPT     all  --  *      *       127.0.0.1
0.0.0.0/0
28006 8207K ACCEPT     all  --  *      lo      0.0.0.0/0
0.0.0.0/0
1424K 1753M ACCEPT     all  --  *      *       192.168.0.1
0.0.0.0/0
    0     0 ACCEPT     all  --  *      eth1    0.0.0.0/0
0.0.0.0/0
  12M   11G ACCEPT     all  --  *      eth0    0.0.0.0/0
0.0.0.0/0
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0            limit: avg 3/min burst 3 LOG flags 0 level 4
prefix "OUTPUT packet died: "

Chain bad_packets (2 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        all  --  eth0   *       192.168.0.0/24
0.0.0.0/0            LOG flags 0 level 4 prefix "Illegal source: "
    0     0 DROP       all  --  eth0   *       192.168.0.0/24
0.0.0.0/0
26482 1367K LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0            state INVALID LOG flags 0 level 4 prefix "Invalid
packet: "
26482 1367K DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0            state INVALID
  18M   18G bad_tcp_packets  tcp  --  *      *       0.0.0.0/0
   0.0.0.0/0
  20M   18G RETURN     all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain bad_tcp_packets (1 references)
 pkts bytes target     prot opt in     out     source
destination
2304K  200M RETURN     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0
    1    52 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags:! 0x17/0x02 state NEW LOG flags 0 level
4 prefix "New not syn: "
    1    52 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags:! 0x17/0x02 state NEW
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x00 LOG flags 0 level 4 prefix
"Stealth scan: "
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x00
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x3F LOG flags 0 level 4 prefix
"Stealth scan: "
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x3F
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x29 LOG flags 0 level 4 prefix
"Stealth scan: "
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x29
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x37 LOG flags 0 level 4 prefix
"Stealth scan: "
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x3F/0x37
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x06/0x06 LOG flags 0 level 4 prefix
"Stealth scan: "
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x06/0x06
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x03/0x03 LOG flags 0 level 4 prefix
"Stealth scan: "
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x03/0x03
  16M   17G RETURN     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain icmp_packets (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        icmp -f  *      *       0.0.0.0/0
0.0.0.0/0            LOG flags 0 level 4 prefix "ICMP Fragment: "
    0     0 DROP       icmp -f  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 DROP       icmp --  *      *       0.0.0.0/0
0.0.0.0/0            icmptype 8
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0            icmptype 11
    0     0 RETURN     icmp --  *      *       0.0.0.0/0
0.0.0.0/0

Chain tcp_inbound (1 references)
 pkts bytes target     prot opt in     out     source
destination
 1337 79448 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:443
    1    52 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:21
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp spt:20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpts:62000:64000
 5981  322K ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:22
  491 23332 RETURN     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain tcp_outbound (1 references)
 pkts bytes target     prot opt in     out     source
destination
1700K  161M ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain udp_inbound (1 references)
 pkts bytes target     prot opt in     out     source
destination
 9160  714K DROP       udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp dpt:137
 3427  757K DROP       udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp dpt:138
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp spt:67 dpt:68
58885   17M RETURN     udp  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain udp_outbound (1 references)
 pkts bytes target     prot opt in     out     source
destination
 109K   12M ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0


--
Take care
Kim Emax
http://emax.dk
