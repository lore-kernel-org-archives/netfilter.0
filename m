From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables dnat, ebtables, mark
Date: Wed, 10 Nov 2004 10:56:43 -0500
Message-ID: <20041110155643.GA19707@bender.817west.com>
References: <419236F6.4060306@uplink-verein.ch>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <419236F6.4060306@uplink-verein.ch>
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
To: netfilter@lists.netfilter.org

On Wed, Nov 10, 2004 at 04:42:46PM +0100, Moritz Gartenmeister wrote:
> hi
> 
> my idea:
> i know the mac-adress from a compromised computer in my lan. i want to 
> redirect all the traffic from
> this computer to a webserver (to show up a page with e.g. "bad guy! you got 
> a virus").
> 
> my system:
> debian testing 2.6.7
> iptables
> ebtables
> bridge-code
> 
> my solution so far:
> ebtables -t nat -A PREROUTING -s $MAC -j mark --set-mark 8 --mark-target 
> CONTINUE
> there are no other rules in this chain.
> some more rules in -A FORWARD all with -s macadress, but not the one above.
> 
> is the only rule in prerouting nat.
> iptables -t nat -A PREROUTING -m mark --mark 0x8 -j DNAT --to-destination 
> $IP-WWW
> 
> is the first role in the mangle chain.
> iptables -t mangle -A PREROUTING -m mark --mark 0x8 -j ACCEPT

are you filtering packets in MANGLE?

> one check rule in mangl POSTROUTING
> iptables -t mangle -A POSTROUTING -m -mark --makr 0x8 -j LOG --log-prefix 
> IPT_MARK

are you getting logs out of this rule?  if so--do the src/dst IP's look
like they should?

> my problem:
> the user can access the webserver and only this server, but the user is not 
> redirected to the
> web-server, if he tries to access e.g. www.google.com. he only get an 
> error-message.
> 
> my observation:
> number of packets differ...
> ebtables 213 packets
> prerouting mangle 200 packets
> prerouting nat 118 packets
> postrouting mangle 93 packets
> 
> any explanations? the number should be at least the same. i don't 
> understand this. the filter-rules
> seem to work properly...

i think you need to describe the relative locations of the client,
bridge, and web server.

it sounds like it could be a routing problem.

-j

--
"I've always wondered if there was a god. And now I know there is --
 and it's me."
        --The Simpsons

