From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: RTSP & RTP w/ Darwin Thru iptables
Date: Thu, 22 Jul 2004 06:08:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040722130839.GB8152@home.tig-grr.com>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Dan Barron <dbarron@ddive.com>
Cc: netfilter@lists.netfilter.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2004 at 01:36:37PM -0700, Dan Barron wrote:
> Hello,
>=20
> I have been struggling with setting up my iptables firewall to allow for=
=20
> RTSP & RTP connections to a Darwin Streaming Server.  Can anyone point to=
=20
> me to information on how to setup iptables properly to make this work?  I=
=20
> have a firewall with a public Internet connection and a DMZ and private=
=20
> LAN.  The Darwin server lives on its own server in the DMZ.
>=20
> Thank you in advance for any insight you can provide for this.

There is a patch to create an RTSP module here:

  http://home.tig-grr.com/rtsp/

It is a bit out of date.  If the patch does not apply cleanly, let me know
and I can update it.

This has also been packaged into a patch-o-matic entry.  I did not do the
packaging and I don't use patch-o-matic, so if you encounter issues please
post them to this list.

--=20
Hippopotomonstrosesquippedaliophobia is the fear of long words

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkD/vFcACgkQFMm9uvwPXW5aCgCfYPWQul9FA8crzCwnljO6t4a+
o2gAoIvRMKyTx1h7AdlruUe9yJcH2P/b
=AUNZ
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

