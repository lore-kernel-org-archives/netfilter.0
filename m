From: Alexander Samad <alex@samad.com.au>
Subject: Re: netfilter for IPv4 and IPv6
Date: Mon, 19 Apr 2004 15:20:15 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040419052015.GN19221@samad.com.au>
References: <407FB35E.4000605@di.uminho.pt> <1082112044.23863.56.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O27Gs9jTTFWz3gAR"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1082112044.23863.56.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--O27Gs9jTTFWz3gAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2004 at 12:40:45PM +0200, Ray Leach wrote:
> On Fri, 2004-04-16 at 12:20, Jose Luis Faria wrote:
> > Hello,
> >=20
> > I have some servers and others machines already in IPv6, some of them=
=20
> > are firewalls.
> >=20
> > The firewalls are dual stack:IPv6 and IPv4. I must use iptables for IPv4
> > and ip6tables for IPv6, it means, the same firewall must filter packect=
s=20
> > from
> > IPv4 machines and IPv6 machines.
> > I'm looking for any help in the net but I can not find any help about t=
his.
> >=20
> > What can I do to solve this problem?
> > Any ideas?
> >=20
> iptables (with a correctly compiled kernel) supports both ipv4 and ipv6.
Did not think that iptables manipulates the ip6tables.

On my setup I use both iptables and ip6tables to create/maitain 2 sets
of tables.

A

>=20
> > thanks in advance.
> --=20
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --



--O27Gs9jTTFWz3gAR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAg2GPkZz88chpJ2MRAuuFAJ9b2R+gy0LAC0jDwSDXuGs0VgXt8QCbBS3b
Ik4rcAqP1Aly/MHo51EVsJU=
=4NQA
-----END PGP SIGNATURE-----

--O27Gs9jTTFWz3gAR--

