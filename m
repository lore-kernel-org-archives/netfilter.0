From: Harald Welte <laforge@netfilter.org>
Subject: Re: Documentation on libipq
Date: Tue, 24 Jun 2003 19:14:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624171453.GY2645@sunbeam.de.gnumonks.org>
References: <3EF0DC6A.1090704@GameBox.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cJfXB9mphngkt5vq"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3EF0DC6A.1090704@GameBox.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Abhinav Gupta <a.gupta@GameBox.net>
Cc: netfilter@lists.netfilter.org


--cJfXB9mphngkt5vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2003 at 03:40:58PM -0600, Abhinav Gupta wrote:
> Hi,
>=20
> Is there any documentation available for libipq? If there is, can=20
> someone please send me links to it?

man libipq
man ipq_create_handle
man ipq_destroy_handle
man ipq_errstr
man ipq_get_msgerr
man ipq_get_packet
man ipq_message_type
man ipq_perror
man ipq_read
man ipq_set_mode
man ipq_set_verdict

All included in the standard iptables package.
=20
> Thanks in advance,
> Abhinav.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--cJfXB9mphngkt5vq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE++IcNXaXGVTD0i/8RAgvAAKCznO8KBCwdSEMkUcdVkHIX1A+krQCfdhKj
xP29ObIW+bfrqQ9wTJYziqI=
=OsNK
-----END PGP SIGNATURE-----

--cJfXB9mphngkt5vq--

