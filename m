From: Athan <netfilter@miggy.org>
Subject: Re: Rejecting udp
Date: Mon, 3 Mar 2003 17:38:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303173805.GB24602@miggy.org>
References: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Michael K <micke@klintan.se>
Cc: netfilter@lists.netfilter.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 03, 2003 at 06:28:01PM +0100, Michael K wrote:
> I saw this rule someware on the net.
> $IPTABLES -A FORWARD -o $EXTERNALIF -p udp --dport 137 -j REJECT
>=20
> Whats the use to use reject on a UDP packet? Isn't udp connection-less
> A more correct shouldn't that be "-j DROP"? Or am I thinking wrong here?

   REJECT is "return some ICMP code saying 'no go'" usually something
like 'port unreachable'.
   DROP is "just forget about this packet, send nothing back to the
source".

  Thus the difference has nothing to do with connectionful vs.
connectionless.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5jkv0ACgkQzbc+I5XfxKcPCgCeIQvjC7LSTXoItkTO+ttDAd+F
AK4AoIsmmmlSuDDekZ6nU69XUVP9HL0N
=tOeE
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--

