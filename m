From: David T-G <davidtg-netfilter@justpickone.org>
Subject: where is libipt_match.so?
Date: Wed, 28 May 2003 23:43:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529034344.GF33081@justpickone.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>


--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again, all --

I have finally gotten my client to rebuild his SCO UnitedLinux machine
from scratch to give me a guaranteed-clean base and I tried running my
iptables setup script.  Everything (NIC discovery, init script creation,
etcetc) appears to have gone well but iptables has a problem:

  ...
  iptables -t filter -A INPUT -i eth0 -m match NEW,RELATED,ESTABLISHED -j A=
CCEPT
  iptables v1.2.7a: Couldn't load match `match':/usr/lib/iptables/libipt_ma=
tch.so: cannot open shared object file: No such file or directory

This worked before, but I had also mucked around with the SuSEfirewall2
scripts before; sure enough, it isn't there now.  Where does that file
live?  Do I need another RPM, perhaps?


TIA & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+1YHwGb7uCXufRwARAmwBAJ9ee2dt8CMGwDLjb+L1kUsRdktTmACeLZaz
uNY0c84bJwPoNy4wv1NrBKw=
=G33C
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--

