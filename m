From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Sat, 23 Apr 2005 01:05:52 +0200
Message-ID: <42698350.1060400@lopsch.com>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>	<42688A26.9000705@riverviewtech.net>
	<Pine.LNX.4.60.0504221707050.15167@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0504221707050.15167@darkstar.sysinfo.com>
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

R. DuFresne schrieb:
>=20
> the only way to really survive a ddos without affecting connectivity in=
=20
> any shapoe or form is to have a bigger pipe then the other end<s> does.=
=20
> idiots trying to ddos from a cable connection or dialup are not a=20
> problem and sufferable.  Those a tad higher in technical advancement=20
> with a bot net and tousands of zomies to attack from are likely to brin=
g=20
> even the biggest pipes to a dead halt, at least getting in and our of=20
> the firewall gateway is impossible.  Traffic on the inside should be=20
> unaffected.
>=20
> I've suffered attacks with a firewall not doing connection tracking and=
=20
> had no problems with either the firewall failing or suffereing a reboot=
.=20
> I have yet to suffer such an attack on a staeful firewall, but tend to=20
> think I should suffer no less with such a firewall in place as apposed=20
> to an the older mere packet filters I've been replacing over time. =20
> Course, it helps to have enough RAM in the firewall in the firstplace..=
.
>=20
> pipes size and RAM, them be the keys to surviival.
>=20
> Thanks,
>=20

That=B4s the point. With professional DDoS attacks we are talking about=20
people using their botnets and zombies and in total they can reach a=20
bandwidth beyond the Gbit border. Not really easy to handle such packet=20
storm ;).

