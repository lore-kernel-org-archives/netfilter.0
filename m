From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Sun, 27 Jun 2010 21:14:59 -0500
Message-ID: <4C2805A3.4070801@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>	<4C262DA2.1040103@riverviewtech.net> <AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Anatoly Muliarski wrote:
> Thank you for your response.

You are welcome.

> Unfortunately, I need to redirect the traffic from all VLANs. In 
> other words, the task comes to selective redirecting of the traffic 
> from all VLANs to a specified one. The redirecting must be 
> unidirected, only for the traffic that comes from all VLANs.

Will you please provide an example of what redirection you are talking 
about?

Remember that you can set a default policy of DROP in your BROUTING 
chain to cause the packets to be routed like normal.  So any frames that 
you don't want bridged will simply be routed like normal.  There by only 
bridging the frames that you want to.

> Yes, it works now, but for the other purpose.

Ok.

> That would work but I need to redirect traffic that is not destined 
> to VLAN 9 and ARP-proxy trick does not work for this case.

So you are going to have to intercept the traffic and alter the 
destination MAC (and possibly IP) address(es)?

I believe that EBTables can do that.  If not, you can probably have 
IPTables work on bridged frames, and I know that it will do that.

> Thanks for the ideas. I'll try it. The main problem is to avoid 
> unnecessary bridging attempts for all VLANs( as it would waste CPU 
> time for try to transmit a packet to a hundred VLAN ). Another way is 
> to write a target extension to ebtables to replace a vlan tag to a 
> desired one, but as I need to do it selectively I need ebtables' 
> capabilities to analyze vlan-tagged packets and there are no ones ...

I'm still not sure that you can't do what you want to do with EBTables 
and / or IPTables.

Remember that EBTables will learn where MAC addresses are and won't 
flood frames out (go in to dumb hub mode).

> Or to write something like a udp-broadcast-relay daemon...

I don't think you will be bridging too many packets.  (That is unless I 
really misunderstand what you are wanting to do.)

Can you provide an example (sanitized if need be) of what you are trying 
to do?  Including (hypothetical) source and destination MAC and IP 
addresses on either side of the bridge?



Grant. . . .
