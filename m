From: Emmanuel Lesouef <elesouef@nerim.net>
Subject: interfaces on a gateway w/ DSL connection
Date: Mon, 31 Mar 2003 12:28:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030331122823.670ea7d9.elesouef@nerim.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="_wYTFc=.5t?xITcA"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter ML <netfilter@lists.netfilter.org>

--_wYTFc=.5t?xITcA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On my gateway, which is connected to the Internet through a DSL
connection with an ethernet modem (PPPOE), I have two interfaces to
access the internet : ppp0 and eth0.

On which of them do I have to work ?

For example, with the INPUT chain, what is the interface that I have to
put after the -i parameter ?

manu

--=20
Emmanuel Lesouef
Association CaLviX
Caen - 14000 (France)
elesouef@nerim.net
Cl=E9 GPG : http://elesouef.dyndns.org/elesouef.asc
Fingerprint : 626E 56B4 A54A 7169 E68A  CE47 D942 C2B7 5ECF 045E

--_wYTFc=.5t?xITcA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+iBhK2ULCt17PBF4RAowlAKC474Qud190Q/pJ86l5O126FsS1ZgCfXxDB
lMSLBy79JNKJRezTT4TVF1A=
=SxdS
-----END PGP SIGNATURE-----

--_wYTFc=.5t?xITcA--

