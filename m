From: Torsten Luettgert <t.luettgert@pressestimmen.de>
Subject: Re: [LARTC] Interesting article about punching holes in firewalls...
Date: Mon, 25 Dec 2006 22:43:05 +0100
Message-ID: <1167082986.2358.9.camel@elida.cbxnet.de>
References: <45860240.2040102@riverviewtech.net>  <458A3E69.50600@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <458A3E69.50600@gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>

On Do, 2006-12-21 at 08:57 +0100, Carl-Daniel Hailfinger wrote:
> Grant Taylor wrote:
> > I ran across an interesting article
[...]
> This is wrong on so many levels. Please reread the article. Then read
> the source code of your favourite firewalling system. All of those
> "attacks" require cooperation from your side. And if you (or someone
> using the computer you try to protect) are actively cooperating with
> the attacker, "fixing" the firewall should be the least important of
> your problems.

Very true... the described method isn't an "attack", it's just a way to
facilitate connections between two NATed partners.

> I'm still seeing people who absolutely want to deploy the iptables
> UNCLEAN match to "make their network more secure".

This makes me curious: wouldn't UNCLEAN improve security? Afair, the
main argument against UNCLEAN (and grounds for its removal) was that
it broke ECN at some time in the past, and that "something like this
could happen again".

Personally, I like the idea of rejecting anything that violates the
existing standards.

Regards,
Torsten



