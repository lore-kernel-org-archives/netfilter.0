From: iptables@trodman.com
Subject: basic NAT/masquerading setup
Date: Thu, 19 Sep 2013 11:36:30 -0500
Message-ID: <201309191636.r8JGaUsc027762@localhost.localdomain>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello:

I'm trying to set up simple NAT/masquerading on a dual NIC host
(hostname == "psi") running fedora 19, so hosts on my LAN can access
Internet by routing thru host "psi".

Interface p1p1 is on my LAN, p2p1 is on Internet.

I got the "design" of below /etc/iptables from another of my older (fedora core 10) hosts,
where NAT/masquerading works fine.

Everything but the NAT/masquerading works.  
On one of my LAN windows hosts named 'neon' I changed the default route point to host "psi" on LAN side
(10.164.123.202):

  # neon adm_tsr $ ping 10.164.123.202 64 1
  PING 10.164.123.202 (10.164.123.202): 64 data bytes
  72 bytes from 10.164.123.202: icmp_seq=0 ttl=64 time=0 ms
  --snip
  1 packets transmitted, 1 packets received, 0.0% packet loss
  round-trip (ms)  min/avg/max/med = 0/0/0/0
  # neon adm_tsr $ ipconfig
  --snip
          IP Address. . . . . . . . . . . . : 10.164.123.211
          Subnet Mask . . . . . . . . . . . : 255.255.255.0
          Default Gateway . . . . . . . . . : 10.164.123.202
  # neon adm_tsr $ wget http://208.118.235.148 -O -  # 208.118.235.148 == gnu.org
  --2013-09-19 11:16:48--  http://208.118.235.148/
  Connecting to 208.118.235.148:80... failed: Connection timed out.
  --snip

I ran "tcpdump -vv host 10.164.123.202 and 10.164.123.211" and saw nothing during the
wget.

Constructive comments or help would be appreciated.

--
thanks/regards,
Tom

--
# 11:02:19 Thu 0919 /etc/sysconfig
# psi root # ifconfig
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 0  (Local Loopback)
        RX packets 2  bytes 140 (140.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2  bytes 140 (140.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

p1p1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.164.123.202  netmask 255.255.255.0  broadcast 10.164.123.255
        inet6 fe80::20a:cdff:fe21:413b  prefixlen 64  scopeid 0x20<link>
        ether 00:0a:cd:21:41:3b  txqueuelen 1000  (Ethernet)
        RX packets 10271  bytes 808599 (789.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 21931  bytes 6241567 (5.9 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

p2p1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet THREE_OCTETS_HERE.130  netmask 255.255.255.248  broadcast THREE_OCTETS_HERE.135
        inet6 fe80::96de:80ff:fe70:5cc0  prefixlen 64  scopeid 0x20<link>
        ether 94:de:80:70:5c:c0  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 18

# 11:02:56 Thu 0919 /etc/sysconfig
# psi root # cat iptables
# iptables comments apparently require poundsign in column 1

# http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.html
# some comments taken from: http://serverfault.com/questions/84963/why-not-block-icmp

# Firewall configuration written by system-config-firewall

# Internet facing port is p2p1
# LAN: p1p1

*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o p2p1 -j MASQUERADE
COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

# Accept any packets that have something to do with ones we've sent on outbound
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# ESTABLISHED: A packet which belongs to an existing connection
# (i.e., a reply packet, or outgoing packet on a connection which has seen replies).
#
# RELATED: A packet which is related to, but not part of, an existing
# connection, such as an ICMP error, or (with the FTP module
# inserted), a packet establishing an ftp data connection.

# Accept ICMP
-A INPUT -p icmp -j ACCEPT

# Accept any packets coming or going on localhost (this can be very important)
-A INPUT -i lo -j ACCEPT

# trust LAN
-A INPUT -i p1p1 -j ACCEPT

# TBD: do I need these:
-A INPUT -p ah -j ACCEPT
-A INPUT -p esp -j ACCEPT

# --------------------------------------------------------------------
# accept ssh, http, https, mail
# --------------------------------------------------------------------
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT

-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT

# https
-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT

-A INPUT -p tcp -m tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT

# --------------------------------------------------------------------
# setup forwarding for nat/masquerading
# --------------------------------------------------------------------
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -p icmp -j ACCEPT
-A FORWARD -i lo -j ACCEPT

-A FORWARD -i p1p1 -j ACCEPT
-A FORWARD -o p2p1 -j ACCEPT

# reject other traffic
# TBD: reconcile w/ http://www.redhat.com/archives/rhl-list/2009-September/msg01757.html
-A INPUT   -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited

-A INPUT -i p1p1 -s 10.164.123.202/255.255.255.0 -j ACCEPT
COMMIT
# 11:03:22 Thu 0919 /etc/sysconfig
# psi root # iptables -L -v
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 3084  563K ACCEPT     all  --  any    any     anywhere             anywhere             state RELATED,ESTABLISHED
    5   213 ACCEPT     icmp --  any    any     anywhere             anywhere
    0     0 ACCEPT     all  --  lo     any     anywhere             anywhere
   15  2305 ACCEPT     all  --  p1p1   any     anywhere             anywhere
    0     0 ACCEPT     ah   --  any    any     anywhere             anywhere
    0     0 ACCEPT     esp  --  any    any     anywhere             anywhere
    1    48 ACCEPT     tcp  --  any    any     anywhere             anywhere             state NEW tcp dpt:ssh
    2   120 ACCEPT     tcp  --  any    any     anywhere             anywhere             state NEW tcp dpt:http
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             state NEW tcp dpt:https
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             tcp dpt:smtp state NEW,ESTABLISHED
    5   240 REJECT     all  --  any    any     anywhere             anywhere             reject-with icmp-host-prohibited
    0     0 ACCEPT     all  --  p1p1   any     10.164.123.0/24      anywhere

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  any    any     anywhere             anywhere             state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere
    0     0 ACCEPT     all  --  lo     any     anywhere             anywhere
    0     0 ACCEPT     all  --  p1p1   any     anywhere             anywhere
    0     0 ACCEPT     all  --  any    p2p1    anywhere             anywhere
    0     0 REJECT     all  --  any    any     anywhere             anywhere             reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT 19391 packets, 5556K bytes)
 pkts bytes target     prot opt in     out     source               destination
# 11:03:29 Thu 0919 /etc/sysconfig
# psi root # uname -a
Linux psi 3.10.10-200.fc19.i686.PAE #1 SMP Thu Aug 29 19:16:15 UTC 2013 i686 i686 i386 GNU/Linux
