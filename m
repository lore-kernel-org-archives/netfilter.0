From: Harald Welte <laforge@netfilter.org>
Subject: Re: Unable to stop tunnel from being "connection-tracked"
Date: Fri, 3 Oct 2003 12:16:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003101655.GS5758@sunbeam.de.gnumonks.org>
References: <1065093009.24289.193.camel@wouter.fw.belnet.be> <20031002135201.GA16283@cannon.eng.us.uu.net> <1065123318.29721.12.camel@xerxes.sketchingroom.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A0Shf/FtxJ4npB5r"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1065123318.29721.12.camel@xerxes.sketchingroom.home>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Wouter Vanwalleghem <wouter@belnet.be>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org


--A0Shf/FtxJ4npB5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> A tcpdump on my external interface (ppp0) only shows my echo-requests
> and no packets whatsoever coming from the tunnelbroker PoP. I would at
> least expect to see some or other packet, e.g. an icmp error message,
> coming from the tunnelbroker PoP.

iptables doesn't prevent packets from showing up in tcpdump.  So you
will always see everything you receive on the wire in tcpdump,
independent of any iptables configuration.

this is because tcpdump hooks into PF_PACKET, which is at layer2, before
the ipstack (and thus iptables) is consulted at all.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--A0Shf/FtxJ4npB5r
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fUyXXaXGVTD0i/8RAvUiAKChGdub4GmiYnDCx9CZY6xUh8QsnACcCN5O
1JFp9z2SKtTKGdadIgqXUxQ=
=TKmg
-----END PGP SIGNATURE-----

--A0Shf/FtxJ4npB5r--

