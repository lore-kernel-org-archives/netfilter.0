From: "Derick Anderson" <danderson@vikus.com>
Subject: FW: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 15:56:23 -0400
Message-ID: <810BC538117E9F4E9BB152E0C100DF1F771DD0@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

=20
<snip>

> you should really read the Iptables Tutorial 1.1.19 written by Oskar=20
> Andreasson located at=20
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>=20

Maybe YOU should read it.

> since you may not read it, i will quote a few  parts.

I'll quote something you apparently missed which you can find here:=20
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSING
OFTABLES

You'll find it in Table 3.1, under Step 4, concerning the nat table and
the PREROUTING chain:

"This chain is used for DNAT mainly. Avoid filtering in this chain since
IT WILL BE BYPASSED IN CERTAIN CASES." [caps mine]

There is something leaking here, and it is not iptables. Rather, it is
your firewall settings because you don't understand how to use iptables.

<snip>

> <begin quote>

<snip>

> the first packet in a stream. The PREROUTING chain should be used for=20
> network address translation only, unless you really know what you are=20
> doing.

Did you catch that last sentence? "The PREROUTING chain should be used
for network address translation only, unless you really know what you
are doing." That sentence is for you, and you DON'T know what you are
doing. Several people have tried to help you, and each time you insist
that the problem is with iptables. I suppose you will continue to do
that, instead of listening to common sense offered by those who write
the program you use.


Derick Anderson

