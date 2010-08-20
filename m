From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bridges
Date: Fri, 20 Aug 2010 18:32:39 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008201824140.7497@obet.zrqbmnf.qr>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk>
 <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk>
 <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr> <4C6E4550.1020808@plouf.fr.eu.org> <alpine.LSU.2.01.1008201107550.18181@obet.zrqbmnf.qr>
 <4C6E583D.7070706@plouf.fr.eu.org> <4C6EA72E.9050501@riverviewtech.net> <alpine.LSU.2.01.1008201817560.7497@obet.zrqbmnf.qr> <4C6EAC80.1030209@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6EAC80.1030209@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Friday 2010-08-20 18:25, Grant Taylor wrote:

> On 08/20/10 11:18, Jan Engelhardt wrote:
>> ARP proxying with ebtables, basically. (Though there is also a routing-level
>> arp proxy, but somehow it does not feel as steady.)
>
> ARP proxying with EBTables?  Would you mind providing an example use?

ebtables -t broute ! -p arp -j DROP
ebtables -t nat -A PREROUTING -i br0 \
	-p arp --arp-opcode request --arp-ip-dst mysubnet/CIDR \
	-j arpreply --arpreply-mac \
	$(cat /sys/class/net/br0/address)

Something like that it was.

ARP proxying can be helpful when your entire mysubnet/CIDR is 
direct-attached at the ISP's end but you don't want to bridge your 
network (for that would mean more ebtables and iptables rules) but 
instead force routing.
