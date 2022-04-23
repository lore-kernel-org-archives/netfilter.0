From: Computer Planet <amministrazione@cpnetserver.net>
Subject: NFTABLES - BRIDGE TRANSPARENT FIREWALL
Date: Sat, 23 Apr 2022 19:31:25 +0200
Message-ID: <91c15afc52b35e8eaff4818fd119b351@cpnetserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Guys, I need Your help!
Pablo Neira Ayuso, about the question, suggested that I turn to you.
I tried to ask in some chat, but to no avail.
My question is: "
Having this setup: a Bridge [br0] that included 4 NIC [eth0 - eth1 -eth2 - eth3], 
How can I block traffic between eth2 and eth3?
Let me explain better, eth2 and eth3 must be able to communicate with all other Network Interface Cards, except between them.
What command should I add in the nftables configuration?
As simple as it seems, in no formum/chat I was able to get an answer.
In the hope that you can help me, thank you in advance for your reply.
"
------------- NETWORK CONFIGURATION --------------
auto lo br0
iface lo inet loopback

iface br0 inet static 
  bridge_ports eth0 eth1 eth2 eth3
     address 192.168.2.139
     subnet  255.255.255.0
     broadcast 192.168.2.255
     network 192.168.2.0
     gateway 192.168.2.1 
     
/proc/sys/net/ipv4/ip_forward = 1
--------------------------------------------------

------------------------- INFO ABOUT ALL ADDRESSES AND NIC -------------------------------
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master br0 state UP group default qlen 1000
    link/ether 50:3e:aa:14:43:da brd ff:ff:ff:ff:ff:ff
    altname enp2s0
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master br0 state UP group default qlen 1000
    link/ether e8:48:b8:ca:69:93 brd ff:ff:ff:ff:ff:ff
    altname enp3s0
4: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master br0 state UP group default qlen 1000
    link/ether 18:a6:f7:00:1c:9e brd ff:ff:ff:ff:ff:ff
    altname enp5s6
5: eth3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master br0 state UP group default qlen 1000
    link/ether f4:6d:04:06:4e:40 brd ff:ff:ff:ff:ff:ff
    altname enp4s0
6: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 9e:1e:32:bb:44:68 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.139/24 brd 192.168.2.255 scope global br0
       valid_lft forever preferred_lft forever
    inet6 fe80::9c1e:32ff:febb:4468/64 scope link 
       valid_lft forever preferred_lft forever
------------------------------------------------------------------------------------------

------------------------------- NFTABLES CONFIGURATION -----------------------------------
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
        chain input { 
                type filter hook input priority 0;
                tcp dport {22,443} ip saddr 192.168.2.2 accept;
                tcp dport 22 ip saddr node51.net accept;
                ip saddr 192.168.2.2 drop;
        }
        chain forward { 
                type filter hook forward priority 0;
        }
        chain output {
                type filter hook output priority 0;
        }
}

table bridge filter {
        chain forward { type filter hook forward priority 0;
                ip saddr 192.168.2.0/24 tcp dport 22 ip daddr 192.168.2.91 drop;
        }
}
------------------------------------------------------------------------------------------
________________________________
Computer Planet
di Ernesto Bellomusto
P.zza Garibaldi, 7
87018 San Marco Argentano (Cosenza) - ITALY
Tel.:  0984.513469
Cell: 329.9520409

