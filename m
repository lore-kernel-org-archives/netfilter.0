From: seberino@spawar.navy.mil
Subject: Re: How multiple PCs on private LAN possible if incoming is DNAT'd
	to *same* server *always*?
Date: Thu, 3 Feb 2005 14:59:36 -0800
Message-ID: <20050203225936.GA31268@spawar.navy.mil>
References: <20050203172500.GB29677@spawar.navy.mil>
	<20050203173506.GA4619@bender.817west.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050203173506.GA4619@bender.817west.com>
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
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

>   iptables -t nat -A PREROUTING -i $EXT_IF \
>     -j DNAT --to-destination $SINGLE_SERVER_IP

> sorta.  keep in mind that rules in "-t nat" are only applied to packets
> with state NEW--this is probably the piece you're missing.

Jason

I appreciate the care you've put into making strong iptables scripts
and helping people on this list.  I understand your explanation
but I don't see how a newbie would have known that the iptables
rule above is to be ONLY applied to NEW state packets.
Doesn't EVERY incoming packet go through PREROUTING?? And hence,
the rule above will be applied to ALL incoming packets right?!?

I don't see any place above where it says '**this only applies
to NEW state packets**'.  You must be right but I'm just wondering
how I would have figured that out on my own. :)

Chris

