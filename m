From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: SYN/ACK and NEW packets
Date: Sat, 4 Aug 2007 21:21:09 +0200
Message-ID: <20070804192109.GB4205@sid.toystory.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Looking at this :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#SYNACKANDNEW

I understand that in order to prevent my ip address from being spoofed,
I should reject NEW packets with the SYN/ACK flags set and the others
cleared.

However, with the following nmap command I have tried to check it out :

nmap --scanflags SYNACK 192.168.0.1

all packets are known to be in the INVALID state rather than in the NEW
state.

state NEW tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 0 packet
state INVALID tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 170 packets

They talk about sequence number, as well, in the document, but I can't
figure out what difference it makes.

Did I miss anything ?

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGtNGlxJBTTnXAif4RArAdAKDEPpm95MXDNxIdGx90iWhSoD64WQCfWu1D
qFV8+u7/3jtRH/Vm4QO563c=
=7Lr0
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--


