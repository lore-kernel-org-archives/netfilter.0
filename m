From: Alexander Samad <alex@samad.com.au>
Subject: Re: Help needed with ESP and DNAT on Debian 2.4.26 / iptables
	1.2.9-10
Date: Mon, 30 Aug 2004 10:22:19 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040830002219.GA16069@samad.com.au>
References: <D5C9032B2B09C64EA2409D6214E91AC90512FB@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512FB@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2004 at 02:19:20PM -0400, Jason Opperisano wrote:
> > Hi there!
> >
> > I need help getting DNAT to work with ESP packets on a Debian box
> > ('testing/sarge' release, 2.4.26 kernel, iptables 1.2.9-10). This used
> > to work fine on a RH90...
> >
> > This is used to suport a laptop running XP Pro logging in to a corporate
> > VPN with the Nortel VPN client. Company policy and authentication
> > requirements prevent me from changing anything in that setup (so I can't
> > change the VPN to terminate AT the Linux box for example).
> >
> > My problem is: incoming ESP packets are not being DNATed as I wanted
> > them to. The rule I use is:
> > -A PREROUTING -p esp -s <VPN server> -j DNAT --to-destination <laptop>

are you using klips or the backported 2.6 engine, if the later you need
netfilter patch-o-matic as netfilter in is plain vanilla format doesn't
handle nat'ing and ipsec

A

> >
> > The rule does get hit into (I have a mirror rule with -j LOG), but the
> > translation does NOT happen.
>=20
> that rule will only get hit if a packet initializing a connection comes f=
rom the contivity.
>=20
> normally--the VPN tunnel will be initiated by your VPN client, and if you=
 are using outbound NAT + connection tracking; the replies from the VPN gat=
eway will be caught by your "-m state --state ESTABLISHED" rule.
>=20
> i.e.:
>=20
> client:500 -> vpngw:500
> client:esp -> vpngw:esp
>=20
> i have learned; however, that having a DNAT & filter rule that allows UDP=
 500 from the VPN gw to the client is useful for when the client is idle fo=
r long periods of time, and the VPN gw wants to rekey the tunnel.
>=20
> > Like I said, it used to work fine when the server was a RH90.
> >
> > How do I begin troubleshooting this? Some things I tried so far are:
> > - try to DNAT ALL traffic (not just -p esp)
> > - force ipt_esp to load (modprobe ipt_esp and yes, it is under
> > /lib/modules/<kernel>/kernel/ipv4/netfilter)
>=20
> the esp module is only useful with manual keying, not with IKE, as it mat=
ches on SPI.
>=20
> > - tried doing an SNAT on the preceding UDP/500 connection to maybe trick
> > netfilter into understanding the ESP part later
> >
> > Naturally, I have tcpdump logs, syslogs, etc... for further analysis,
> > but I'm weak when it comes to netfilter troubleshooting...
>=20
> maybe some idea about the network topology, ip address, and the ever-famo=
us output of:
>   iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL
>=20
> you *might* possibly be focusing you energies on the wrong aspect--i asuu=
me your goal is to make the VPN client work; whether that requires a DNAT a=
 ESP traffic or not (it absolutely should not, btw).
>=20
> -j
>=20
>=20
>=20

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBMnM7kZz88chpJ2MRAqbqAJ4zCUJ5i/46vjN2iTqoZzG00rMZ5wCfRobo
Dj1kQEubZcnXsxPfaapNGp4=
=cjxP
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

