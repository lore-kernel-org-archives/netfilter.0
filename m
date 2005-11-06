From: Harald Welte <laforge@netfilter.org>
Subject: Re: pptp & NAT
Date: Sun, 6 Nov 2005 10:26:18 +0100
Message-ID: <20051106092618.GN16000@sunbeam.de.gnumonks.org>
References: <436ADB4C.7070800@exse.net> <436ADCFB.6070201@snapgear.com>
	<20051105142207.GA29131@domsch.com>
	<ADACAE55-17E0-4B31-8E24-5A613DDABB96@exse.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0h0CbphJD8hN+Gf"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ADACAE55-17E0-4B31-8E24-5A613DDABB96@exse.net>
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
To: Sebastian <seb@exse.net>
Cc: netfilter@lists.netfilter.org, Philip Craig <philipc@snapgear.com>


--E0h0CbphJD8hN+Gf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 05, 2005 at 11:48:18PM +0100, Sebastian wrote:
>=20
> Am 05.11.2005 um 15:22 schrieb Matt Domsch:
> >>>- I am unable to estabish two pptp connections from one client, I  can
> >>>connect to one pptp server and I can connect to a second pptp  server,
> >>>but the second connection never accepts any traffic, when I stop the
> >>>first connection, the second connection begins to work. Is this a  bug=
 or
> >>>a known missing feature ?
> >>This is intended to work.  I haven't personally tested it in
> >>2.6.14 though.
> >Using the endian fix patch and this patch (both are attached to bug
> >397), this is working for me on a 2.6.14 kernel (really, git HEAD from
> >yesterday plus these two patches).  I've got 2 clients, one WindowsXP,
> >one Fedora Core 4, hitting the same PPTP server at the same time.
> >Sincere thanks to both you and Harald for this effort!
>=20
> what is not working for is to connect two pptp-servers from one  client m=
achine!

that should work even without any helper.  could you please try with no
pptp helpers loaded and verify it works?

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--E0h0CbphJD8hN+Gf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDbcw5XaXGVTD0i/8RAktcAJ9ReleH93RuExzmwwnrjNn1yE9PsQCfd8NA
Smr5eTOwKhdAIuowsYmL0UU=
=vl8h
-----END PGP SIGNATURE-----

--E0h0CbphJD8hN+Gf--

