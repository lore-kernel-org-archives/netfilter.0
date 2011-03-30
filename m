From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Iproute2 SNAT SIP VoIP
Date: Wed, 30 Mar 2011 22:18:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1103302212430.14889@obet.zrqbmnf.qr>
References: <AANLkTinPEik0KQ5EU+noy6Y5RAq97qWwR-oJn51y-P_h@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinPEik0KQ5EU+noy6Y5RAq97qWwR-oJn51y-P_h@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Deschamps <deepjm@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-03-30 21:55, Bruno Deschamps wrote:

>The modules are active ip_conntrack_sip and ip_nat_sip

There have been numerous fixes to the SIP modules. It is advised to 
update the kernel, especially since you seem to be running a terribly 
outdated one.

>By default the output for the SIP is made by link1. When falls the
>first link I do aSNAT for leaving for my destination link2.

That would break the datagram stream, because the globally visible
tuple will no longer be the same.

>What happens is that when it happens I monitor the network interface
>eth2 with tcpdump and it still leaving the source as the link1 link2
>and not as it should be. Evenas I mark the target 0x2 table mangle and
>a SNAT in nat table

NAT is applied to a NF connection, and all its packets. Since the
pseudo connection does not end / a new NFCT does not start, there
will be no automatic update of the tuples.
