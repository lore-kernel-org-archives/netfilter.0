From: sshore@escape.ca
Subject: Re: DHCP and conntrack?
Date: Fri, 7 Jun 2002 12:38:35 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020607173835.GA599@escape.ca>
References: <3D00E6A3.30006@athensgroup.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3D00E6A3.30006@athensgroup.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: James Garrison <jhg@athensgroup.com>
Cc: netfilter@lists.samba.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2002 at 12:00:19PM -0500, James Garrison wrote:
> Does connection tracking understand incoming DHCP responses as
> being related to recent outgoing broadcast DHCP requests?  In other
> words,  if I configure iptables to allow outgoing DHCP broadcast
> requests, do I have to explicitly open up a hole for the returning
> response, or will conntrack do it for me with RELATED?

Since dhcp requests go out on port 68, and responses come back on port 67,=
=20
connection tracking will not relate them. you'll need to explicitly open=20
up a hole for the returning response.

--=20
Scottie Shore <sshore@escape.ca>
"You haven't gamed until you've circle-strafed while barrel rolling."
  - Blair on the Logitech Cyberman II

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9AO+aDEv+3WCgcv0RAqFfAJ9ec8PLFDeBB6U0adnIuqNgaHJGMwCgnQMx
AYCxUTxKsvFhZpZnWRd7Qcs=
=PJQ+
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

