From: Alexander Samad <alex@samad.com.au>
Subject: Re: FORWARD RULE -- please help
Date: Tue, 9 Mar 2004 21:36:30 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040309103630.GI24806@samad.com.au>
References: <20040309075404.92394.qmail@web13206.mail.yahoo.com> <200403090846.46608.Antony@Soft-Solutions.co.uk> <20040309091051.GH24806@samad.com.au> <200403090920.04308.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkEkAx9hr54EJ73W"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403090920.04308.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Cc: netfilter@lists.netfilter.org


--vkEkAx9hr54EJ73W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2004 at 09:20:04AM +0000, Antony Stone wrote:
> On Tuesday 09 March 2004 9:10 am, Alexander Samad wrote:
>=20
> > On Tue, Mar 09, 2004 at 08:46:46AM +0000, Antony Stone wrote:
> > > On Tuesday 09 March 2004 7:54 am, Nilesh wrote:
> > > > 203.129.224.149 is my firewall machine running
> > > > IPTABLES and 192.168.0.22 is my local machine on 2090
> > > > port service is running
> > > >
> > > > 202.129.227.3 is his firewall IP and 192.168.1.25 is
> > > > his local machine where on 2090 port services is
> > > > running
> > > >
> > > > I want to communicate this both internal
> > > > machines(192.168.0.22 and 192.168.1.25) through
> > > > firewall
> > >
> > > If you want his 192.168.1.0/24 network to be able to communicate with
> > > your 192.168.0.0/24 network then you should investigate IP in IP
> > > tunnelling / encapsulation (see the Linux Advanced Routing Guide at
> > > http://lartc.org for a simple guide to how to do this), or else set u=
p a
> > > VPN (eg : FreeS/WAN, or the IPsec implementation built into the 2.6
> > > kernel).
> >
> > Or he could use MASQ on both sides with 2 dnat rules
>=20
> True, however this is not a scalable solution (won't work for more than o=
ne=20
> client or server at each end of the link for example), and it means that =
the=20
> client and server see the public addresses of the other end, not the priv=
ate=20
> ones (although you could probably overcome this with another couple of SN=
AT=20
> rules loaded on top).

true just doing it simple for the one off

>=20
> It would probably work okay in a restricted situation such as Nilesh=20
> specified, however.
>=20
> Regards,
>=20
> Antony.
>=20
> --=20
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing on usenet and in e-mail?
>=20
>=20
>=20

--vkEkAx9hr54EJ73W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATZ4ukZz88chpJ2MRAiruAJ0ZWcIh9IUqTDPOOD3NWvm3MJX8tACgxSds
6WH7nrNVEBEYx+oKl/cAB3I=
=3lyV
-----END PGP SIGNATURE-----

--vkEkAx9hr54EJ73W--

