From: Daniel Dehennin <daniel.dehennin@baby-gnu.org>
Subject: IP set and match skiping
Date: Sun, 03 Oct 2010 11:20:37 +0200
Message-ID: <87bp7beioq.fsf@hati.baby-gnu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Testing xtables-addons[1] 1.30 on a virtual system, I have some
questions for my setup and regarding the xtables-addons next branch[2].

I want to avoid duplication, I have one ipporthash for my DMZ services
(behind a NAT) and would like to be able to skip some tests or fix one
argument:

ipset -N dmz-services ipporthash --network 10.1.1.0/24
ipset -A dmz-services 10.1.1.2,www
ipset -A dmz-services 10.1.1.2,smtp
ipset -A dmz-services 10.1.1.2,ssh

# DNAT by server
# Match only ports=20
iptables -t nat -A PREROUTING -i internet -m set --match-set dmz-services s=
kip,dst -j DNAT 10.1.1.2


Another this if several dmz servers hosts different services:

# Add a new service for a new host
ipset -A dmz-services 10.1.1.3,kerberos

# Match services hosted on 10.1.1.2
iptables -t nat -A PREROUTING -i internet -m set --match-set dmz-services 1=
0.1.1.2,dst -j DNAT 10.1.1.2
# Match services hosted on 10.1.1.3
iptables -t nat -A PREROUTING -i internet -m set --match-set dmz-services 1=
0.1.1.3,dst -j DNAT 10.1.1.3

Is it a possible-to-add feature?

Regards.

Footnotes:=20
[1]  http://www.baby-gnu.org/debian-asgardr/changelogs/pool/main/x/xtables-=
addons/xtables-addons_1.30-1/changelog

[2]  http://www.spinics.net/lists/netfilter/msg49256.html

=2D-=20
Daniel Dehennin
R=C3=A9cup=C3=A9rer ma clef GPG:
gpg --keyserver pgp.mit.edu --recv-keys 0x6A2540D1

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEAREKAAYFAkyoSuUACgkQb97L6l6P4FsF+QCfYznKPIt/mUeaVmNjmik4N6ws
DLsAn2YW1woCekYdmh71LSUTa7l4ip0/
=sbXB
-----END PGP SIGNATURE-----
--=-=-=--
