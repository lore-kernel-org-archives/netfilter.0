From: G7fya GoQ8 <falazemi@gmail.com>
Subject: how to SNAT GRE tunneling?
Date: Mon, 24 Jan 2022 02:50:53 +0000
Message-ID: <CAKPwB8JKQitmyRLQ8GHT_nt1N-adC8hvesdLqXhm9p0tKxfmLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZHD5QP3FUm82scxgFJ4Fh/oaMTVwzzpsRlah+x1FQHU=;
        b=PVHVEUwFviXvUEC1/ILW+DPpvqsKkZT55KyN7lsOxXaBVhghnkE+n/FqtuLbwhf8uj
         1uMf8MlwExA4MCsZmNwtE0cWfuIxugb2XG+h8KuQECfHRu9ZXkDRX3aihmwJFeRafLF7
         zMQhW6mXUuTniFueyeRUa6+h7J60V6QilaU0xWGU+aXFRllFpAO1v1zIYcEpEbIuJO3Z
         /+N0Ynq01LxKlYMzZDM+jMh7mTs6iQXoVxppaX3qDEwfGNMagO7a3KIRyIifMMH1iaWD
         QhuS0V/WwWAtShu/VobfzCWJyTUlr/mBSNM6gAHBrOGS6JkeX2ZIiBYlvMbr8PlXMr92
         ZIKg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear good people of iptables,

I have a VPS server with 3 public IP Addresses and I am trying to SNAT GRE
tunneling with my office servers. The goal is to force all traffic in and
out through VPS server IP using GRE tunneling. The office network have
3 servers, one as the gateway and the others share the internet connection
with it.

I am able to make office-server1 (gateway) to force all traffic to the VPS
server. However, the other servers in the network cannot access the internet.

Here is my setup:

  +----------------------------------+
  | vps server                   |
  |  eth0:                           |
  |   184.75.254.9             |
  |   77.81.247.93             |
  |   77.81.247.140           |
  |  tun0:                           |
  |   link/gre 184.75.254.9 |
  |       peer 37.36.31.45   |
  |   inet 10.1.1.1/32         |
  +----------------------------------+
                  |
     ________________
   /                                  \
  |       GRE tunneling      |
   \ ________________ /
                 |
  +---------------------------------------------------------+
  | office-server1 (gateway)                    |
  |  eth0: 10.0.1.4/24                               |
  |  eth1: 10.0.1.5/24 (gateway:10.0.1.4) |
  |  wan0: 37.36.31.45                            |
  |  tun0:                                                 |
  |   link/gre 37.36.31.45                         |
  |       peer 184.75.254.9                       |
  |   inet 10.1.2.1/32                               |
  +-------------------------------------------------------+
                             |
             ---------------------------------------------------
            |                                                   |
  +-------------------------------+           +-------------------------------+
  | office-server2           |            | office-server3          |
  |  eth0:                        |            |  eth0:                       |
  |   10.0.1.8                   |           |   10.0.1.9                  |
  |    (gateway:10.0.1.4) |           |    (gateway:10.0.1.4) |
  +-------------------------------+          +--------------------------------+


+----------------+
| vps server |
+----------------+------------------------------------------------------
$ iptables -S && iptables -S --table nat
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT DROP
-N FORWARD_no_match_DROP_LOG
-N INPUT_no_match_DROP_LOG
-N OUTPUT_no_match_DROP_LOG
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s 8.8.4.4/32 -p tcp -m tcp --sport 53 -j ACCEPT
-A INPUT -s 8.8.8.8/32 -p tcp -m tcp --sport 53 -j ACCEPT
-A INPUT -p gre -j ACCEPT
-A INPUT -s 77.81.247.93/32 -j ACCEPT
-A INPUT -d 77.81.247.93/32 -j ACCEPT
-A INPUT -s 10.1.2.1/32 -d 10.1.1.1/32 -i tun0 -p icmp -j ACCEPT
-A INPUT -i tun0 -j ACCEPT
-A INPUT -s 10.1.2.1/32 -j ACCEPT
-A INPUT -d 10.1.2.1/32 -j ACCEPT
-A INPUT -s 10.1.1.1/32 -j ACCEPT
-A INPUT -d 10.1.1.1/32 -j ACCEPT
-A INPUT -j INPUT_no_match_DROP_LOG
-A FORWARD -p gre -j ACCEPT
-A FORWARD -i eth0 -o tun0 -j ACCEPT
-A FORWARD -d 10.1.1.0/24 -i eth0 -o tun0 -j ACCEPT
-A FORWARD -i tun0 -o eth0 -j ACCEPT
-A FORWARD -j FORWARD_no_match_DROP_LOG
-A OUTPUT -p icmp -m conntrack --ctstate INVALID -j DROP
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -s 127.0.0.1/32 -j ACCEPT
-A OUTPUT -o eth0 -j ACCEPT
-A OUTPUT -p gre -j ACCEPT
-A OUTPUT -o tun0 -j ACCEPT
-A OUTPUT -j OUTPUT_no_match_DROP_LOG
-A FORWARD_no_match_DROP_LOG -j LOG --log-prefix
"d-fw-FORWARD.no.match:" --log-level 5
-A FORWARD_no_match_DROP_LOG -j DROP
-A INPUT_no_match_DROP_LOG -j LOG --log-prefix "d-fw-INPUT.no.match:"
--log-level 5
-A INPUT_no_match_DROP_LOG -j DROP
-A OUTPUT_no_match_DROP_LOG -j LOG --log-prefix
"d-fw-OUTPUT.no.match:" --log-level 5
-A OUTPUT_no_match_DROP_LOG -j DROP
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT
-A PREROUTING -d 77.81.247.93/32 -j DNAT --to-destination 10.1.2.1
-A POSTROUTING -s 10.1.2.1/32 -o eth0 -j SNAT --to-source 77.81.247.93

$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP group default qlen 1000
    link/ether 06:6e:48:00:01:30 brd ff:ff:ff:ff:ff:ff
    inet 184.75.254.9/24 brd 184.75.254.255 scope global dynamic
noprefixroute eth0
       valid_lft 56369sec preferred_lft 45569sec
    inet 77.81.247.93/32 scope global eth0
       valid_lft forever preferred_lft forever
    inet 77.81.247.140/32 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::1986:36fb:3bb5:295c/64 scope link
       valid_lft forever preferred_lft forever
3: tun0@NONE: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1476 qdisc noqueue
state UNKNOWN group default qlen 1000
    link/gre 184.75.254.9 peer 37.36.31.45
    inet 10.1.1.1/32 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::200:5efe:23a:1c11/64 scope link
       valid_lft forever preferred_lft forever

$ ip route ls
default via 184.75.254.1 dev eth0 proto dhcp src 184.75.254.9 metric 202
184.75.254.0/24 dev eth0 proto dhcp scope link src 184.75.254.9 metric 202
10.1.2.0/24 dev tun0 scope link

$ ip rule ls
0:    from all lookup local
32766:    from all lookup main
32767:    from all lookup default
------------------------------------------------------------------------


+---------------------+
| office-server1 |
+---------------------+-------------------------------------------------
$ iptables -S && iptables -S --table nat
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT DROP
-N FORWARD_no_match_DROP_LOG
-N INPUT_no_match_DROP_LOG
-N OUTPUT_no_match_DROP_LOG
-N icmp_packets
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s 8.8.4.4/32 -p tcp -m tcp --sport 53 -j ACCEPT
-A INPUT -s 8.8.8.8/32 -p tcp -m tcp --sport 53 -j ACCEPT
-A INPUT -s 10.0.1.0/24 -d 10.0.1.255/32 -i eth0 -j ACCEPT
-A INPUT -p gre -j ACCEPT
-A INPUT -s 10.1.1.1/32 -d 10.1.2.1/32 -i tun0 -p icmp -j ACCEPT
-A INPUT -d 10.1.2.1/32 -i tun0 -j ACCEPT
-A INPUT -d 10.0.1.0/24 -i tun0 -j ACCEPT
-A INPUT -s 10.0.1.0/24 -d 10.1.2.1/32 -i eth0 -j ACCEPT
-A INPUT -j INPUT_no_match_DROP_LOG
-A FORWARD -i eth0 -o eth0 -j ACCEPT
-A FORWARD -p gre -j ACCEPT
-A FORWARD -i eth0 -o tun0 -j ACCEPT
-A FORWARD -d 10.1.2.0/24 -i eth0 -o tun0 -j ACCEPT
-A FORWARD -i tun0 -o eth0 -j ACCEPT
-A FORWARD -s 10.0.1.0/24 -i eth0 -o tun0 -j ACCEPT
-A FORWARD -d 10.0.1.0/24 -i tun0 -o eth0 -j ACCEPT
-A FORWARD -j FORWARD_no_match_DROP_LOG
-A OUTPUT -p icmp -m conntrack --ctstate INVALID -j DROP
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -s 127.0.0.1/32 -j ACCEPT
-A OUTPUT -s 10.0.1.4/32 -j ACCEPT
-A OUTPUT -p gre -j ACCEPT
-A OUTPUT -o tun0 -j ACCEPT
-A OUTPUT -s 10.1.2.1/32 -o tun0 -j ACCEPT
-A OUTPUT -s 10.0.1.0/24 -o tun0 -j ACCEPT
-A OUTPUT -s 10.1.2.1/32 -d 10.0.1.0/24 -o eth0 -j ACCEPT
-A OUTPUT -j OUTPUT_no_match_DROP_LOG
-A FORWARD_no_match_DROP_LOG -j LOG --log-prefix
"d-fw-FORWARD.no.match:" --log-level 5
-A FORWARD_no_match_DROP_LOG -j DROP
-A INPUT_no_match_DROP_LOG -j LOG --log-prefix "d-fw-INPUT.no.match:"
--log-level 5
-A INPUT_no_match_DROP_LOG -j DROP
-A OUTPUT_no_match_DROP_LOG -j LOG --log-prefix
"d-fw-OUTPUT.no.match:" --log-level 5
-A OUTPUT_no_match_DROP_LOG -j DROP
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT
-A PREROUTING -i eth0 -j DNAT --to-destination 10.1.2.1
-A PREROUTING -i eth1 -j DNAT --to-destination 10.1.2.1
-A PREROUTING -d 10.0.1.0/24 -j DNAT --to-destination 10.1.2.1
-A PREROUTING -s 10.0.1.0/24 -j DNAT --to-destination 10.1.2.1
-A POSTROUTING -s 10.0.1.0/24 -o tun0 -j SNAT --to-source 10.1.2.1
-A POSTROUTING -o tun0 -j SNAT --to-source 10.1.2.1

$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP group default qlen 1000
    link/ether 00:30:48:d1:cf:90 brd ff:ff:ff:ff:ff:ff
    inet 10.0.1.4/24 brd 10.0.1.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::230:48ff:fed1:cf90/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP group default qlen 1000
    link/ether 00:30:48:d1:cf:91 brd ff:ff:ff:ff:ff:ff
    inet 10.0.1.5/24 brd 10.0.1.255 scope global dynamic noprefixroute eth1
       valid_lft 504496129sec preferred_lft 441430369sec
    inet6 fe80::230:48ff:fed1:cf91/64 scope link
       valid_lft forever preferred_lft forever
4: wan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UNKNOWN group default qlen 1000
    link/ether 00:a0:c6:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 37.36.31.45/32 brd 37.255.255.255 scope global dynamic wan0
       valid_lft 106sec preferred_lft 86sec
    inet6 fe80::2a0:c6ff:fe00:0/64 scope link
       valid_lft forever preferred_lft forever
8: tun0@NONE: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1476 qdisc noqueue
state UNKNOWN group default qlen 1000
    link/gre 37.36.31.45 peer 184.75.254.9
    inet 10.1.2.1/32 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::200:5efe:2524:1f2d/64 scope link
       valid_lft forever preferred_lft forever

$ ip route ls
0.0.0.0/1 via 10.1.2.1 dev tun0
default via 37.36.31.1 dev wan0 proto dhcp src 37.36.31.45 metric 1002 mtu 1500
default via 10.0.1.4 dev eth1 proto dhcp src 10.0.1.5 metric 1003
184.75.254.9 via 37.36.31.1 dev wan0
10.0.1.0/24 dev eth0 proto kernel scope link src 10.0.1.4
10.0.1.0/24 dev eth1 proto dhcp scope link src 10.0.1.5 metric 1003
10.1.1.0/24 dev tun0 scope link
37.36.31.1 dev wan0 scope link src 37.36.31.45 metric 1002 mtu 1500
192.168.2.1 via 37.36.31.1 dev wan0 proto dhcp src 37.36.31.45 metric
1002 mtu 1500

$ ip rule ls
0:    from all lookup local
32766:    from all lookup main
32767:    from all lookup default

$ curl ifconfig.me
77.81.247.93
$ curl ifconfig.me  --interface  eth0
77.81.247.93
$ curl ifconfig.me  --interface  eth1
77.81.247.93
$ curl ifconfig.me  --interface  tun0
77.81.247.93
------------------------------------------------------------------------


+---------------------+
| office-server2 | note: same result with office-server3
+---------------------+-------------------------------------------------
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP group default qlen 1000
    link/ether 00:30:48:d1:cf:90 brd ff:ff:ff:ff:ff:ff
    inet 10.0.1.4/24 brd 10.0.1.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::230:48ff:fed1:cf90/64 scope link
       valid_lft forever preferred_lft forever

$ ip route ls
default via 10.0.1.4 dev workshop.lan2 proto dhcp src 10.0.1.8 metric 202
10.0.1.0/24 dev workshop.lan1 proto dhcp scope link src 10.0.1.8 metric 202

$ ip rule ls
0:    from all lookup local
32766:    from all lookup main
32767:    from all lookup default

$ curl ifconfig.me
curl: (28) Failed to connect to ifconfig.me port 80: Connection timed out
------------------------------------------------------------------------


As you can see, office-server1 can browse the internet using VPS IP Address.
How can I reach the same with office-server2 and office-server3 since they
get their internet connection from office-server1.

I am obviously doing something wrong but cannot finger it out.
Any help would be much much appreciated.

Thank you
