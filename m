From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: strange packets on loopback
Date: Tue, 22 Jun 2004 17:57:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040622155738.GA28370@koala7>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=liOOAslEiF7prFVr;
 protocol="application/pgp-signature"; micalg=pgp-sha1
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
To: netfilter@lists.netfilter.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

i have a firewall setup like this:

 /--------\
/ Internet \
\---------/
     |
  ___|____
 | Router |
 ----------
     |
     |
     |ext FW interface (y.y.y.y)
  ___|______
 | Firewall | (also routing)
 ------------
     | int FW interface (z.z.z.z) (default gw for PCs on lan)
     |
 /---------\
/ local net \ a.a.a.0/24
\----------/

 =20
my netfilter-based firewall logs packets like this:

INPUT DROP XX: IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:=
00 \
SRC=3Da.a.a.a DST=3Dy.y.y.y LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D255 ID=3D=
0 \
DF PROTO=3DTCP SPT=3D1249 DPT=3D8080 WINDOW=3D0 RES=3D0x00 RST URGP=3D0

where a.a.a.a is an IP on my local lan and y.y.y.y is the IP of the external
firewall interface.

I do have a squid proxy running on the firewall listening at 0.0.0.0:8080
and the clients are set up to use y.y.y.y:8080 as proxy, but i find it
rather strange that the IN-interface is listed as 'lo', while it should be
'int0' (i have renamed my interfaces as int0 and ext0 using nameif).

It also seems that I only log packets with the RST flag, no others.

The service itself is running fine, and the packets are dropped because i
only accept packets from lo that have a source address of 127.0.0.1, y.y.y.y
or z.z.z.z).

So unless I understand the concept of loopback completely wrong i think that
IN should only by 'lo' when the source address is on of the IP addresses of
the local interfaces, including lo.

Is this a bug?

I'm using iptables v1.2.6a and linux-2.4.26 with grsecurity-2.0-2.4.26.patch
on a Debian/Woody system.

I would be greateful for an explanation.

thx,

Nils Juergens

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA2Fbylkk/tUOsNeMRAihAAJ4htgquz+ojllUGBijNdvgjTxXRdQCfVj1D
9c3HF0D2koJqj8chCZdotT4=
=+RKJ
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--


