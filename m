From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and DNS
Date: Wed, 11 Sep 2002 14:10:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111310.g8BDAjv08554@vulcan.rissington.net>
References: <20020829192902.29524.97535.Mailman@kashyyyk> <001301c2598c$351f9170$65ba030a@cecierj.adm>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c2598c$351f9170$65ba030a@cecierj.adm>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wednesday 11 September 2002 1:10 pm, Mauricio Gouvea wrote:

> Hi, is it possible to put a DNS server behind a firewall (iptables) doi=
ng
> NAT ?

Yes.

> If I set the FORWARD rules for a valid ip alias 0n my firewall and
> the POSTROUTING for an inside IP address this DNS SErver will answer to
> external world with no problems ???

Not quite.   You need the DNAT rule in the PREROUTING chain, and the rule=
=20
inthe FORWARD rule has to be for the internal (ie private) address, becau=
se=20
by the time the packets get to the FORWARD chain, they've already been=20
DNATted.

> I=B4ve never tested this.

Remember that DNS uses both UDP and TCP (both on port 53), remember also =
that=20
depending on what sort of DNS server it is (forwarding, authoritative,=20
primary, secondary, caching...) you may want to allow outgoing requests f=
rom=20
it as well as incoming ones.

Antony.

--=20

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

