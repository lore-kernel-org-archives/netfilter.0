From: Benoit Panizzon <benoit.panizzon@imp.ch>
Subject: max-src-conn-rate (Connection rate throttling per IP)
Date: Tue, 30 Aug 2005 14:40:55 +0200
Message-ID: <200508301440.59667.benoit.panizzon@imp.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2554468.DKvhB03YL7";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

--nextPart2554468.DKvhB03YL7
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all

I'm looking for a way to prevent connection DOSing of specific services.

The goal is to count the connection rate per conneting ip and then reject=20
those connections if they pass a certain limit.

It looks like OpenBSD's pf is the only packet filter (except some commercti=
al=20
=46irewalls) which has this ability.

The best I managed with iptables is to throttle the connection rate for a=20
specific port, but this of course affecs normal users trying to use that=20
service and does not change the fact of the service being DOSed.

The other possibility I found is to write my own userspace QUEUE target=20
connection rate tracker via the iptables api. But as I'm not a programmer a=
nd=20
I think this is a quite common request I just wonder:

Hasn't allready somebody written such a per source connection rate limmiter?

Is there a repository of different userspace QUEUE tools where I could find=
=20
something similar?

Regards
=2D-=20
Beno=EEt Panizzon, <bp@imp.ch>
=2D-----------------------------------------------------------------------
ImproWare AG, UNIXSP & ISP                   Phone:   +41 61 826 93 00
			     Kabelinternet-Hotline:   +41 61 826 93 07
Zurlindenstrasse 29                            Fax:   +41 61 826 93 01
CH-4133 Pratteln                               Net:   http://www.imp.ch/
=2D-----------------------------------------------------------------------

--nextPart2554468.DKvhB03YL7
Content-Type: application/pgp-signature

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDFFPbCVq2G/yL7/ARAhRBAKCWyc0S+LUMdftxuMeAWNAPpDKxHACeKrX8
m5w/MZwU40eAWniqKyLFRys=
=QhZy
-----END PGP MESSAGE-----

--nextPart2554468.DKvhB03YL7--

