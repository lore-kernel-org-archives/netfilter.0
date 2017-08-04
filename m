From: aeris <aeris@imirhil.fr>
Subject: LXC and netfilter log
Date: Fri, 04 Aug 2017 21:02:44 +0200
Message-ID: <2002586.aotkqkl0s5@home>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2773739.po0BiS6i1I"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imirhil.fr; s=mail;
        t=1501873368; bh=z/seTtRoTszTUhrYA5/UUJLu0QYYHM6lKXvB5ZTXjuc=;
        h=From:To:Subject:Date:From;
        b=lJ3WUQ8aHzMjFQlBWefDx2+Z2lY5M0gYheFX0FHkH6iF7tmI59fQx1IjAF8k3u/rX
         2OPZwzrsiZPsJSK5itj5107miqlXhyvNUSA6jZMXZ/vMMhcoLQmeMSq8Y4xFQGGDeY
         5N0NNOpGgYNQRMDmUl/b6Su2q1TnrR55AkP0cvPI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org, lxc-users@lists.linuxcontainers.org

--nextPart2773739.po0BiS6i1I
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi here !

I have trouble with LXC and netfilter logging.

Configuring traffic log works like a charm on a baremetal machine and finis=
h in /
var/log/syslog as expected, but logs nothing when inside a LXC container, b=
oth=20
with iptables and nftables

iptables rules
	*filter
	:INPUT DROP [0:0]
	-A INPUT -j LOG --log-prefix INPUT

nftables rules
	table inet filter {
		chain input {
			type filter hook input priority 0
			policy drop
			log prefix "input " counter
		}
	}

On host :
	# sysctl net.netfilter.nf_log | grep -v NONE
	net.netfilter.nf_log.10 =3D nf_log_ipv6
	net.netfilter.nf_log.2 =3D nf_log_ipv4
On guest:
	# sysctl net.netfilter.nf_log | grep -v NONE
	net.netfilter.nf_log.10 =3D nf_log_ipv6
	net.netfilter.nf_log.2 =3D nf_log_ipv4
	net.netfilter.nf_log.7 =3D nfnetlink_log



I try to install ulogd2 on my container too, no more luck.

Does somebody here was able to do traffic logging inside a container ?

Regards,
=2D-=20
Aeris
Individual crypto-terrorist group self-radicalized on the digital Internet
https://imirhil.fr/

Protect your privacy, encrypt your communications
GPG : EFB74277 ECE4E222
OTR : 5769616D 2D3DAC72
https://caf=C3=A9-vie-priv=C3=A9e.fr/
--nextPart2773739.po0BiS6i1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEalTe3JvUhc/1wIPnIBavAgp8NmgFAlmExNQACgkQIBavAgp8
NmitQQ//ablsX6nCjHOp6yo35SPawLSuFHvqBSvKLlK9ubcAWde+0nUrkVFOE+Dl
ZNa3Guhuy9ByafOq3RPNb7YoLQ5kuOAjGX58jso02heqX14ng6LYIg+IrvCP9Hqw
fy4ca5D890YO418HdyY8LuDfivAqguGBUNV3tG5I3uvSVU2s+GJlB12Nn8f9kBz9
a5eoPiijSFmkIV1KdnCeUsig3HtDj5Hwip6QVf5qtBrEc2P+GekAlpjNkgotxPh3
XZecPeGUaN+UtWbl88qJHzmjm4VVL+d+XPnZkIQjJXQHmoAfyD9WRo7Rn2yLhYXt
k/M8mMwpekO7Xt6HwRGA4rCxlCsjBgzxi1rFArKVM6K32hQUAvO+nbNLQDAObR4d
6yaom6QmsNpo4BmNJvBFNnwtql9A6HV6WPvnw7Gaut+A1YBfGl/vQHMVqfxJXWsO
vdXoVhMvSUNEyPy9s4qRsOB51jiVWy61n8XxJL31HoNmpkExd5HNbbQi/IS+7QJd
zYhxxcoU4S55ilYOQfdSPafQ4yoASjgkwmEjpHAdlXyhhkhECtpYM6WY4j85/3ei
jqcFKwwlJCJ/ju/9lZE7k7M2ZvzpM34hR6P4tJGp0Cr4Nji8nV69tmt0fTD/HTvK
7fX7pFj9rHaF7T88JQB2f/05eyFumzyv1VSe2HY1eGxjT3sXa78=
=TZ9w
-----END PGP SIGNATURE-----

--nextPart2773739.po0BiS6i1I--

