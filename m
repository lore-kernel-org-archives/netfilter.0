From: Florin Andrei <florin@andrei.myip.org>
Subject: Re: NAT on stateless firewall ?
Date: Fri, 03 Aug 2007 11:23:22 -0700
Message-ID: <46B3729A.8030605@andrei.myip.org>
References: <46B26400.7050504@andrei.myip.org>
	<46B2FB97.3090605@plouf.fr.eu.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B2FB97.3090605@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Pascal Hambourg wrote:
> Florin Andrei a =E9crit :
>> Since HTTP is the only thing traversing the firewall,
>=20
> Really ? No ICMP error messages, no outgoing DNS queries ?

Right, some ICMP stuff required by TCP, which can also be handled stateless.
DNS is separate. The traffic on the "master blaster" is kept very simple.

>> I stumbled upon "-t raw" and I'm testing it, looks like it does what I=20
>> need.
>=20
> If you mean using the NOTRACK target, this is a bad idea. Packets in the =

> UNTRACKED state will be ignored by the connection tracking *and* thus by =

> the stateful NAT which depends on it.

You're right. :-(
I assume I can still pretend that conntrack does not exist, and just=20
write the rules as if it was a stateless firewall. It will waste CPU=20
cycles and memory, but that's fine. I can even tweak the netfilter=20
parameters so that the connection tracking expires much faster, to keep=20
the size down.
A stateless firewall will fail over much more quickly and more reliably=20
than any stateful firewall.

I would use conntrackd, I just don't know how well tested it is in=20
high-bandwidth high-reliability setups. I may revise that decision, but=20
right now I'm focusing on stateless.

Security with stateless should not be a problem in such a simple=20
configuration (only one open port, well-behaved protocol, all traffic=20
initiated from outside).

Grant Taylor wrote:
 >
 > Dare I ask why you are wanting to use Proxy ARP?

Well, it's required by DNAT, isn't it? It looks like even SNAT to an=20
address different than the main IP on the firewall interface requires it=20
for the return traffic.
I'm snooping the traffic, I see the ARP request for the DNAT'ed address,=20
but there's no reply. So the firewall must be told to answer that request.

I'm not yet sure why this is so complicated. I remember doing proxy ARP=20
on Slackware 10 years ago (that was, like, kernel 2.0 or something like=20
that) and it was a very straightforward job.

<sigh> back to doing tests.

--=20
Florin Andrei

http://florin.myip.org/

