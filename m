From: seberino@spawar.navy.mil
Subject: Re: not sure if 'iptables -Z' needed/useful/superfluous here..
Date: Fri, 14 Jan 2005 08:44:02 -0800
Message-ID: <20050114164402.GC8203@spawar.navy.mil>
References: <20050114060327.GA8917@spawar.navy.mil>
	<1105712325.3661.14.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1105712325.3661.14.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason

Thanks for your help.  If I understood you correctly I can do 'iptables -Z'
to zero out all tables at the same time or I can do

iptables -t filter -Z
iptables -t mangle -Z
iptables -t nat    -Z

to do tables one at a time right?

Chris

On Fri, Jan 14, 2005 at 09:18:45AM -0500, Jason Opperisano wrote:
> On Fri, 2005-01-14 at 01:03, seberino@spawar.navy.mil wrote:
> > When I want to start from scratch in my firewall
> > script I usually do this:
> >
> > $IPTABLES -t filter -F
> > $IPTABLES -t mangle -F
> > $IPTABLES -t nat    -F
>
> which flushes all the rules out of those tables
>
> > $IPTABLES -t filter -X
> > $IPTABLES -t mangle -X
> > $IPTABLES -t nat    -X
>
> which deletes all chains in those tables.
>
> > I'm not sure if -Z switch does anything useful after this violent
> > scrubbing of my iptables...
>
> it still does what it would do any other time.
>
> > $IPTABLES -Z
> >
> > By the way... is this correct/better/wrong??
>
> if your intention is to zero your byte counters--then it's correct.  if
> your intention is to retain your byte counters across reloads--then it's
> wrong.
>
> > $IPTABLES -t filter -Z
> > $IPTABLES -t mangle -Z
> > $IPTABLES -t nat    -Z
> >
> > I read man page on iptables but it still was not clear if I need
> > -Z to 'reset the byte count' and other stuff like it says it will do.
>
> people that rely on byte counters for accounting type uses probably
> don't use -Z when they reload their rules.  i only use the counters as
> an indication of rule hits--so i do reset the counters every time i
> reload my rules.  but it's not a question of right or wrong.
>
> -j
>
> --
> "The only monster here is the gambling monster that has enslaved your
>  mother! I call him Gamblor, and it's time to snatch your mother from
>  his neon claws!"
> 	--The Simpsons
>
>

--
_______________________________________

Christian Seberino, Ph.D.
SPAWAR Systems Center San Diego
Code 2872
49258 Mills Street, Room 158
San Diego, CA 92152-5385
U.S.A.

Phone: (619) 553-9973
Fax  : (619) 553-6521
Email: seberino@spawar.navy.mil
_______________________________________

