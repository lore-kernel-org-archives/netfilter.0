From: Alex Samad <alex@samad.com.au>
Subject: Help with set-mark and sip calls
Date: Tue, 23 Jun 2009 22:17:55 +1000
Message-ID: <20090623121755.GA12228@samad.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

I am using tc with htb + cfq to do some outbound traffic shaping, I
have a high priority band which I want to put all my voip traffic.

Currently I mark with 0x1 all traffic doing to the main sip server, but
what I have noticed is that is not the destination of the rtp traffic -
which is usually udp based - some where in the 10000 - 20000 range.

My question is does the nf_conntrack_sip follow the initial tcp 5060 sip
setup and associated the udp traffic with it and if so can I some how
use the related conntrack to mark the udp packets ?

i have something like

iptables -I POSTROUTING -d 125.213.160.81 -j MARK --set-mark 0x1

if i changed it to=20


iptables -I POSTROUTING -j CONNMARK --restore-mark=20
iptables -I POSTROUTING -d 125.213.160.81 -j CONNMARK  --set-mark 0x1



so is the connmark setmark the same as mark setmark - used by tc

and will nf_conntrack_sip understand its a related packet even though it
is to a different server.

Thanks

Alex Samad
PS please CC me as I am not on the mailing list


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpAx/AACgkQkZz88chpJ2MJtwCeNUKmctA5bVyKpyh3yyVC7vn8
zlYAoNkN1XnnUSyY66qUx71Y82qUR7GQ
=861y
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
