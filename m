From: "=?ISO-8859-2?Q?B=B3a=BFej_=A6lusarek?=" <blazej.86@gmail.com>
Subject: No masquerade?
Date: Sat, 14 Jul 2007 02:01:03 +0200
Message-ID: <5de7cdb50707131701y2584d4f3q2cddbc9206e8aadb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=arMgiMEtnETGe9dv4OCOTOxxyOP2VSnaXNwTQhjFvQNY/7MnIvZSR9wXrKq86e7AkpFKVCwqB6cPiAEDwwneuylz5WW2V9GtVG6zePcVAv+TCSBgdaxavjvvGR+xRM4/zu9vITLKFnxW2HtN349TtW0/HUPIIw8QWPdNAmJOQ04=
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all, I want to ask for help in setting a simple home network, as
it became more complicated than I thought :( The idea is something
like that:

[ Gateway (192.168.100.1) ] <-- Wireless connection ---> [ My PC
(192.168.100.134 / 10.0.0.1 In my home network) ] <-- Crossed LAN
cable --> [ My laptop (10.0.0.249) ]

As you can figure out, the Internet comes from gateway :) I've set up
everything on my PC : DHCP, DNS and, of course, iptables. Everything
seems to work except the masquerade :( When I send an icmp packet from
my laptop, everything works fine - I can ping google.com for example;
two computers can also communicate (FTP / SSH) but I cannot get any
TCP (or any other packet) from the outside :( My iptables script is:

#!/bin/bash
iptables -F
iptables -F -t nat
iptables -F -t mangle
iptables -F -t filter
iptables -X


iptables -t filter -A FORWARD -p icmp   -j ACCEPT
iptables -t filter -A FORWARD  -p tcp -j ACCEPT
iptables -t nat -A POSTROUTING -p icmp  -j MASQUERADE
iptables -t nat -A POSTROUTING -p tcp  -j MASQUERADE

What gives me

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

You can find some other example at
http://wpk.p.lodz.pl/~bejus/wireshark.txt . It seems to me that
packets from laptop are routed to www.google.com, they return, but
they aren't sent back to my Laptop.
Can this be caused by 64bit system on my PC box?  Any help will be appreciated.

