From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: conntrack for samba/netbios-ns
Date: 05 Nov 2003 08:05:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068037555.1573.62.camel@valhalla>
References: <20031105003401.GA11702@shell.blacknet.de>
	 <1067999419.7813.38.camel@tarkus>
	 <1068017027.807.15.camel@elendil.intranet.cartel-securite.net>
	 <1068035458.14617.13.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068035458.14617.13.camel@tarkus>
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
To: tedkaz@optonline.net
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-11-05 at 07:30, Ted Kaczmarek wrote:
>
> Ah, just like the Checkpoint implementation.
> So their is still no state tracking per say, but a hash table
> based on SA/port DA/port, and a 180 second timer.

<shrug> There's not a whole lot else you can do. Its the nature of UDP
as well as many other transports. 

If the UDP based application has a defined header (like DNS), you could
probably tighten this down with string matching, but that would depend
on the app.

> Doesn't 180 seconds seem a tad long?
> I kinda vaguely remember Checkpoint default on this being 40 seconds.

I can't confirm that iptables is 180 seconds for UDP (too lazy to look
it up ;-) but I can tell you that I still see traffic getting blocked
due to state table time outs. The most common occurrence I see is
someone with a slow DNS that posts to a large mailing list. They get
nailed with a flood of queries in order to verify their domain and
sometimes the name server becomes slow to respond. I also see state
table time outs due to slow game servers from time to time.

> I remember being in a discussion with some developers on this and the
> consensus was 30 second heartbeats ( strange, they almost always end up
> with 30 second heartbeats for everything, hehe ).

I doubt _every_ application does this and a firewall should work with
the lowest common denominator. For example I've seen FW-1 and IOS break
large FTP file transfers because the state table times out before the
transfer is complete (thus killing the command session). Netfilter does
not have that problem because it keeps state on established for 5 days.

HTH,
C



