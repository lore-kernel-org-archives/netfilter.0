From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: netfilter resets TCP conversation that was DNATed from the
	local machine to another
Date: 30 Jun 2003 16:44:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056984240.1473.18.camel@raylinux.internal>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>
	 <20030630020152.GA27602@cannon.eng.us.uu.net>
	 <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net>
	 <20030630142908.GA29083@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1+MoQZkdXelCrQZS38uJ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030630142908.GA29083@cannon.eng.us.uu.net>
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


--=-1+MoQZkdXelCrQZS38uJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This is an IE browser problem.
Normal browsers don't send RST after the connection has ended.

On Mon, 2003-06-30 at 16:29, Ramin Dousti wrote:
> On Sun, Jun 29, 2003 at 07:22:13PM -0700, Michael wrote:
>=20
> > What would you like me to confirm? That it's broken? It is broken. That=
=20
> > the RST sending port is not the same as the initiating SYN port? It is=20
> > not; it's low, just above 1024, so I assumed it to be=20
> > netfilter-generated, whereas the Squid port was in the 30000 range. Tha=
t=20
> > my rule set isn't sending it? "I have no reject-with-tcp-reset lines in=
=20
> > my tables." Don't know what else you could mean.
>=20
> What I mean is this:
>=20
> squid:		ip1:port1
> webserver:	ip2:80
>=20
> Then what you say is:
>=20
> packet1:	ip1:port1 -> ip2:80    (SYN)
> packet2:	ip2:80    -> ip1:port1 (SYN ACK)
> packet3:	ip1:port2 -> ip2:80    (RST)
>=20
> What I'm saying is that the third packet should not be able to tear down
> the connection between ip1:port1 <-> ip2:80  just because the ports are
> different. The TCP stack on ip2 should discard this RST packet...
>=20
> Again, my question:
> do you see any other packets between ip1:port1 <-> ip2:port2 after the RS=
T
> packet?
>=20
> Ramin
>=20
>=20
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-1+MoQZkdXelCrQZS38uJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/AEywh1fuR/Bv+ygRAvFRAJ9uv0O0IsyEdPls7Vqr1JwLMjLUVgCfdgPc
S5g2TBFBSd/BGMJzfviqHP8=
=m+O1
-----END PGP SIGNATURE-----

--=-1+MoQZkdXelCrQZS38uJ--


