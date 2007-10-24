From: Volker Sauer <volker@volker-sauer.de>
Subject: Problem with new --physdev-out style
Date: Wed, 24 Oct 2007 09:18:54 +0200
Message-ID: <20071024071854.GA18581@volker-sauer.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

with recent kernels, I have this problem:

kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and
POSTROUTING chains for non-bridged traffic is not supported anymore.

What does "non-bridged" in this context mean?? If it means rules (or
traffic) that goes over the INPUT our OUTPUT chain, I do not understand,
why my rule set causes this message to appers a thousand times.

Here's all my rules with --physdev-out:

arthur: ~ # grep physdev-out /etc/init.d/firewall
$IPTABLES -A FORWARD -o $BR_INT -m physdev --physdev-out $IF_INT -i $IF_EXT=
 -d $localnet -s $Any -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_INT --physdev-o=
ut $IF_DMZ -s $ZAPHOD -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_INT --physdev-o=
ut $IF_DMZ -s $localnet -p tcp -d $MARVIN --dport 3389 -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_DMZ --physdev-o=
ut $IF_INT -d $ZAPHOD -p tcp --dport 135:139 -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_DMZ --physdev-o=
ut $IF_INT -d $ZAPHOD -p udp --dport 135:139 -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_DMZ --physdev-o=
ut $IF_INT -d $ZAPHOD -p tcp --dport 445 -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_DMZ --physdev-o=
ut $IF_INT -d $ZAPHOD -p udp --dport 445 -j ACCEPT
$IPTABLES -A FORWARD -i $BR_INT -m physdev --physdev-in $IF_INT --physdev-o=
ut $IF_DMZ -s $ZAPHOD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -o $BR_INT -m physdev --physdev-out $IF_INT -i $BR_GUE=
ST -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $BR_GUEST -o $BR_INT -m physdev --physdev-out $IF_D=
MZ -p tcp --dport 3389 -j ACCEPT
$IPTABLES -A FORWARD -i $BR_GUEST -o $BR_INT -m physdev --physdev-out $IF_I=
NT -p tcp --dport ssh -j ACCEPT
$IPTABLES -A FORWARD -i $BR_GUEST -o $BR_INT -m physdev --physdev-out $IF_I=
NT -p tcp --dport 30022 -j ACCEPT
$IPTABLES -A FORWARD -i $IF_EXT -o $BR_INT -m physdev --physdev-out $IF_DMZ=
 -p tcp --sport 22 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $IF_EXT -o $BR_INT -m physdev --physdev-out $IF_DMZ=
 -s $i -p udp --sport 53 -m state --state ESTABLISHED,RELATED -j ACCEPT


Where:=20

BR_INT=3D"br-intern"
BR_GUEST=3D"br-guest"
IF_EXT=3D"eth0"
IF_INT=3D"eth1"
IF_DMZ=3D"vlan3"

You see, I use --physdev-out only in the FORWARD with bridged traffic,=20
because the Interfaces given with -i or -i in these rules are always=20
bridges (br-intern or br-guest).

Why do I get thousands of these error messages?

--=20
  Volker Sauer  *  Poststrasse 1/601   *   64293 Darmstadt  *   Germany
  E-Mail/Jabber: volker(at)volker-sauer.de * http://www.volker-sauer.de
  PGPKey-Fingerprint: DB26 11C7 B12E 0B27 3999 2E4F 7E35 4E4D 5DD5 D0E0
  http://wwwkeys.de.pgp.net/pks/lookup?op=3Dget&search=3D0x7E354E4D5DD5D0E0=
=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHHvHefjVOTV3V0OARAk2/AJ0XMh0smxjivdJWGW7oKXjUUMpXRgCfYBc7
Rh1jnddjavBN+T+gz+DONqI=
=WL/C
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
