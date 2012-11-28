From: Giles Coochey <giles@coochey.net>
Subject: Re: Mark traffic on one machine, match on another
 =?UTF-8?Q?machine=3F?=
Date: Wed, 28 Nov 2012 12:54:44 +0000
Message-ID: <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
Reply-To: <giles@coochey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Kath <steven@vyatta.com>
Cc: Jack Bates <uo4zau@nottheoilrig.com>, netfilter@vger.kernel.org

On 28-11-2012 05:25, Steven Kath wrote:
>> Is there a way to mark traffic on one machine and match the
>> mark on another machine? so I can classify traffic on the
>> proxy server and shape it on the router?
>
> This question is a good example of the rationale for the
> TOS/DSCP header on IPv4 packets. netfilter/iptables are
> quite capable of matching and manipulating the DSCP field,
> as are some proxy servers.
> --

+1 to above.

Alternatively, you could route the packet from the proxy to a 
different, secondary IP on the router. The router could then shape all 
the traffic that arrives on the secondary IP. You can achieve the 
secondary IP with sub-interfaces, secondary IP in the same subnet, or 
separate VLAN interfaces

I don't think there is any net-filter tagging, in the way that you can 
tag packets in rules while it passes internally through the proxy, that 
would be visible externally to the router.
