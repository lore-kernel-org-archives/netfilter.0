From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Re: Redirection question
Date: Mon, 20 Dec 2004 18:05:49 +0100
Message-ID: <41C7066D.7050604@stupar.homelinux.net>
References: <41C705A1.2040107@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41C705A1.2040107@stupar.homelinux.net>
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

Sasa Stupar a =C3=A9crit :

> Hi!
>=20
> I have installed mail server on my lan. Now I would like to redirect al=
l=20
> lan users to use that mail server as smtp (similar as transparent proxy=
=20
> with squid). How do I do that smtp redirection?
> I was thinking something like:
> -------------
> iptables -t nat -A PREROUTING -i eth0 -s ! smtp-box -p tcp --dport 25 -=
j=20
> DNAT --to smtp-box:25
> iptables -t nat -A POSTROUTING -o eth0 -s local-network -d smtp-box -j =

> SNAT --to iptables-box
> iptables -A FORWARD -s local-network -d smtp-box -i eth0 -o eth0 -p tcp=
=20
> --dport 25 -j ACCEPT
> --------------
> Is this correct?
>=20
> Regards,
> Sasa
>=20

I forgot some more infos:
running on FC3 with sendmail. This is also a router with 2 NIC
installed: one for internet and one for LAN.

Sasa





