From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: conntrack and ICMP echo replies not showing as ESTABLISHED
Date: Tue, 2 Jan 2018 16:05:11 -0500
Message-ID: <CAMOPTEw27JqkKn1b5Y7-i79SRWn3pX+RNNEh3kvpLQBXzOR27A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=vj6X+9xG8q7MqYrdqFzrhxcOBwNfsInmXJBUSZA6pI0=;
        b=tlkMR/r7PnbSpdxA0bzlSX2jdcMAQGSVhLEDaEwD4AkPy70zqko+PI84uDdRPhxcC9
         La/JDnHnSL/Cak83aU6gsSNLk06s70zk0oxnj4Odl1BvTRRsaXZx/OaNoTSMfFpmksUC
         13NryjJKQ770fKRiyIiUGfvBjl6xIgcjHDU9qFyLdE5Dfv5oEwrfTSF2Q48W/T+TeKuA
         fylguYzzQzSMjXtvQU3sXh9wqu7T7hF60Lr0dKqzk1uyzGnGnuZkuqpuMUi+J9HPSrXi
         /Fmfu3GO0b6E1iLHKMV81RIOkjiNsLeenvn+DcjL0zR3gGbisb+7ncOGITAdUZJrqFqf
         yB7Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Running on Ubuntu 16.04LTS with a fairly basic iptables config (see below).

I'm sure I'm missing something obvious but I am not seeing echo
replies showing as ESTABLISHED when running:

sudo conntrack -E

I see this:

[NEW] icmp     1 30 src=192.168.144.164 dst=192.168.144.254 type=8
code=0 id=1 [UNREPLIED] src=192.168.144.254 dst=192.168.144.164 type=0
code=0 id=1
[UPDATE] icmp     1 30 src=192.168.144.164 dst=192.168.144.254 type=8
code=0 id=1 src=192.168.144.254 dst=192.168.144.164 type=0 code=0 id=1

But I expected to see something more like line 3 where it shows the
connection is ESTABLISHED:

[NEW] tcp      6 120 SYN_SENT src=192.168.144.164 dst=52.12.252.111
sport=10032 dport=443 [UNREPLIED] src=52.72.252.111 dst=216.46.2.101
sport=443 dport=10032
[UPDATE] tcp      6 60 SYN_RECV src=192.168.144.164 dst=52.12.252.111
sport=10032 dport=443 src=52.72.252.111 dst=216.46.2.101 sport=443
dport=10032
[UPDATE] tcp      6 432000 ESTABLISHED src=192.168.144.164
dst=52.12.252.111 sport=10032 dport=443 src=52.72.252.111
dst=216.46.2.101 sport=443 dport=10032 [ASSURED]


I'm new to netfilter/iptables so I may be missing something or may
just be expecting something that doesn't happen.

Can someone point me in the right direction, please?

Thanks for the help!

O.

FILTER TABLE:

Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1      162  9900 ACCEPT     all  --  any    any     anywhere
  anywhere             ctstate RELATED,ESTABLISHED
2        0     0 ACCEPT     all  --  lo     any     anywhere
  anywhere             ctstate NEW
3        2   120 ACCEPT     icmp --  any    any     anywhere
  anywhere             ctstate NEW
4        0     0 ACCEPT     tcp  --  ens192 any     anywhere
  anywhere             tcp dpt:ssh
5       51  4426 LOG        all  --  any    any     anywhere
  anywhere             limit: avg 5/min burst 5 LOG level debug prefix
"iptables denied: "
6     1986  226K DROP       all  --  any    any     anywhere
  anywhere

Chain FORWARD (policy ACCEPT 2 packets, 80 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1     3359 1788K ACCEPT     all  --  ens160 ens192  anywhere
  anywhere             ctstate RELATED,ESTABLISHED
2     4887  896K ACCEPT     all  --  ens192 ens160  anywhere
  anywhere             ctstate NEW,RELATED,ESTABLISHED

Chain OUTPUT (policy ACCEPT 214 packets, 41776 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1       13   780 ACCEPT     icmp --  any    any     anywhere
  anywhere             ctstate NEW,RELATED,ESTABLISHED

NAT TABLE:

Chain PREROUTING (policy ACCEPT 2587 packets, 269K bytes)
num   pkts bytes target     prot opt in     out     source
  destination

Chain INPUT (policy ACCEPT 2 packets, 120 bytes)
num   pkts bytes target     prot opt in     out     source
  destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1      429 22583 MASQUERADE  all  --  any    ens160  anywhere
   anywhere
