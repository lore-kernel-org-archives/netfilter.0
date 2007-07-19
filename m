From: "Alex Wright" <alex@xeentech.com>
Subject: Re: No masquerade?
Date: Thu, 19 Jul 2007 14:11:10 +0100 (BST)
Message-ID: <1139.82.7.239.196.1184850670.squirrel@xeentech.com>
References: <5de7cdb50707131701y2584d4f3q2cddbc9206e8aadb@mail.gmail.com>
Reply-To: alex@xeentech.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5de7cdb50707131701y2584d4f3q2cddbc9206e8aadb@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?B=B3a=BFej_=A6lusarek?= <blazej.86@gmail.com>
Cc: netfilter@lists.netfilter.org

> Hello all, I want to ask for help in setting a simple home network, as
> it became more complicated than I thought :( The idea is something
> like that:
>
> [ Gateway (192.168.100.1) ] <-- Wireless connection ---> [ My PC
> (192.168.100.134 / 10.0.0.1 In my home network) ] <-- Crossed LAN
> cable --> [ My laptop (10.0.0.249) ]
>
> As you can figure out, the Internet comes from gateway :) I've set up
> everything on my PC : DHCP, DNS and, of course, iptables. Everything
> seems to work except the masquerade :( When I send an icmp packet from
> my laptop, everything works fine - I can ping google.com for example;
> two computers can also communicate (FTP / SSH) but I cannot get any
> TCP (or any other packet) from the outside :( My iptables script is:
>
> #!/bin/bash
> iptables -F
> iptables -F -t nat
> iptables -F -t mangle
> iptables -F -t filter
> iptables -X
>
>
> iptables -t filter -A FORWARD -p icmp   -j ACCEPT
> iptables -t filter -A FORWARD  -p tcp -j ACCEPT
> iptables -t nat -A POSTROUTING -p icmp  -j MASQUERADE
> iptables -t nat -A POSTROUTING -p tcp  -j MASQUERADE

I think you need more arguments to MASQ. My script has:
/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth1 -j MASQUERADE

I think it needs to know which interface is the NAT side and which
interface is the public.

>
> What gives me
>
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     icmp --  anywhere             anywhere
> ACCEPT     tcp  --  anywhere             anywhere
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> You can find some other example at
> http://wpk.p.lodz.pl/~bejus/wireshark.txt . It seems to me that
> packets from laptop are routed to www.google.com, they return, but
> they aren't sent back to my Laptop.
> Can this be caused by 64bit system on my PC box?  Any help will be
> appreciated.
>
>


