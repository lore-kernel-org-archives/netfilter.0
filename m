From: Jason Opperisano <opie@817west.com>
Subject: Re: not sure if 'iptables -Z' needed/useful/superfluous here..
Date: Fri, 14 Jan 2005 09:18:45 -0500
Message-ID: <1105712325.3661.14.camel@hubcap.ljm.dom>
References: <20050114060327.GA8917@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114060327.GA8917@spawar.navy.mil>
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

On Fri, 2005-01-14 at 01:03, seberino@spawar.navy.mil wrote:
> When I want to start from scratch in my firewall
> script I usually do this:
> 
> $IPTABLES -t filter -F
> $IPTABLES -t mangle -F
> $IPTABLES -t nat    -F

which flushes all the rules out of those tables

> $IPTABLES -t filter -X
> $IPTABLES -t mangle -X
> $IPTABLES -t nat    -X

which deletes all chains in those tables.

> I'm not sure if -Z switch does anything useful after this violent
> scrubbing of my iptables...

it still does what it would do any other time.

> $IPTABLES -Z
> 
> By the way... is this correct/better/wrong??

if your intention is to zero your byte counters--then it's correct.  if
your intention is to retain your byte counters across reloads--then it's
wrong.

> $IPTABLES -t filter -Z
> $IPTABLES -t mangle -Z
> $IPTABLES -t nat    -Z
> 
> I read man page on iptables but it still was not clear if I need
> -Z to 'reset the byte count' and other stuff like it says it will do.

people that rely on byte counters for accounting type uses probably
don't use -Z when they reload their rules.  i only use the counters as
an indication of rule hits--so i do reset the counters every time i
reload my rules.  but it's not a question of right or wrong.

-j

--
"The only monster here is the gambling monster that has enslaved your
 mother! I call him Gamblor, and it's time to snatch your mother from
 his neon claws!"
	--The Simpsons


