From: Thomas Jacob <jacob@internet24.de>
Subject: Re: INVALID state
Date: Thu, 13 Nov 2008 13:48:05 +0100
Message-ID: <1226580485.19007.38.camel@enterprise.ims-firmen.de>
References: <491b53e3.2a528c0a.1c10.385b@mx.google.com>
	 <1226574837.19007.19.camel@enterprise.ims-firmen.de>
	 <200811131316.57097.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200811131316.57097.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Paasch <christoph.paasch@gmail.com>
Cc: Gilad Benjamini <gilad.benjamini@gmail.com>, netfilter@vger.kernel.org

> In xt_state.c->match(...) I saw, that it detects the state XT_STATE_INVALID if 
> there is no connection associated to the packet (skb->nfct). But in the ICMP 

To clarify, I wasn't making any specific claims related to Gilad's
problem on how exactly ICMP connections fail with an asymmetric routing
setup, just that asymmetric routing causes problems like this in
general.
  
However, an initial SYN-ACK packet in a TCP connection for instance,
definitely is considered invalid (see the tcp_conntracks array
in netfilter/nf_conntrack_proto_tcp.c).

For ICMP packets, I think icmp_new in nf_conntrack_proto_icmp.c doesn't
allow an echo request for the creation of a new conntrack, but I'm not
so sure.

But I was also having something like this in mind:

-P FORWARD DROP
-A FORWARD -m state --state ESTABLISHED, RELATED -j ACCEPT
-A FORWARD --state NEW -p icmp --icmp-type echo-request

If your initial packet echo-request doesn't pass through the
firewall, the echo reply will be blocked, even if the conntrack
code wouldn't classify a sole echo reply as INVALID.

