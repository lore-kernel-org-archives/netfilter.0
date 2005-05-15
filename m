From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Combined Internal/External DNAT question
Date: Sun, 15 May 2005 18:56:06 -0500
Message-ID: <4287E196.5060403@riverviewtech.net>
References: <428591F3.8090400@griffous.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428591F3.8090400@griffous.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> iptables -t nat -A PREROUTING -d 10.0.0.1 -i eth1 -p tcp --dport
> <tcpservice> -j DNAT --to <relevant.internal.server>:<tcpservice>
> And this works nicely.

*nod* As I would expect it to do so.  :)

> However I have the classic situation of internal clients using the DNS
> entries for these servers which points them to my external IP. The
> firewall forwards the traffic out the dsl interface to the internet as
> it has no knowledge of my public IP. It doesn't work, the DSL router
> can't NAT to and from the LAN interface.

*nod*  You need to do some different D/SNATing on your firewall not the DSL modem / router.

> The following documentation is close to what I want, but doesn't quite work.
> http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html
> 
> The reason it doesn't work is that my firewall doesn't actually have the
> external IP.

This is not a problem.  You just have to tweak the rules slightly.

> What I need is rule along the lines of:
> iptables -t nat -I PREROUTING -d <publicIP> -s <internal-lan> -j DNAT
> --to 10.0.0.1.

You are very close but off by a destination IP.  See below.

> I would then have traffic from the internal lan, going the same
> destination IP that my public natting rules are already built for. Which
> should then redirect internal clients to my internal servers using these
> same natting rules.

This will not work as you have noticed for the reason you noticed below.

> It appears however that once iptables had done it's initial DNAT of a
> session as per the rule above, it doesn't reevalute the PREROUTING chain.
> 
> Which means that clients try to connect to the firewall itself rather
> then being DNATed again.

This is what I would expect to happen.

> HELP, I need some kind of a double DNAT?

No, you don't really want double DNAT.  What you really need to do (IMHO) is something you have alluded to that you do not want to do below.  You really need to use rules like this:

iptables -t nat -I PREROUTING -i <internal-lan-interface> -d <publicIP> -s <internal-lan> -j DNAT --to-destination <relevant.internal.server>:<tcpservice>

This will as you can probably guess cause your internal LAN traffic to that is outbound and destined to your public IP that your firewall knows nothing about to be DNATed to your real internal server.  However you will need to run an SNAT rule to prevent your internal server from responding directly to your internal LAN clients and thus causing a three way communications triangle where your client communicates (1st IP) to what it thinks is the server (2nd IP) which will redirect to the ultimate server (3rd IP) which will communicate directly back to your internal client thus confusing your internal client.

iptables -t nat -A POSTROUTING -d <relevant.internal.server> -j SNAT --to-source <internal interface of your firewall>

> I know there are solutions to this problem like dual dns, but getting
> this would be MUCH quicker to setup/manage/scale, and I wouldn't have to
> play DNS games.

I cant' say as I blame you for not wanting to maintain multiple (master) DNS spaces as this will open up another can of worms.

> I could also create a whole second set of rules DNATing internal traffic
> destined for my public IP, to go to the correct server, but then I'd
> have 2 chains of traffic to maintain. Is there no way I can do this all
> with one set of rules, on the one firewall?

Sorry, not that I'm aware of.  The only thing that comes to mind using one chain would be to do some funky routing tricks where the traffic would actually leave your firewall and then come back in the PREROUTING chain.  This in and of it's self is not very desirable and is cumbersome to maintain too.



Grant. . . .

