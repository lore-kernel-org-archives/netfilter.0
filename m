From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IP Accounting and performance
Date: Mon, 9 Dec 2002 10:21:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212091021.44030.netfilter@newkirk.us>
References: <AB18D92A-0AF2-11D7-96A2-00039376F59E@gerry.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AB18D92A-0AF2-11D7-96A2-00039376F59E@gerry.de>
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
To: Gerald Galster <Gerry@gerry.de>, netfilter@lists.netfilter.org

On Sunday 08 December 2002 04:18 pm, Gerald Galster wrote:
> Hi all,
>
> Perhaps you can give me some hints on a performance problem that I'm
> currently experiencing with iptables.
>
> The situation is as follows:
>
> I have a firewall currently running kernel 2.4.20, Celeron 1 GHz and
> 512 MB of RAM
> that should do traffic accounting based on single IP addresses. I
> thought it would be more
> efficient to use iptables than writing a standalone application using
> pcap or the like.

You will probably get your best speed (and usability of the resulting=20
data) if you just use one of the accounting daemons that can be paired=20
with the ULOG target, and use the two rules below.  Google/linux search=20
on "Netfilter ULOG accounting" =20
http://www.google.com/linux?num=3D100&restrict=3Dlinux&hl=3Den&lr=3D&ie=3D=
ISO-8859-1&q=3Dnetfilter+ULOG+accounting&btnG=3DGoogle+Search =20
turns up some useful links...  That said, if you still want to do it=20
directly in your ruleset, read on! :^)

> I need to add filtering rules like
>
> /sbin/iptables -A FORWARD -o eth0 -s ip_address/32
> /sbin/iptables -A FORWARD -i eth0 -d ip_address/32

Is this the complete rule?  If you don't have a target it will count and=20
pass to the next rule.  Since all you said you are doing is counting=20
that may seem OK, but it means that each packet is tested against each=20
and every rule... =20

If you can use a -j ACCEPT target for them it will count, and prevent=20
testing against following rules.  This will seriously speed up testing=20
for IP's that appear early in the list, but won't help later ones at=20
all.  Best is to break the address range down into smaller chunks.

Something expanded from the following might work well:

/sbin/iptables -N ip01to31in
/sbin/iptables -N ip32to63out
/sbin/iptables -A ip01to31in -d 10.11.12.13 -j RETURN
/sbin/iptables -A FORWARD -i eth0 -d 10.11.12.0/27 -j ip01to31in
/sbin/iptables -A ip32to63out -s 10.11.12.33 -j RETURN
/sbin/iptables -A FORWARD -o eth0 -s 10.11.12.32/27 -j ip32to63out

This creates a user-defined chain (two in this sample fragment) to test a=
=20
range of addresses, which can be broken down in whatever fashion gives=20
you either an even distribution of rules among the userdef chains, or=20
simply two chains and two FORWARD rules for each subnet.  (Obviously the=20
breakdown must occur in some fashion that is easy to test, IE based on=20
masking the IPs)  The latter would allow you to use the FORWARD chain=20
counts to see overall numbers for each subnet, but if one subnet is 5=20
machines and another is 1000 this will obviously be seriously=20
unbalanced.  You can also further break down from a user defined chain=20
to several more sub-chains using the same technique if this is useful.

> for about six class-C networks (this means about 3000 iptables rules).

Your end result can be twelve user-defined chains, one in/one out for=20
each subnet, and twelve rules in FORWARD.

Using the RETURN target in the user-defined chains simply passes the=20
packet back to the originating chain (IE, FORWARD) and skips testing=20
against the remaining rules in the chain.  You can substitute ACCEPT (or=20
DROP or REJECT) with no problem here as well.  RETURN shouldn't incur=20
much more processing time, since the packet should only match and be=20
passed to ONE userdef chain, and the main FORWARD chain should be fairly=20
short this way, so it will only test against a few more rules after it=20
RETURNS to FORWARD.  Using RETURN in a sub-chain will also allow you to=20
perform 'real' FORWARD filtering after the counting has taken place.

Also, as someone else suggested, you can have a script that creates the=20
rules in a loop, or perhaps six (one per subnet).  Fanciest and most=20
efficient traversal-wise would be a balanced tree of rules, (which could=20
bring you down to a max of 2-3 dozen tests for each packet, instead of=20
thousands right now) the construction of which is beyond the scope of=20
this reply... :^P

Whatever you do, if you handle this with iptables rules make sure you use=
=20
the most restrictive rules possible for your situation at the upper=20
levels (IE in FORWARD itself) to prevent traffic being tested that=20
doesn't need to be.  If all you're interested in is HTTP to the=20
internet, for example, test that in the FORWARD rules before reaching=20
the subchains.

j

> The average throughput is around 3 Mbits / second.
>
> After I've added those rules, the latency in ping times to a machine
> behind
> the firewall increases from 30 ms to over 200 ms ...
>
> Now my question is if I can speed those things up ... do you have any
> ideas?
>
> Thanks in advance.
>
> Regards,
> Gerald


