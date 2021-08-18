From: Florian Westphal <fw@strlen.de>
Subject: Re: NAT - how external source port is selected
Date: Wed, 18 Aug 2021 16:46:15 +0200
Message-ID: <20210818144615.GQ607@breakpoint.cc>
References: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel <tech@tootai.net>
Cc: netfilter@vger.kernel.org

Daniel <tech@tootai.net> wrote:
> how on a NAT firewall server using iptables or nftables, are the external
> source ports choosen ? I would say range is 1024-65535 but if for instance I
> use port 5060 for SIP this one can not be used as source port. Is there a
> table of at time used ports ?

Are you talking about SNAT/MASQUERADE?

It will try to use whatever port is used.  If the source address
replacement results in a collision, it tries to pick a different source
port between 1024 and 65535.

> Also, SNOM phones are systematically using port 2048 as source port of the
> WAN ip. Is there a mechanism to allow such behavior ?

What do you mean? The initiator is free to pick whatever source port they like.
