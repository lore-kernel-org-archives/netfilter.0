From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: port forwarding
Date: Sat, 7 Dec 2002 18:16:21 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1585.192.168.7.41.1039245381.squirrel@iw.k1k2.com>
References: <285598680.20021205235627@rtsnet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <285598680.20021205235627@rtsnet.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

If they want to play on an external server then there is
nothing required other than standard masquerading/nat

HOWEVER, if you resrtict outgoing (and return) ports then
you need to allow UDP on port 21705
(I'm not sure if TCP is used at all?)

WARNING
if 3 or 4 people do a standard full server update at the
same time it will fill your conntrack table and you will
start dropping other connections for a while

Counterstrike is beyond the tiny limitation of a 64K conntrack
table and since you cannot specifically say to timeout the
counterstrike server update connections quickly (due to the
fact that you will never need to do this - yeah I know that's
wrong but ... that's what the netfilter developers say)
you end up filling the conntrack table

You need to be able to set it to handle about 20,000 connections
per user that is using Counterstrike but I think it is limited
to only 64K - but I'm not 100% certain.

Anyone know for sure if there is a small limit in the size of
the conntrack table? Hopefully there isn't ... but others have
said otherwise. Maybe that has change recently?

> Hello all,
> 
> Players at my office asks me to give them access to outside
> counterstrike server, UDP 21705. unfortunatelly, i am brand new in
> iptables, so i've read the docs and started make rules, but they does
> not work.
> Then i've tried simple
> root@woody~/iptables>cat 1.sh
> #!/bin/sh
> echo 1 > /proc/sys/net/ipv4/ip_forward
> iptables -v -F -t nat
> iptables -v -F
> iptables -v -A FORWARD -p tcp --dport 205 -j ACCEPT
> iptables -v -t nat -A PREROUTING -p tcp --dport 205 -j DNAT
> --to-destination 172.17.32.12:25
> 
> , then telnet to woody:205 and there is no refusal and no answer.
> 
> root@woody~/iptables>cat /proc/net/ip_conntrack
> [...]
> tcp      6 118 SYN_SENT src=172.17.32.5 dst=172.17.144.110 sport=2020
> dport=205 [UNREPLIED] src=172.17.32.12 dst=172.17.32.5 sport=25
> dport=2020 use=1
> 
> Can someone please tell me, what i am doing wrong? why [UNREPLIED]?
> should i create rule to pass packets back from 172.17.32.5 to client?
> 
> p.s. iptables v1.2.6a, kernel 2.4.18
> 
> Best wishes,
> Maxim                          mailto:mak@rtsnet.ru


