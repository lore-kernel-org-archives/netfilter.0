From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT hiding routers behind it
Date: Fri, 6 Aug 2004 23:56:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408062356.16206.Antony@Soft-Solutions.co.uk>
References: <4113BEF9.5090706@parknet.dk> <16659.52594.461489.174741@saint.heaven.net> <4113F33C.7060601@parknet.dk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4113F33C.7060601@parknet.dk>
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
To: netfilter@lists.netfilter.org

On Friday 06 August 2004 10:08 pm, Simon Lodal wrote:

> No Linksys here, the firewall is a linux PC, the "router" is an Extreme
> Networks Summit 200 switch that acts like a router.
>
> I do not think it matters. Point is that the router sends an icmp
> ttl-exceeded, which the firewall apparently considers part of the
> connection, and therefore does reverse DNAT on.
>
> My problem is why it does that, and if it can be avoided.

My guess is that you have a MASQUERADE rule with no interface specified - so 
packets get the source address of the firewall whether they're going out or 
coming in?

Make sure you specify "-o eth0" or "-o ppp0" or whatever your external 
interface is called.

If not that, post your ruleset so we can have a further think...

Regards,

Antony.

> Dick St.Peters skrev:
> > Simon Lodal writes:
> >>I am traceroute'ing a DNAT'ed host. Surprisingly, all routers between
> >>the DNAT'ing firewall and the host appear as the IP address I am
> >>traceroute'ing. Is this intended? Can it be controlled in some way? (it
> >>is not necessarily bad)
> >>
> >>Example:
> >>traceroute to 217.116.235.62 (217.116.235.62), 30 hops max, 38 byte
> >> packets 1  192.168.0.2 (192.168.0.2)  4.152 ms  0.875 ms  0.865 ms
> >>  2  217.116.235.62 (217.116.235.62)  1.928 ms  1.272 ms  1.430 ms
> >>  3  217.116.235.62 (217.116.235.62)  2.013 ms  2.338 ms  2.330 ms
> >>
> >>Line 1: DNAT'ing firewall.
> >>Line 2: A router.
> >>Line 3: DNAT'ed host.
> >
> > Is the router a small Linksys router?  They do this without being
> > behind a firewall or NAT box.
> >
> > --
> > Dick St.Peters, stpeters@NetHeaven.com

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


