From: Daniel Gray <dngray@polarbear.army>
Subject: Directing some containers into a lower priority interface
Date: Thu, 27 Jan 2022 17:51:52 +0000
Message-ID: <20220127175152.rjxd56qb3ma4scnm@disroot.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=polarbear.army;
        s=mail; t=1643305917;
        bh=IzN+F+l5EQ+4BN9pCu4iqKu9cmcaHUcX6oQR1znFfNE=;
        h=Date:From:To:Subject;
        b=g2TKzaOnqlwO67/CTxW58AzRlvHz5bzKNEO4TiEUp25irHoC6e2H/RxYQa9GJ8jAG
         OobZ5aQd3jZ9lW0tPHdTmJcAYskBaxowjNsN4hkQ0QSxRZrfAo0CID36+93aXurN0z
         5nYHFOGKumCxrVyQWjWbwzzT3Fhfdof3pTEjR+5m2tDX+SD6BZDncJMCWj8vlGL98k
         3nmrw35ThyOpSGiRnJ/r90Wx3NYh0BIyqS2bBGdGgmSrPYJAPtA/uLQ2mHltguIaoM
         yty8wN3XoH4/iEql51zzyxDVFOzG6Wcvy187zgGwR8yXNTfQ3w/R8mxmgV15r//u+l
         Gtip2M4joMrcw==
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

My server has multiple network interfaces.

- bond0.3 <- default route via 192.168.3.1
- bond0.7 <- lower priority interface via 192.168.7.1

In this case I want my containers to be using bond0.7.

I add a separate routing table and prepare default route:

echo "7 CONTAINERS" >> /etc/iproute2/rt_tables
sudo ip route add default via 192.168.7.1 table CONTAINERS
sudo ip route add 192.168.7.1 dev bond0.7 table CONTAINERS
sudo ip rule add from 10.89.0.0/24 lookup CONTAINERS

sudo podman network create -d bridge net1
sudo podman run -dt --name test --network net1 --cap-add NET_RAW --rm busybox

On container:

/ # ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host
         valid_lft forever preferred_lft forever
2: eth0@if542: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue
      link/ether d2:a6:90:7b:60:80 brd ff:ff:ff:ff:ff:ff
      inet 10.89.0.4/24 brd 10.89.0.255 scope global eth0
         valid_lft forever preferred_lft forever
      inet6 fe80::d0a6:90ff:fe7b:6080/64 scope link
         valid_lft forever preferred_lft forever

/ # ping 1.1.1.1

Then on the host:

sudo tcpdump -nn -i cni-podman1
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on cni-podman1, link-type EN10MB (Ethernet), snapshot length 262144 bytes
02:20:02.428435 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:20:04.411105 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:20:05.415224 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:20:06.428555 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
^C
4 packets captured
4 packets received by filter
0 packets dropped by kernel

On container:

/ # arp -a
host.containers.internal (10.89.0.1) at <incomplete>  on eth0

Seems that my container doesn't know who 10.89.0.1 is.

If I remove the rule:

sudo ip rule del from 10.89.0.0/24 lookup CONTAINERS

the ARP reply comes through:

sudo tcpdump -nn -i cni-podman1
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on cni-podman1, link-type EN10MB (Ethernet), snapshot length 262144 bytes
02:22:09.563747 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:22:09.563801 ARP, Reply 10.89.0.1 is-at ce:b3:e0:ab:b0:ff, length 28
02:22:09.563831 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 14, seq 0, length 64
02:22:09.812966 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 14, seq 0, length 64
02:22:10.563915 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 14, seq 1, length 64
02:22:10.807300 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 14, seq 1, length 64
02:22:14.935078 ARP, Request who-has 10.89.0.4 tell 10.89.0.1, length 28
02:22:14.935128 ARP, Reply 10.89.0.4 is-at d2:a6:90:7b:60:80, length 28

and remains for as long as the arp cache is valid

/ # arp -a
host.containers.internal (10.89.0.1) at ce:b3:e0:ab:b0:ff [ether]  on eth0

if I add the rule again on my host

sudo ip rule add from 10.89.0.0/24 lookup CONTAINERS

things continue to work for a while until, the arp cache expires, for
example ping stops:

/ # ping 1.1.1.1
PING 1.1.1.1 (1.1.1.1): 56 data bytes
64 bytes from 1.1.1.1: seq=0 ttl=59 time=8.701 ms
64 bytes from 1.1.1.1: seq=1 ttl=59 time=8.810 ms
64 bytes from 1.1.1.1: seq=2 ttl=59 time=9.335 ms
64 bytes from 1.1.1.1: seq=3 ttl=59 time=9.660 ms
64 bytes from 1.1.1.1: seq=4 ttl=59 time=8.742 ms
64 bytes from 1.1.1.1: seq=5 ttl=59 time=8.242 ms
64 bytes from 1.1.1.1: seq=6 ttl=59 time=8.940 ms
64 bytes from 1.1.1.1: seq=7 ttl=59 time=8.987 ms
64 bytes from 1.1.1.1: seq=8 ttl=59 time=9.302 ms
^C
--- 1.1.1.1 ping statistics ---
27 packets transmitted, 9 packets received, 66% packet loss
round-trip min/avg/max = 8.242/8.968/9.660 ms

sudo tcpdump -nn -i cni-podman1
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on cni-podman1, link-type EN10MB (Ethernet), snapshot length 262144 bytes
02:24:47.781760 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 0, length 64
02:24:47.790349 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 0, length 64
02:24:48.781992 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 1, length 64
02:24:48.790710 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 1, length 64
02:24:49.782086 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 2, length 64
02:24:49.791350 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 2, length 64
02:24:50.782279 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 3, length 64
02:24:50.791865 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 3, length 64
02:24:51.782334 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 4, length 64
02:24:51.791010 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 4, length 64
02:24:52.782396 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 5, length 64
02:24:52.790556 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 5, length 64
02:24:52.801752 ARP, Request who-has 10.89.0.4 tell 10.89.0.1, length 28
02:24:52.801792 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:24:52.801803 ARP, Reply 10.89.0.4 is-at d2:a6:90:7b:60:80, length 28
02:24:53.782472 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 6, length 64
02:24:53.791345 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 6, length 64
02:24:53.815092 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:24:54.782662 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 7, length 64
02:24:54.791579 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 7, length 64
02:24:54.828530 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:24:55.782856 IP 10.89.0.4 > 1.1.1.1: ICMP echo request, id 18, seq 8, length 64
02:24:55.792086 IP 1.1.1.1 > 10.89.0.4: ICMP echo reply, id 18, seq 8, length 64
02:24:56.783054 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:24:57.791743 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:24:58.801868 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:00.783485 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:01.788525 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:02.801872 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:04.784141 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:05.788525 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:06.801764 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:08.784601 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:09.788526 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:10.801864 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
02:25:12.785253 ARP, Request who-has 10.89.0.1 tell 10.89.0.4, length 28
^C
36 packets captured
36 packets received by filter
0 packets dropped by kernel

and then we get back to:

/ # arp -a
host.containers.internal (10.89.0.1) at <incomplete>  on eth0

on the container.

So it seems I need another solution to route out via bond0.7, that
doesn't intefer with ARP requests between the containers and
cni-podman1.

If anyone has a better way to do this I'd like to know.

I tried
https://stewartadam.io/blog/2019/04/04/routing-packets-specific-docker-container-through-specific-outgoing-interface
which is a similar method but fwmarking packets from that subnet, and
got the same problem.

Ie instead:

sudo ip rule add fwmark 7 table CONTAINERS prio 700
sudo iptables -t mangle -A PREROUTING -s 10.89.0.0/24 -j MARK --set-xmark 0x7/0xffffffff

Also didn't seem to matter if I used podman or Docker, had the same
issue with both.

-- 
Daniel Gray 0x41911F722B0F9AE3
https://mastodon.social/@dngray
