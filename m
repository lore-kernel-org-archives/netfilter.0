From: Harald Welte <laforge@netfilter.org>
Subject: Re: IPSEC passthrough
Date: Fri, 3 Oct 2003 13:07:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003110725.GK5758@sunbeam.de.gnumonks.org>
References: <008401c37cfe$b5f0cb20$1101a8c0@SC2003002>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GGJL4TkaEPVuyaI7"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <008401c37cfe$b5f0cb20$1101a8c0@SC2003002>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Enrico Demarin <enricod@videotron.ca>
Cc: netfilter@lists.netfilter.org


--GGJL4TkaEPVuyaI7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2003 at 11:33:10AM +0200, Enrico Demarin wrote:
> Hi,
> =20
> Is anyone working on the IPSEC passthrough module ? It appears no one
> ported it to 2.4 yet, and I was wondering why .
> =20
> Lack of resources or some technical problem in porting it from ipmasq to
> ipfilter ? I would like to understand this
> =20

I don't see technical problems in rewriting a ip_masq helper as
ip_conntrac/ip_nat helper.

It's just a lack of interest (we very rarely get asked about that
feature) and a lack of time, as always.

> and eventually start a project to perform the porting.

feel free to go ahead :)

> - Enrico

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--GGJL4TkaEPVuyaI7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVhtXaXGVTD0i/8RAsSdAJ0ViUo1wqf4ib7YGrnH8DwaxnRdogCeNkYc
A0v++GP37WVxT2BqHe9f7q8=
=+x8b
-----END PGP SIGNATURE-----

--GGJL4TkaEPVuyaI7--

