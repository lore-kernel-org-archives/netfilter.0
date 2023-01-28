From: Christian Worm Mortensen <opensource@epust.dk>
Subject: Subject: Flowtables send packets to broadcast MAC address.
Date: Sat, 28 Jan 2023 13:26:29 +0100
Message-ID: <CAFu8dVrNZ5zoWon5HS-f2Wv6=GqJcBNJ1yxBz=YpaXqybUtorg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=epust-dk.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qXxp8wvDhyXq6nnXjqOlv1YzGHA80GuYhGZfC3wuUJk=;
        b=LG5fXlQ5XVhIFWKQNBc4k+qjVZbWkWHABwYGU9YQGGVZy4lSl3hOGsb4e2P4E771L5
         1hZ3KULM4SVXkJhrf4/s0bZopG+Pm3vMMu8LbNPnCjwqiqlLc6aegWE+30BGJTa7kgfQ
         apKt7FiPBJah1QozWq0VdR6UwkiEY+kT2e84eYa0MCsbLSSd6TniRQEGjsbamzBhlZxW
         PXe/BTmEACqbl+0jlXeNNJ+FTet5mXNBiYgHsyWRAv/RsDfw1zjxmbkOzCJja1Rnfupn
         z+zYt22JTG6RSH8lqtvP3wyXiciw9YAHzJn+Vr241qlNNb8LiltbP1XLeUQo/8im4zLN
         0faw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am new to flowtables and I see a very wired behaviour. I wonder if I
do something wrong or if this is a (known) bug/limitation.

I have made a very simple setup:

+---------------+      +---------------------------+      +---------------+
|Namespace left |      |  Namespace forward        |      |Namespace right|
|               |      |                           |      |               |
| +-----------+ |      | +----------+ +----------+ |      | +-----------+ |
| |eth0       | | veth | |left      | |right     | | veth | |eth0       | |
| |1.1.1.1    |----------|fe80::1/64| |fe80::1/64|----------|2.2.2.2    | |
| |fe80::2/64 | |      | |          | |          | |      | |fe80::2/64 | |
| +-----------+ |      | +----------+ +----------+ |      | +-----------+ |
+---------------+      +---------------------------+      +---------------+

With this script:

ip netns delete forward
ip netns delete left
ip netns delete right

ip netns add forward

ip netns add left
ip netns exec left ip link add eth0 type veth peer name left netns forward
ip netns exec left ip link set up dev eth0
ip netns exec left ip addr add 1.1.1.1/32 dev eth0
ip netns exec left ip addr add fe80::2/64 dev eth0
ip netns exec left ip route add 2.2.2.2/32 via inet6 fe80::1 dev eth0

ip netns add right
ip netns exec right ip link add eth0 type veth peer name right netns forward
ip netns exec right ip link set up dev eth0
ip netns exec right ip addr add 2.2.2.2/32 dev eth0
ip netns exec right ip addr add fe80::2/64 dev eth0
ip netns exec right ip route add 1.1.1.1/32 via inet6 fe80::1 dev eth0

ip netns exec forward ip link set up dev right
ip netns exec forward ip link set up dev left
ip netns exec forward sysctl -w net.ipv4.ip_forward=1
ip netns exec forward ip route add 1.1.1.1/32 via inet6 fe80::2 dev left
ip netns exec forward ip route add 2.2.2.2/32 via inet6 fe80::2 dev right
ip netns exec forward ip addr add fe80::1/64 dev left
ip netns exec forward ip addr add fe80::1/64 dev right

ip netns exec forward nft add table ip flowtbl
ip netns exec forward nft add flowtable ip flowtbl f "{ hook ingress
priority 0; devices = { left,right }; }"
ip netns exec forward nft add chain ip flowtbl forward "{ type filter
hook forward priority 0; }"
ip netns exec forward nft add rule ip flowtbl forward flow add @f

If I make a TCP connection from left to right to port 4444 I get this
output from conntrack -L as expected:

tcp      6 src=1.1.1.1 dst=2.2.2.2 sport=42126 dport=4444 src=2.2.2.2
dst=1.1.1.1 sport=4444 dport=42126 [OFFLOAD] mark=0 use=2

However, after the first SYN packets, the destination MAC addresses
sent by forward to right are ff:ff:ff:ff:ff:ff. This is shown here:

$ sudo ip netns exec right tcpdump -nle -i eth0
13:01:01.198035 86:d2:45:09:ab:d3 > 33:33:ff:00:00:02, ethertype IPv6
(0x86dd), length 86: fe80::84d2:45ff:fe09:abd3 > ff02::1:ff00:2:
ICMP6, neighbor solicitation, who has fe80::2, length 32
13:01:01.198047 d2:a3:e7:c6:e4:49 > 86:d2:45:09:ab:d3, ethertype IPv6
(0x86dd), length 86: fe80::2 > fe80::84d2:45ff:fe09:abd3: ICMP6,
neighbor advertisement, tgt is fe80::2, length 32
13:01:01.198056 86:d2:45:09:ab:d3 > d2:a3:e7:c6:e4:49, ethertype IPv4
(0x0800), length 74: 1.1.1.1.42126 > 2.2.2.2.4444: Flags [S], seq
2864317901, win 64240, options [mss 1460,sackOK,TS val 2553558989 ecr
0,nop,wscale 7], length 0
13:01:01.198077 d2:a3:e7:c6:e4:49 > 33:33:ff:00:00:01, ethertype IPv6
(0x86dd), length 86: fe80::2 > ff02::1:ff00:1: ICMP6, neighbor
solicitation, who has fe80::1, length 32
13:01:01.198086 86:d2:45:09:ab:d3 > d2:a3:e7:c6:e4:49, ethertype IPv6
(0x86dd), length 86: fe80::1 > fe80::2: ICMP6, neighbor advertisement,
tgt is fe80::1, length 32
13:01:01.198089 d2:a3:e7:c6:e4:49 > 86:d2:45:09:ab:d3, ethertype IPv4
(0x0800), length 74: 2.2.2.2.4444 > 1.1.1.1.42126: Flags [S.], seq
414776630, ack 2864317902, win 65160, options [mss 1460,sackOK,TS val
185470387 ecr 2553558989,nop,wscale 7], length 0
13:01:01.198132 86:d2:45:09:ab:d3 > d2:a3:e7:c6:e4:49, ethertype IPv4
(0x0800), length 66: 1.1.1.1.42126 > 2.2.2.2.4444: Flags [.], ack 1,
win 502, options [nop,nop,TS val 2553558989 ecr 185470387], length 0
13:01:03.216513 86:d2:45:09:ab:d3 > ff:ff:ff:ff:ff:ff, ethertype IPv4
(0x0800), length 70: 1.1.1.1.42126 > 2.2.2.2.4444: Flags [P.], seq
1:5, ack 1, win 502, options [nop,nop,TS val 2553561008 ecr
185470387], length 4
13:01:03.436382 86:d2:45:09:ab:d3 > ff:ff:ff:ff:ff:ff, ethertype IPv4
(0x0800), length 70: 1.1.1.1.42126 > 2.2.2.2.4444: Flags [P.], seq
1:5, ack 1, win 502, options [nop,nop,TS val 2553561227 ecr
185470387], length 4
13:01:03.656379 86:d2:45:09:ab:d3 > ff:ff:ff:ff:ff:ff, ethertype IPv4
(0x0800), length 70: 1.1.1.1.42126 > 2.2.2.2.4444: Flags [P.], seq
1:5, ack 1, win 502, options [nop,nop,TS val 2553561447 ecr
185470387], length 4

Without flow tables things work fine:

13:05:03.792972 6a:4c:8d:2f:83:ca > 33:33:ff:00:00:02, ethertype IPv6
(0x86dd), length 86: fe80::684c:8dff:fe2f:83ca > ff02::1:ff00:2:
ICMP6, neighbor solicitation, who has fe80::2, length 32
13:05:03.792977 a2:5b:e9:1d:cb:70 > 6a:4c:8d:2f:83:ca, ethertype IPv6
(0x86dd), length 86: fe80::2 > fe80::684c:8dff:fe2f:83ca: ICMP6,
neighbor advertisement, tgt is fe80::2, length 32
13:05:03.792981 6a:4c:8d:2f:83:ca > a2:5b:e9:1d:cb:70, ethertype IPv4
(0x0800), length 74: 1.1.1.1.44964 > 2.2.2.2.4444: Flags [S], seq
946152499, win 64240, options [mss 1460,sackOK,TS val 2553801584 ecr
0,nop,wscale 7], length 0
13:05:03.792989 a2:5b:e9:1d:cb:70 > 33:33:ff:00:00:01, ethertype IPv6
(0x86dd), length 86: fe80::2 > ff02::1:ff00:1: ICMP6, neighbor
solicitation, who has fe80::1, length 32
13:05:03.792992 6a:4c:8d:2f:83:ca > a2:5b:e9:1d:cb:70, ethertype IPv6
(0x86dd), length 86: fe80::1 > fe80::2: ICMP6, neighbor advertisement,
tgt is fe80::1, length 32
13:05:03.792994 a2:5b:e9:1d:cb:70 > 6a:4c:8d:2f:83:ca, ethertype IPv4
(0x0800), length 74: 2.2.2.2.4444 > 1.1.1.1.44964: Flags [S.], seq
3915576590, ack 946152500, win 65160, options [mss 1460,sackOK,TS val
185712982 ecr 2553801584,nop,wscale 7], length 0
13:05:03.793004 6a:4c:8d:2f:83:ca > a2:5b:e9:1d:cb:70, ethertype IPv4
(0x0800), length 66: 1.1.1.1.44964 > 2.2.2.2.4444: Flags [.], ack 1,
win 502, options [nop,nop,TS val 2553801584 ecr 185712982], length 0
13:05:04.256467 6a:4c:8d:2f:83:ca > 33:33:00:00:00:02, ethertype IPv6
(0x86dd), length 70: fe80::684c:8dff:fe2f:83ca > ff02::2: ICMP6,
router solicitation, length 16
13:05:04.896443 a2:5b:e9:1d:cb:70 > 33:33:00:00:00:02, ethertype IPv6
(0x86dd), length 70: fe80::2 > ff02::2: ICMP6, router solicitation,
length 16
13:05:05.806836 6a:4c:8d:2f:83:ca > a2:5b:e9:1d:cb:70, ethertype IPv4
(0x0800), length 70: 1.1.1.1.44964 > 2.2.2.2.4444: Flags [P.], seq
1:5, ack 1, win 502, options [nop,nop,TS val 2553803598 ecr
185712982], length 4
13:05:05.806928 a2:5b:e9:1d:cb:70 > 6a:4c:8d:2f:83:ca, ethertype IPv4
(0x0800), length 66: 2.2.2.2.4444 > 1.1.1.1.44964: Flags [.], ack 5,
win 510, options [nop,nop,TS val 185714996 ecr 2553803598], length 0

I use Linux version 5.15.74.2 on a Windows WSL 2 system
(https://github.com/microsoft/WSL2-Linux-Kernel)


Best,

Christian
