From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: multiprimary conntrackd setup
Date: Mon, 23 Jun 2008 11:09:29 +0200
Message-ID: <485F6849.7030606@netfilter.org>
References: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>	 <48590828.2060206@netfilter.org> <279239c70806222346r834dd7bpa6e260794237cdba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <279239c70806222346r834dd7bpa6e260794237cdba@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Vieira <sebvieira@gmail.com>
Cc: netfilter@vger.kernel.org

Sebastian Vieira wrote:
> On Wed, Jun 18, 2008 at 3:05 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> What kind of active-active? There are two kind:
> 
> -snip-
> 
>> b) asymmetric or packet-based: typical case of OSPF setups, there is no
>> guarantees that the packet is handled by the same firewall replica as
>> OSPF may change the routes at any time. In that case, you have to enable
>> the CacheWriteThrough. However, from the design point of view,
>> conntrackd suits better in the scenario a).
> 
> I'm using the asymmetric setup. Two firewalls connected with BGP to
> the service provider, and as you mentioned, no way of knowing which
> firewall handles which packet.
> 
> But the funny thing is, that it's working now :)  Yes, i enabled the
> CacheWriteThrough option, but i was testing with ICMP's. Later i
> learnt that ICMP is a kind of unreliable protocol because when i
> tested it with a simple tcp connection it worked fine.

As you said, replicating ICMP does not make too much sense to me either.

Some considerations on this setup: There's a shortcoming in the
asymmetric approach. conntrackd performs much better in a flow-based
multiprimary setup.

The multipath setup that you're using works fine iif the RTT between the
FW cluster and the server peer is greater than the time to send and
inject the state change from FW1 to FW2. Otherwise, you'll probably
notice a slow down in the connection setup. This condition fulfills if
the server peer is in the Internet (DSL RTT is ~30 ms and the
synchronization messages barely take 0.01 ms here). This limitation
happens due to the asynchronous nature of the solution. The design of
conntrackd supports this scenario but flow-based performs much better.

In short: BGP works at packet level, when the stateful firewalling
operate at flow level.

> I'm still fiddling around a bit with the ip_conntrack_max sysctl
> setting because i tend to get dropped packets. Also `conntrackd -s`
> indicated that for both nodes it failed to destroy connections on
> internal cache. These numbers roughly match  the other node's
> succesfully destroyed connections:
> 
> node1:
> connections destroyed:		    31473050	failed:	        7334
> 
> node2:
> connections destroyed:		        7441	failed:	    31475657
> 
> Is this something i need to worry about?

Well, I need to know which replication approach you're using. Anyhow,
I'll try to do several assumptions from the information that you've posted.

Basically, that output means that node1 has try to destroy 7334
connections that were not available it its cache. Since you have trimmed
the output, I don't know if it's the internal or external cache.
Assuming that the information that you've posted talks about node1's
internal cache and node2's external cache:

1) node1 did not resynchronize against the kernel conntrack table at
startup (you forgot to include conntrackd -R in your scripts for force
resynchronization between internal cache <-> kernel conntrack table).
Use conntrackd -i to check if the output is similar to conntrack -L.

2) node2 has try to destroy several connections in its external cache
that were not available. This means that node2 did not issue a
conntrackd -n to resynchronize its external cache to node1's internal
cache (assuming that you're using FTFW or NOTRACK approach).

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
