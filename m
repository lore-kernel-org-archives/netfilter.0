From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: iptables/when loading a webpage, get subsequent firewall block(s)?
Date: Sat, 14 Nov 2009 08:20:13 -0500 (EST)
Message-ID: <alpine.DEB.2.00.0911140807540.27423@p34.internal.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Using kernel: 2.6.31.5
Using iptables: 1.4.4-2

When I load [some] web pages I get firewall blocks after the page has 
loaded, for example:

$ lynx http://www.hardwaresecrets.com/
..
< page loads fine.. >

A few seconds later, I get a firewall block:

Nov 14 08:09:16 p34 INPUT_BLOCK IN=eth1 OUT= MAC=00:1b:21:43:7b:9e:00:13:f7:5e:77:56:08:00 SRC=69.41.161.35 DST=75.144.35.66 LEN=43 TOS=00 PREC=0x20 TTL=17 ID=0 PROTO=TCP SPT=80 DPT=46184 SEQ=4140823093 ACK=0 WINDOW=0 ACK RST URGP=0

Why does this occur?

At first, I thought it was my firewall script, which is quite large, but then
I used the first one I ever made back in 2001 (very primitive) but it works:
http://installkernel.tripod.com/ipls/files/rc.firewall

This is your most basic firewall configuration, yet, the problem still occurs.

1. I checked ECN settings/MTU, tried a few things there with no success.

This occurs on various web pages but not many; however, I would still like to
find the root cause, tcpdump and corresponding firewall block is shown below:

Firewall block:
Nov 14 08:13:19 p34 INPUT_BLOCK IN=eth1 OUT= MAC=00:1b:21:43:7b:9e:00:13:f7:5e:77:56:08:00 SRC=69.41.161.35 DST=75.144.35.66 LEN=43 TOS=00 PREC=0x20 TTL=17 ID=0 PROTO=TCP SPT=80 DPT=38582 SEQ=3671564445 ACK=0 WINDOW=0 ACK RST URGP=0

The last few packets of a tcpdump:
# tcpdump -XX -S -s 0 -vv -i eth1 -n host 69.41.161.35

08:13:08.482191 IP (tos 0x0, ttl 64, id 27054, offset 0, flags [DF], proto TCP (6), length 40)
     75.144.35.66.38582 > 69.41.161.35.80: Flags [F.], cksum 0x8d3c (correct), seq 4037481634, ack 2462267876, win 25728, length 0
         0x0000:  0013 f75e 7756 001b 2143 7b9e 0800 4500  ...^wV..!C{...E.
         0x0010:  0028 69ae 4000 4006 7c03 4b90 2342 4529  .(i.@.@.|.K.#BE)
         0x0020:  a123 96b6 0050 f0a7 14a2 92c3 39e4 5011  .#...P......9.P.
         0x0030:  6480 8d3c 0000                           d..<..

08:13:08.533200 IP (tos 0x20, ttl 49, id 25885, offset 0, flags [DF], proto TCP (6), length 40)
     69.41.161.35.80 > 75.144.35.66.38582: Flags [.], cksum 0xd89c (correct), seq 2462267876, ack 4037481635, win 6432, length 0
         0x0000:  001b 2143 7b9e 0013 f75e 7756 0800 4520  ..!C{....^wV..E.
         0x0010:  0028 651d 4000 3106 8f74 4529 a123 4b90  .(e.@.1..tE).#K.
         0x0020:  2342 0050 96b6 92c3 39e4 f0a7 14a3 5010  #B.P....9.....P.
         0x0030:  1920 d89c 0000 0000 0000 0000            ............

08:13:19.123062 IP (tos 0x20, ttl 17, id 0, offset 0, flags [none], proto TCP (6), length 43)
     69.41.161.35.80 > 75.144.35.66.38582: Flags [R.], cksum 0x7bc7 (correct), seq 3671564445:3671564448, ack 0, win 0, length 3 [RST cki]
         0x0000:  001b 2143 7b9e 0013 f75e 7756 0800 4520  ..!C{....^wV..E.
         0x0010:  002b 0000 0000 1106 548f 4529 a123 4b90  .+......T.E).#K.
         0x0020:  2342 0050 96b6 dad7 a09d 0000 0000 5014  #B.P..........P.
         0x0030:  0000 7bc7 0000 636b 6900 0000            ..{...cki...

This last packet at 08:13:19 appears to be what gets blocked by iptables,
even though ESTABLISHED,RELATED is in effect.

Why does this occur, why is it not being related?

Some additional details:
1. When lynx is used, I usually get 1 block.
2. When I load the page in firefox I get 3-4 blocks.

It is almost as if netfilter is losing track of a packet or two?

Thoughts/ideas on how to debug/look into this issue further?

Justin.
