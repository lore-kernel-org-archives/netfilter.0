From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TTL patch buggy?
Date: Thu, 8 Jan 2004 11:25:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040108162520.GA22229@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0401071709030.4717-100000@filer.marasystems.com> <1073502275.16972.10.camel@jasiiitosh.nexusmgmt.com> <20040107193547.GF6629@obroa-skai.de.gnumonks.org> <1073506041.16972.25.camel@jasiiitosh.nexusmgmt.com> <20040107213853.GD20346@cannon.eng.us.uu.net> <1073548926.768.15.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1073548926.768.15.camel@elendil.intranet.cartel-securite.net>
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
Content-Transfer-Encoding: 7bit
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, netfilter@lists.netfilter.org

On Thu, Jan 08, 2004 at 09:02:06AM +0100, Cedric Blancher wrote:

> Avoiding traceroutes can't be easily done by blocking consequences, as
> they are numerous. I mean you can do a traceroute using TCP as well (see
> tcptraceroute tool), or even using applications requests on UDP, such as
> a DNS request (useful to traceroute microsoft.com DNS server), or
> anything else that can trigger a valuable target response. In thoses
> cases, you really can't block final answer as it is a valid one.

traceroute based on application specific characteristics is, IMPV,
easier to prevent as one should know what applications are running internally
and who should have access to them. If its a public service, then,
it does exist and everyone is aware of it. To prevent the visibility
of the intermediate hops, increasing the TTL and/or blocking the ICMP
TTL exceeded is the solution.

> Moreover, if blocking echo-reply is no arm, blocking ICMP errors can
> have really bad side effects. If we look a bit closer, a well configured
> firewall should not let a packet destined to a closed UDP port go
> through...

Very good point.

> Letting conntrack deal with ICMP error is to me the best deal.
> 
> If you really want to prevent traceroute based discoveries, you just
> should raise packets TTL so they don't expire within your network for
> normal operations. So you'll add 2, 3, maybe 4 to the TTL, but not more.
> Resetting TTL to 255 is far too much if a loop appears.

Yes. but the original question was, "what if one doesn't know the depth
of the internal network".

> If you want to prevent discovery based on the TTL of packets you send,
> reset TTL for outbound traffic to a default value such as 64.

Yes, Harald had a comprehensive email, outlining different scenarios and
what to do in each case.

Ramin

> 
> -- 
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread! 

