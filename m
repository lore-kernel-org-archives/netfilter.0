From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: next topic:  --limit and --burst-limit
Date: Thu, 31 Oct 2002 06:00:51 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210310553200.29866-100000@localhost.localdomain>
References: <1036052695.21032.21.camel@elendil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036052695.21032.21.camel@elendil>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>


  ok, i think i've got a handle on the meaning of --limit and
--limit-burst, but there's still one thing that puzzles me.
some of the examples i've seen of this on the net seem to
be backwards.

  from "man iptables", we have that the "limit" module:

  "matches at a limited rate using a token bucket filter.  A rule
   using this extension will *match* [my emphasis] until this
   limit is reached (unless the '!' flag is used)."

this suggests that, if you add a rule incorporating a limit,
a match would imply that you *haven't* exceeded the limit and
that you don't necessarily want to take any countermeasures.

  from one tutorial, here's the lines that deal with 
syn-flooding protection:

  iptables -N syn-flood
  iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
  iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
  iptables -A syn-flood -j DROP
  
this seems to match the man page -- in the "syn-flood" user-defined
chain, if you match the limit rule, you're still fine and you return.
otherwise, you drop the packet that forced you to exceed the limit.

  i'm harping on this since i've seen examples in which a matching
rule incorporating limit explicitly drops the packet, or LOGs it
with "Packet dropped, limit exceeded."  which seems backward.
(and no, they didn't have a '!' to negate the rule.)

  so, have i understood this correctly?  thanks for your patience.

rday


