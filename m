From: Alexander Samad <alex@samad.com.au>
Subject: Re: Redirecting outgoing SMTP from LAN to another LAN server
Date: Fri, 30 Apr 2004 08:23:26 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040429222326.GA15804@samad.com.au>
References: <20040429095949.GB22172@acentral.co.uk> <20040429133757.GK7147@samad.com.au> <20040429144757.GA6534@zion.homelinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040429144757.GA6534@zion.homelinux.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2004 at 04:47:57PM +0200, Sven Schuster wrote:
> On Thu, Apr 29, 2004 at 11:37:57PM +1000, Alexander Samad told us:
> > On Thu, Apr 29, 2004 at 10:59:49AM +0100, Gavin Hamill wrote:
> > > Hullo :)
> > >=20
> > > I'd like to do $SUBJECT, but after much playing with commands like
> > >=20
> > > iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 25 -j DNAT --to =
10.0.0.253:25
> >=20
> > what about=20
> >=20
> > iptables -t nat -A PREROUTING -p tcp -i eth1 -s ! 10.0.0.253  --dport 2=
5 -j DNAT --to 10.0.0.253:25
> >=20
> > I presume 10.0.0.253 is also on eth1.
> >=20
>=20
> The problem here might be that both the client and the server are on=20
> the same physical network. This means
>=20
> So assume we have a client (10.0.0.1) which wants to connect to a
> mail server (12.34.56.78) on the internet. So you DNAT the request to
> your internal mail server 10.0.0.253 at the firewall. Your internal
> mail server gets the request but will try to directly talk to the
> client, as in the packet the sender is still the original ip adress.
> (sorry if this is hard to understand, I'm not really good in=20
> explaining things :) So you will additionally need a SNAT rule on
> your firewall, something like
>=20
> iptables -t nat -A POSTROUTING -p tcp -i eth1 -s 10.0.0.0/8 \
>    -d 10.0.0.253 --dport 25 -j SNAT --to 10.0.0.xx:25

yeap, forgot about that
>=20
> where xx would be the ip of your firewall. Now both the packets
> from the client to the server and the returning packets from the
> server to the client will travel through your firewall.
>=20
>=20
> HTH
>=20
> Sven
>=20
> >=20
>=20
> > >=20
> > > I have given up and have come to you fine people for help...
> > >=20
> > > My LAN is on eth1, with WAN on eth0. The gateway machine is 10.0.0.25=
4 doing masq for=20
> > > LAN clients, but I'd like to send any outgoing SMTP connections to 10=
=2E0.0.253 - alas=20
> > > any time I've tried, I just end up killing ALL outgoing SMTP :(
> > >=20
> > > Any suggestions warmly received!
> > >=20
> > > Cheers,
> > > Gavin.
> > >=20
> > >=20
>=20
>=20
>=20
> --=20
> Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GN=
U/Linux
>  16:37:12  up 8 days, 21:26,  1 user,  load average: 0.01, 0.01, 0.00



--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAkYBekZz88chpJ2MRAqB8AJ9qR+LT1iZF+yoIKYYn4XBHGRLOtQCePZyz
k33cpejxkdkxvczAGKpCIn0=
=sVia
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

