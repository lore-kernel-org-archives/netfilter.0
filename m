From: Jason Opperisano <opie@817west.com>
Subject: Re: How multiple PCs on private LAN possible if incoming is DNAT'd
	to *same* server *always*?
Date: Thu, 03 Feb 2005 18:11:38 -0500
Message-ID: <1107472297.3866.12.camel@hubcap.ljm.dom>
References: <20050203172500.GB29677@spawar.navy.mil>
	<20050203173506.GA4619@bender.817west.com>
	<20050203225936.GA31268@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050203225936.GA31268@spawar.navy.mil>
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
To: netfilter@lists.netfilter.org

On Thu, 2005-02-03 at 17:59, seberino@spawar.navy.mil wrote:
> >   iptables -t nat -A PREROUTING -i $EXT_IF \
> >     -j DNAT --to-destination $SINGLE_SERVER_IP
> 
> > sorta.  keep in mind that rules in "-t nat" are only applied to packets
> > with state NEW--this is probably the piece you're missing.
> 
> Jason
> 
> I appreciate the care you've put into making strong iptables scripts
> and helping people on this list.  I understand your explanation
> but I don't see how a newbie would have known that the iptables
> rule above is to be ONLY applied to NEW state packets.

sorry if it sounded like i was reprimanding you for not knowing--i
really just meant to let you know.  i don't expect that a newbie would
know that--that why i responded to your post.

> Doesn't EVERY incoming packet go through PREROUTING?? And hence,
> the rule above will be applied to ALL incoming packets right?!?

your statement is true for -t mangle PREROUTING, -t nat is not traversed
by every packet, no.

> I don't see any place above where it says '**this only applies
> to NEW state packets**'.  You must be right but I'm just wondering
> how I would have figured that out on my own. :)

i probably read it somewhere at some point...maybe in that building
linux firewalls book by that guy...

-j

--
"The only monster here is the gambling monster that has enslaved your
 mother! I call him Gamblor, and it's time to snatch your mother from
 his neon claws!"
	--The Simpsons


