From: Bob Keyes <bob@sinister.com>
Subject: Re: assymetrical routing, iptables problem.
Date: Thu, 3 Oct 2002 13:36:08 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.BSO.4.33L0.0210031331220.12795-100000@sinister.com>
References: <1033627561.652.9.camel@elendil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1033627561.652.9.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org



On 3 Oct 2002, Cedric Blancher wrote:

> You really should use a GRE tunnel between your two routers and route
> your 1.1.1.1 IP directly through it. I use it quite often when migrating
> hosts from one location to another (physically or logically) without
> havin to change IP addresses.

What I want here is a half-tunnel, of a sort. GRE Tunnels does not do
this, as far as I can tell.

>
> Note that you can also use packet MARK packets to identify them using
> mangle table which prevents you to alter layer 4 stuff. You can also use
> this MARK to route packets using iproute (see LARTC).
>
> > The problem is, the latter half of this doesn't work. What I really want
> > is SNAT in OUTPUT, as I believe that POSTROUTING won't touch packets that
> > originate on the local machine.
>
> SNAT on POSTROUTING will also affect locally originated packets as they
> get through this chain.

OK, this is good to know, there is something else going wrong than I had
thought.



