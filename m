From: Ludo Stellingwerff <ludo@protactive.nl>
Subject: Re: Some more IPSec - IPTables issues?
Date: Thu, 27 May 2004 13:06:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085656011.3861.84.camel@laptop.stwerff.xs4all.nl>
References: <1085648121.3864.58.camel@laptop.stwerff.xs4all.nl>
	 <20040527102635.GA18523@alldas.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040527102635.GA18523@alldas.org>
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
To: Stefan Wagner <sw@alldas.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 2004-05-27 at 12:26, Stefan Wagner wrote:
> Hi,
> 
> > I need this functionality to be able to create a VPN-tunnel between to
> > networks, one of which is behind a dynamic IP-address. I have a working
> > solution by (dirty)-hacking Racoon, but that hack is unmaintainable.
> 
> What solution is that ?
> 
> Cheers,

When Racoon would receive a request for a policy that existed to a
different gateway, Racoon blocked the request. The Error message was
that it would need to nest policies.
I changed the test in racoon to detect this situation and start an
external script. A bit like the routing-scripts in FreeSWan.

This script would have the new remote ipsec-gateway as a parameter, and
reset the policy to this new adres. The result is an ipsec-tunnel
between two gateway's but with one end dynamic.

But this is a really dirty trick, because I reset the complete network
to catch this new connection. (including new firewall rules, SPD
policies and a racoon restart:( )

Unmaintainable!

The problem is that an Ipsec tunnel with an dynamic gateway is undefined
in the standard.
Instead I would like to use one end as a roadwarrior host, masquerading
the remote network. This will leave me with a uni-directional tunnel,
but that is good enough for me. 

Trouble is the way ipsec and SNAT function at this moment. It doesn't
yet work. 

I thought of 3 different solutions:

1 Using the userland QUEUE target after the SNAT and reinject the
packages before the IPSEC-filter. Sounds like a possible workaround.

2 The Freeswan virtual devices solution, but most people seem to agree
that that's not a clean design.

3 Allowing SNAT in the PREROUTING chain, too. That way I should be able
to SNAT before IPSEC.

Any more suggestions?

Greetings,

Ludo.




