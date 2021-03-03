From: Derrick Lim <derrickltl@gmail.com>
Subject: iptables masquerade source ip selection issue
Date: Wed, 3 Mar 2021 21:38:38 +0900
Message-ID: <CAGB=RwJe0ey3Xhrz2F8QJ1R3WL_U8k0YGZKEmdJjfSycM3xn2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=PacnKm/KjbST0YwArVeS8eAPphgAls4w4TeGpH7BEeg=;
        b=g4tjffdAUfpc5pxmMgYhXrgQqIcSCkMmE/FKnTu0ernQpM/FrNw8d3LAn24YDZcDnx
         eQlVN2+BeQA85kXb7z5ixuFv6jJAOcQv+P/x9mfj5ROE3+xJp/qJGSXKVKcqrOuswRND
         oUJiBzCAb4UjrgS4VYVDrOSZUDaD6nrx+/D3D7aDOozZOm7gNrCcCmCYFauZg0Yk5+P7
         GxDE0p7Y7OOfyNgkuwg97Kx8HwVx+szlhMe+619n096OMgHpyQPfrccCaLiJjOpEM0/5
         00h8gsrbd8qAgmauXUD6VwPhyIWks8/cO4diS08YEkTTNGJgFxV0m3icXos3smBd8BC4
         NmWg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I seem to be running into an issue with source IP selection when using
MASQUERADE with iptables. The wrong source IP is selected, but the
packet is sent from the right interface.

I've tested this on both Ubuntu 18.04 (kernel 4.15, 5.4) and Ubuntu
20.04 (kernel 5.4)

My setup is that I have a host with multiple interfaces, and the
routing table is such that 192.168.1.0/24 uses ens4.104 and
192.168.1.4, and 192.168.2.0/24 uses ens4.204 and 192.168.2.4. The
host has 192.168.1.4/32 and 192.168.2.4/32 configured on two different
dummy interfaces.

host:~# ip r show
default via 192.168.254.1 dev ens3 proto dhcp src 192.168.254.215 metric 100
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1
192.168.1.1 nhid 36 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.104
proto bgp src 192.168.1.4 metric 20
192.168.1.2 nhid 36 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.104
proto bgp src 192.168.1.4 metric 20
192.168.1.3 nhid 36 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.104
proto bgp src 192.168.1.4 metric 20
192.168.1.100 nhid 36 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.104
proto bgp src 192.168.1.4 metric 20
192.168.2.1 nhid 35 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.204
proto bgp src 192.168.2.4 metric 20
192.168.2.2 nhid 35 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.204
proto bgp src 192.168.2.4 metric 20
192.168.2.3 nhid 35 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.204
proto bgp src 192.168.2.4 metric 20
192.168.254.0/24 dev ens3 proto kernel scope link src 192.168.254.215
192.168.254.1 dev ens3 proto dhcp scope link src 192.168.254.215 metric 100

The route for 192.168.1.1 is as follows.
host:~# ip r get 192.168.1.1
192.168.1.1 via inet6 fe80::ec6:36ff:fee6:7905 dev ens4.104 src
192.168.1.4 uid 0
    cache

At this point everything works fine.

host:~# ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=1 ttl=63 time=1.18 ms
64 bytes from 192.168.1.1: icmp_seq=2 ttl=63 time=0.952 ms
^C
--- 192.168.1.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 0.952/1.067/1.182/0.115 ms
host:~#

I then run a container using Docker, which uses MASQUERADE to NAT the
container address to the host's IP address for traffic exiting the
host.

From the container,

host:~# docker exec -it nettool /bin/bash
bash-5.0# ip r
default via 172.17.0.1 dev eth0
172.17.0.0/16 dev eth0 proto kernel scope link src 172.17.0.2
bash-5.0# ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
^C
--- 192.168.1.1 ping statistics ---
4 packets transmitted, 0 received, 100% packet loss, time 3063ms

bash-5.0#

Doing a tcpdump on the host, I see it picked up 192.168.254.215, which
is using the source IP based on ens3's default route (wrong), but
sending it out from ens4.104 (correct).

host:~# tcpdump -i any -nn icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked v1), capture size
262144 bytes
12:00:35.318301 IP 172.17.0.2 > 192.168.1.1: ICMP echo request, id 47,
seq 1, length 64
12:00:35.318301 IP 172.17.0.2 > 192.168.1.1: ICMP echo request, id 47,
seq 1, length 64
12:00:35.318371 IP 192.168.254.215 > 192.168.1.1: ICMP echo request,
id 47, seq 1, length 64
12:00:36.346346 IP 172.17.0.2 > 192.168.1.1: ICMP echo request, id 47,
seq 2, length 64
12:00:36.346346 IP 172.17.0.2 > 192.168.1.1: ICMP echo request, id 47,
seq 2, length 64
12:00:36.346402 IP 192.168.254.215 > 192.168.1.1: ICMP echo request,
id 47, seq 2, length 64
12:00:37.370339 IP 172.17.0.2 > 192.168.1.1: ICMP echo request, id 47,
seq 3, length 64
12:00:37.370339 IP 172.17.0.2 > 192.168.1.1: ICMP echo request, id 47,
seq 3, length 64
12:00:37.370385 IP 192.168.254.215 > 192.168.1.1: ICMP echo request,
id 47, seq 3, length 64
^C
9 packets captured
9 packets received by filter
0 packets dropped by kernel
host:~# tcpdump -i ens4.104 -nn icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens4.104, link-type EN10MB (Ethernet), capture size 262144 bytes
12:00:46.586368 IP 192.168.254.215 > 192.168.1.1: ICMP echo request,
id 47, seq 12, length 64
12:00:47.610381 IP 192.168.254.215 > 192.168.1.1: ICMP echo request,
id 47, seq 13, length 64
12:00:48.634396 IP 192.168.254.215 > 192.168.1.1: ICMP echo request,
id 47, seq 14, length 64
^C
3 packets captured
3 packets received by filter
0 packets dropped by kernel

The NAT table looks like this.

host:~# iptables -t nat -L -n -v
Chain PREROUTING (policy ACCEPT 20 packets, 1632 bytes)
 pkts bytes target     prot opt in     out     source               destination
    2   120 DOCKER     all  --  *      *       0.0.0.0/0
0.0.0.0/0            ADDRTYPE match dst-type LOCAL

Chain INPUT (policy ACCEPT 2 packets, 120 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 129 packets, 9258 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DOCKER     all  --  *      *       0.0.0.0/0
!127.0.0.0/8          ADDRTYPE match dst-type LOCAL

Chain POSTROUTING (policy ACCEPT 129 packets, 9258 bytes)
 pkts bytes target     prot opt in     out     source               destination
   18  1512 MASQUERADE  all  --  *      !docker0  172.17.0.0/16        0.0.0.0/0
    0     0 MASQUERADE  tcp  --  *      *       172.17.0.2
172.17.0.2           tcp dpt:1443
    0     0 MASQUERADE  tcp  --  *      *       172.17.0.2
172.17.0.2           tcp dpt:1180

Chain DOCKER (2 references)
 pkts bytes target     prot opt in     out     source               destination
    0     0 RETURN     all  --  docker0 *       0.0.0.0/0            0.0.0.0/0
    0     0 DNAT       tcp  --  !docker0 *       0.0.0.0/0
0.0.0.0/0            tcp dpt:1443 to:172.17.0.2:1443
    0     0 DNAT       tcp  --  !docker0 *       0.0.0.0/0
0.0.0.0/0            tcp dpt:1180 to:172.17.0.2:1180
host:~#

Why is this happening?
How does MASQUERADE select source IP? I would expect it to follow the
same as doing a route lookup. Does it not?
What can I do to troubleshoot this?

Thank you,
Derrick
