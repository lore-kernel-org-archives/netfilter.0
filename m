From: Athan <netfilter@miggy.org>
Subject: Re: Reg iptables Connection tracking
Date: Fri, 10 Jan 2003 14:02:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030110140237.GE22487@miggy.org>
References: <4223A04BF7D1B941A25246ADD0462FF5647695@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4223A04BF7D1B941A25246ADD0462FF5647695@blr-m3-msg.wipro.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Amit Kumar Gupta <amitkumar.gupta@wipro.com>
Cc: netfilter@lists.netfilter.org


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2003 at 10:33:48AM +0530, Amit Kumar Gupta wrote:
> As soon as somebody pings to my m/c , that fellow doesn't get the reply
> and on my m/c , kernel keeps dumping certain messages which are like
> this :-
>=20
> Ip_contrack: maximum limit of 1016 entries exceeded.

   echo 32760 > /proc/sys/net/ipv4/ip_conntrack_max

Works to increase the size of the table.  I had a problem with a default
of ~4092 for this when I was copying LOTS of files between machines
using "get -R directory" in ncftp.  The above cured it.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4e0n0ACgkQzbc+I5XfxKfU5QCcDys+nK33ViEg1Tu6KSRPUGcZ
Za4AnAlnBbM5O6ZI8GXBxP52KMsR53pX
=7Vvm
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--

