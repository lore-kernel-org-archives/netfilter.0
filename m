From: Marcel Partap <mpartap@gmx.net>
Subject: strange NAT/masquerading problem with dhcp over linksys switch (one
 NIC)
Date: Tue, 25 Nov 2008 07:23:59 +0100
Message-ID: <492B99FF.7020703@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi folks,
to be able to work from home i received a laptop from my company 
(configured to use DHCP - no admin rights so that can't be changed) and 
a linksys 8-port switch. After RTFM i tried and set up dhcpd

/etc/dhcp/dhcpd.conf:
default-lease-time 60000;
max-lease-time 72000;
ddns-update-style none;
authoritative;
log-facility local7;
subnet 192.168.42.0 netmask 255.255.255.0 {
  range 192.168.42.2 192.168.42.254;
  option domain-name-servers 134.130.4.1, 137.226.149.1;
  option broadcast-address 192.168.42.255;
  option routers 192.168.42.1, 137.226.148.1;
  option subnet-mask 255.255.255.0;
}
and iptables

# iptables -vL -t filter
Chain INPUT (policy ACCEPT 348K packets, 375M bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain FORWARD (policy DROP 726 packets, 45138 bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 ACCEPT     all  --  any    any     192.168.42.0         anywhere

Chain OUTPUT (policy ACCEPT 268K packets, 19M bytes)
 pkts bytes target     prot opt in     out     source               
destination
Code:

# iptables -vL -t mangle
Chain PREROUTING (policy ACCEPT 354K packets, 375M bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain INPUT (policy ACCEPT 348K packets, 375M bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain FORWARD (policy ACCEPT 726 packets, 45138 bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 269K packets, 19M bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain POSTROUTING (policy ACCEPT 269K packets, 19M bytes)
 pkts bytes target     prot opt in     out     source               
destination
Code:

# iptables -vL -t nat
Chain PREROUTING (policy ACCEPT 13108 packets, 1430K bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain POSTROUTING (policy ACCEPT 8414 packets, 534K bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 MASQUERADE  all  --  any    eth0    192.168.42.0         
anywhere

Chain OUTPUT (policy ACCEPT 8462 packets, 537K bytes)
 pkts bytes target     prot opt in     out     source               
destination

but the result is not satisfying. The problem is that when i connect the 
laptop XP keeps saying 'Acquiring network address' while dhcpd is 
spamming syslog by looping
dhcpd: DHCPDISCOVER from 00:0b:db:07:50:3d (ac-nb-partap) via eth0
dhcpd: DHCPOFFER on 192.168.1.2 to 00:0b:db:07:50:3d (ac-nb-partap) via eth0
dhcpd: DHCPREQUEST for 192.168.1.2 (137.226.149.42) from 
00:0b:db:07:50:3d (ac-nb-partap) via eth0
dhcpd: DHCPACK on 192.168.1.2 to 00:0b:db:07:50:3d (ac-nb-partap) via eth0

..but the strange thing is, when i unplug the LAN cable from the switch, 
dhcp acquiring and pinging the workstation IPs starts to work - no 
internet of course!
what could be the problem here? they really want me to do some work on 
the internal wiki system ASAP so any help will be highly appreciated.
regards marcel

-- 
 "Obstacles are those frightful things you see when you take
  your eyes off your goal."         -- Henry Ford (1863-1947)

  Change the world! Vote: http://hfopi.org/vote-future

