From: Athan <netfilter@miggy.org>
Subject: Re: Scan not Nmap
Date: Fri, 27 Dec 2002 12:32:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021227123257.GG1878@miggy.org>
References: <006201c2ad8f$4c177710$d654fea9@wrl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006201c2ad8f$4c177710$d654fea9@wrl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2002 at 08:04:08AM -0200, William da Rocha Lima wrote:
>    Rules for blocking nmap the scan..

  There's no way to completely block such a scan if you NEED to have
some ports open, say for email server (smtp, port 25) or web server
(port 80).

  It looks like you can, at least, block an nmap 'NULL' scan though, by
using the 'unclean' match support in netfilter.

  Make sure you have CONFIG_IP_NF_MATCH_UNCLEAN set to Y or M in the
kernel config, and then simply use a couple of rules:

	iptables -A INPUT -i eth1 --match unclean -j LOG --log-level info --log-pr=
efix "fwd-unclean "
	iptables -A INPUT -i eth1 --match unclean -j DROP

Be sure to replace eth1 with your external interface.  This fooled nmap
-sN scan into thinking all ports were open, and it failed miserably to
guess the OS type with -O option.
  Note that a normal SYN scan (-sS) still works, as I said, if you have
a few ports open.

  Be aware that the 'unclean' match could possibly match on some valid
packets and block legitimate traffic.  I've only just started using it
now and will be keeping an eye on things.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4MSHkACgkQzbc+I5XfxKduJgCfTBWpuGSU/uRsebdxy7Kn+oYf
loAAn3XOH9+wR8wkxqM+CVECVlWbUAvp
=tF79
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--

