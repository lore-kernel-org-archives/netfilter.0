From: Casper Gripenberg <casper.gripenberg@kotiportti.fi>
Subject: REJECT wih tcp-reset not working (very weird problem)
Date: Mon, 24 Mar 2008 21:03:10 +0200
Message-ID: <47E7FAEE.8090002@kotiportti.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hi..I have a very simple bridging firewall setup:

                                BRIDGE
computer1 <-internet-> [eth1 <-> br0 <-> eth0] <-> computer2

Computer 1 and 2 and the bridge all have assigned public
internet IPs.

What I want to do at the bridge is REJECT any packet in
any direction going anywhere with port 5555 as dst with
a tcp-reset.

So I do this:

--------------------------------------------------------
iptables -F   # flush all rules
iptables -X   # delete all chains

RST='REJECT --reject-with tcp-reset'

iptables -A INPUT -p tcp --dport 5555 -j LOG --log-prefix "INPUT: "
iptables -A INPUT -p tcp --dport 5555 -j $RST

iptables -A FORWARD -p tcp --dport 5555 -j LOG --log-prefix "FORWARD: "
iptables -A FORWARD -p tcp --dport 5555 -j $RST
--------------------------------------------------------

Seems simple enough....But it doesn't work.

For testing I have a server on port 5555 running on all
three machines.

I then test all possible connection combinations, of which
these work:

1: Connect from computer1 to bridge    -> "connection refused"
2: Connect from computer2 to bridge    -> "connection refused"
3: Connect from computer2 to computer1 -> "connection refused"

But this one does not:

4: Connect from computer1 to computer2

In this case the connection just hangs, like the firewall
just did a DROP instead of a REJECT. But since I log the
firewall rules I know the REJECT rule is hit.

So next I tcpdump on eth1 while I try to connect from
comp1 to comp2. Here:

C1.C1.C1.C1 is the IP for computer1
C2.C2.C2.C2 is the IP for computer2

 > tcpdump -ln -e -vvv -i eth1 port 5555

20:15:58.718577 00:03:fa:91:27:ee > 00:0d:56:af:17:47,
    ethertype IPv4 (0x0800), length 78:
    (tos 0x0, ttl 252, id 35665, offset 0, flags [DF], proto TCP (6), length 64)
    CC.CC.CC.CC.22096 > C2.C2.C2.C2.5555: S,
    cksum 0xf8c1 (correct), 1023220179:1023220179(0)
    win 16384
    <mss 1460,nop,nop,sackOK,nop,wscale 0,nop,nop,timestamp 880739838 0>

20:15:58.718612 00:1d:60:48:d9:b2 > 00:03:fa:91:27:ee,
    ethertype IPv4 (0x0800), length 54:
    (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    C2.C2.C2.C2.5555 > C1.C1.C1.C1.22096: R,
    cksum 0xed0d (correct), 0:0(0) ack 1023220180 win 0

00:03:fa:91:27:ee is the hwaddr of the internet
                   router closest to eth1

00:0d:56:af:17:47 is the hwaddr of computer2
00:1D:60:48:D9:B2 is the hwaddr of the bridge

So..looks like the bridge is sending the tcp-reset, but
it never arrives at computer1. Why!? I even tcpdump on
computer1...it never gets the reset packet, even though
the tcpdump output above says it's sent.

I think the problem is the hwaddr of the reset packet has
been changed to the bridge. The correct hwaddr should be
computer2.

Now since the hwaddr was changed perhaps the internet
router closest to eth1 rejects the packet as some sort
of ARP spoof? I don't have control of this router, so
there is no way to find out.

Is this really proper behaviour from the bridge? It's
not acting very "transparently" in this case, since the
hwaddr is modified in the reply. It should not modify
it. The hwaddr source of the reply should be the same
as the destination hwaddr of the original SYN packet.

Is there any way to fix this? Any way to get around
this? Possibly a bug?

 > uname -a
Linux bridge 2.6.22-14-generic #1 SMP
   Tue Dec 18 08:02:57 UTC 2007 i686 GNU/Linux

 > iptables --version
iptables v1.3.6

Casper


