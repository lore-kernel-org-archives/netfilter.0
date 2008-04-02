From: martin f krafft <madduck@madduck.net>
Subject: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Wed, 2 Apr 2008 23:26:53 +0200
Message-ID: <20080402212653.GC11325@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I have two IPv6 hosts and while one can ping other hosts fine, the
other cannot. I use the simplest ip6tables configuration on both:

  -P INPUT DROP
  -P FORWARD DROP
  -P OUTPUT ACCEPT

  -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
  -A INPUT -j LOG --log-prefix "[INPUT6]: "

On a Debian sid host with 2.6.24, this works fine and my ping6
packets get answered.

On the host running Debian etch with 2.6.18, the ping6's leave, are
answered, but the firewall then catches them:

  [INPUT6]: IN=3Deth2 OUT=3D
  MAC=3D00:16:3e:46:5a:86:00:0e:d6:b8:dc:1b:86:dd SRC=3D
  2001:41e0:ff00:003b:0000:0000:0000:0001
  DST=3D2001:1620:2004:0000:0000:0000:0000:0002 LEN=3D104 TC=3D0 HOPLIM
  IT=3D48 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D129 CODE=3D0 ID=3D48901 SEQ=3D1

I cannot really reboot the 2.6.18 machine to install the backported
2.6.24 on it right now, and I'd first like to know if the kernel is
actually the culprit.

Are you aware of this issue having been fixed between then and now?

Thanks,

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"all women become like their mothers. that is their tragedy. no man
 does. that's his."
                                                        -- oscar wilde
=20
spamtraps: madduck.bogus@madduck.net

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH8/odIgvIgzMMSnURArgdAKCxUTzbxr0z5n7YD+9t+moZrd0u2gCgzt3Y
MCHgjd2u6i0zgTTa0D6/wTU=
=cK0e
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
