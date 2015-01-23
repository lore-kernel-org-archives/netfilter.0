From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Order of iptables vs. ip6tables chains
Date: Fri, 23 Jan 2015 23:58:49 +0100
Message-ID: <54C2D229.1000108@plouf.fr.eu.org>
References: <20150123223116.GA3522@blackhole.tracing.lan> <54C2CD64.5000104@familie-kuntze.de> <20150123225143.GB3522@blackhole.tracing.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150123225143.GB3522@blackhole.tracing.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thomas Preissler a =E9crit :
>=20
> On Fri, Jan 23, 2015 at 11:38:28PM +0100, Noel Kuntze wrote:
>> Also, IPv4 traffic is only handled by iptables rules and IPv6 traffi=
c
>> obviously only by ip6tables rules. iptables only handles ip traffic,=
 not decnet or any
>> other fancy layer three protocol.
>=20
> But where does ip6tables fit in here?

In the same places as iptables.

> Does it first run through the
> whole netfilter stack as in [1], and then for v6, or is it doing it
> in some mixed way:
>=20
> 1) mangle PREROUTING v4
> 2) mangle PREROUTING v6
> 3) mangle INPUT v4
> 4) mangle INPUT v6
> 5) filter INPUT v4
> 6) filter INPUT v6

What is unclear in "IPv4 traffic is only handled by iptables rules and
IPv6 traffic obviously only by ip6tables rules" ?

> and so on (I skipped NAT... as there is no v6 NAT (haha - I know)).

There is.
