From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 15:54:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231205417.GQ677@ns>
References: <20021231202708.GP677@ns> <20021231204756.1918.qmail@web40306.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LvAn5G4Ewe70kJ1i"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021231204756.1918.qmail@web40306.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Kevin McConnell <kevymac@yahoo.com>
Cc: Brad Chapman <kakadu_croc@yahoo.com>, Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.netfilter.org


--LvAn5G4Ewe70kJ1i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Kevin McConnell (kevymac@yahoo.com) wrote:
>=20
> --- Stephen Frost <sfrost@snowman.net> wrote:
> > The two havn't got anything to do with each other.=20
> > NATing is modifying
> > packets as they pass through the router.  Addressing
> > is the IP address
> > and whatnot to access the firewall/router.  One does
> > not require the
> > other.
>=20
> This leads me to another question then. What are the
> advantages of not having an IP address assigned to=20
> interface(s) of the firewall? Like for instance, if my
> firewall was the gateway to the outside world, how
> would I tell machines behind the firewall to get out
> to the outside world if they didn't have a default
> route pointing to the internal address of the
> firewall? Also, how would packets that hit the
> firewall get routed through the other side?

A router is not a bridge.  The two are different things.  You're
thinking of things in terms of a 'router'.  In order for your computers
to reach the external network they have to go through a router, true.  A
firewall can be implemented as part of a router or as part of a bridge.
The only requirement being that the packets are required to pass through
the device.  If you implemented your firewall as a bridge then the
machines on the network wouldn't 'see' it, they would point their
default routes to the router on the opposite side of the bridge.

I think the critical point here is that you need to understand what a
bridge is and how it works and how it's different from a router.

	Stephen

--LvAn5G4Ewe70kJ1i
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+EgP5rzgMPqB3kigRAtuvAJwLr3xOtMnmCG4HvULOhg76k+hurgCfaDNF
2Fbe5waiHoRtfPcCha8Ednc=
=qbek
-----END PGP SIGNATURE-----

--LvAn5G4Ewe70kJ1i--

