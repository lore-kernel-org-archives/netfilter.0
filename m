From: Tanguy Ropitault <tanguy.ropitault@telecom-bretagne.eu>
Subject: SNAT and QUEUE target problem for IPv4 in IPv6 encapsulation
Date: Tue, 15 Dec 2009 10:44:14 +0100
Message-ID: <4B275A6E.7000006@telecom-bretagne.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

SNAT and QUEUE target

Hi,
I have the following problem. I am implementing an IPv4 in IPv6 
encapsulation solution. For that, I'm using libipq (I know that IPv4 in 
IPv6 tunnel exists in Linux but I have to do it by myself for specific 
purposes). So I have a router and a client in my architecture. The 
client uses private addressing and the routeur has its ingress interface 
in private addressing and its egress interface in public addressing.


                              eth0                                 eth1
[Client]                 [                   Router               ]
Private @V4        Ingress Private @V4             Egress: Public @V4 
192.109.118.27
192.168.1.2        192.168.1.1                            @V6 x:y:z::1

The goal is to encapsulate Client traffic IPv4 traffic in the @V6 of the 
router. I need also to do SNAT from the client private address to router 
public address. My primary idea was to use iptables with snat target.
So for example:

iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to-source 
192.109.118.27

This rule does not work. After browsing on iptables doc, I figured out 
that it's normal because traffic is forwarded (I activate forwarding in 
proc/sys/net) from eth0 to eth1 so it never hits POSTROUTING target.

So I use this rules:

iptables -t nat -A POSTROUTING -p tcp -o eth1 -j SNAT --to-source 
192.109.118.27

So OK, my IPv4 traffic is correctly SNATed but the problem is that I 
still have to do my encapsulation. For that, normally, I add a rule 
which said, put in the queue traffic which comes from 192.168.1.2 and 
then I handle encapsulation with libipq the encapsulation. But 
POSTROUTING is the last target hit before leaving the interface so if 
the traffic is SNATed, I can't put SNATed traffic in QUEUE target. And 
conversely, If I put the rule which said to put the IPv4 traffic in 
QUEUE, the traffic will be encaspulated but never SNATed because it 
becomes IPv6 traffic...
The solution will be to SNAT in PREROUTING target but after googling, it 
seems to be impossible. Does anyone has a clue for this problem?

Cheers,
Tanguy

