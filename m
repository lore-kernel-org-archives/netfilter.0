From: Moritz Warning <moritzwarning@web.de>
Subject: Captive portal on a bridged interface
Date: Wed, 17 Jul 2013 00:21:16 +0200
Message-ID: <51E5C75C.8020003@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010808030505070508030105"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------010808030505070508030105
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi, I like to create a captive portal on a bridged interface.
Every approach I have used so far didn't work.

Let this be the setup:

sysctl -w net.bridge.bridge-nf-call-iptables=1
sysctl -w net.ipv4.ip_forward=1

ifconfig eth1 0.0.0.0
ifconfig eth2 0.0.0.0
brctl addbr br0
brctl addif br0 eth1
brctl addif br0 eth2
ifconfig eth1 up
ifconfig eth2 up
ifconfig br0 10.0.0.33 netmask 255.255.255.0 up
route add default gw 10.0.0.1

Clients are behind eth2 and can access the Internet
using a gateway somewhere behind eth1.
Every packet from an unknown client (by mac) need to be blocked
from accessing everything except DNS and 10.0.0.0/8.
HTTP-requests (Port 80) need to be redirected to
the local web server (the captive portal).

My best start so far is this:
ebtables -t broute -A BROUTING -p IPv4 --ip-proto tcp --ip-dport 80 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -p IPv4 --ip-proto tcp --ip-sport 80 -j redirect --redirect-target DROP
iptables -t nat -I PREROUTING 1 -p tcp --dport 80 -j DNAT --to-destination $br0_ip_addr

It seems to successfully redirect http requests to the local web server.
But e.g. adding ! -d 10.0.0.0/8 as an exception doesn't seem to work.


After reading a lot of documentation it still leaves my head spinning.
Can anybody give me a few hints what rules I do need?

For what it is worth, the system is OpenWrt. :-)

Thanks,
mwarning
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJR5cdcAAoJECHrh56PP4wpWXgH/0gUSVjJ1jPezokX+hys8DW8
lq85qskT8CohyXPiOlM0Uzx4K0MCzKDEDiHbOKcK1yYwH1AEZx78GKg9omuTxWir
WCm0LeIzea3GD68Ucg0X9naYKPd+6yoSKebCJxQWdxdYrlElQITo07syHWaXfhX6
Na5Sz8J502n0yAOU4gTfGbamiC3gKwIUL4EMNTXQl1D8M0DZlRVx9J3AZTd7mk/4
Mk4U/HBiEoalDC4FMOJqA3Lutk+/oquRoYeQMT9uKu23KYwZ1TDtjsw2v1MGiveI
kWqiZ7VnNcWRLAbrneRThRnGBIF+USHhHKew66pY78qbTLmp/barr9LeEWsTZ0w=
=NiFo
-----END PGP SIGNATURE-----

--------------010808030505070508030105
Content-Type: application/pgp-keys;
 name="0x8F3F8C29.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0x8F3F8C29.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (GNU/Linux)

mQENBE4AyPYBCADkGiKAkQFSKNm29YgLmDpBPzfO2pdLbaLf9GID5noRIPX7oRT8
yhL6o2MVOpS/HGtRqcBW8JL2nrg5zxgtBZE5skQG/BsAk3jI+DttvTy7IUSOo98J
1aHueMbHVehOYz43zoiQqXvfmr75/+vLn/cL0JoBTVZ9jlI3cSnPGaaA1UVT9L5a
9HmWZFrwCi2+35OxSR65j2uYFbhxhHmnYZgTMbwsNCRHyaZBp81AOlWU1JgasXU3
oAhhBHMAioqmERAlDlx5tHXHujbCinYMZXw8uF3xnhA2iuoJr15DdwunZCh9MAV1
GF9y41lnpFPxoqUWTrnZCcro6LxP3spcEZcVABEBAAG0JU1vcml0eiBXYXJuaW5n
IDxtb3JpdHp3YXJuaW5nQHdlYi5kZT6JAT4EEwECACgFAk4AyPYCGwMFCQlmAYAG
CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJECHrh56PP4wpBl8H/1JTPSHuCM6t
GPFFvhQwSSCc2TlXAVoAHdkSX1rLlmY5OVJygHin6hnWjWbUsWEwOc8RS9VAkPU+
t9g/fC1VXSCIaNGm8nJDgqB2/pKDWHtUKzeCD5Yd4fOVqu3DuMXsRT07nAWKpMHF
s7zDAH0zliUdMuovnwee9P13ORw+YIvWBJmitzosUWXbvTd2dA/4Q1rpt85Zc18n
IfIkvFpyq7QMaQe1LSqFShVSeXsiQjjkTR8xyg5XHNNMK8M0wI2EXDa+2mNgeQYH
4X3hXzmorcqxmn6O9lnedHuzLErpdZJlywK90nCxdwkgpTBPDj8E+Hemsw+rikOX
TbuZcnbSDB+5AQ0ETgDI9gEIAMjGoGjf8f78tOc/hFidcoUYuCNufoHu6U3xwi3e
fCGuXZDxDWuwl0tlwV6j42TVoucRjszn7KpBWquJtGVu8iKN9/KhHdTYM+mbaQzL
EkmuJLDeCRN5YC6GUSsBYIzObXOHCdn6wgTRu2ST3Ri97btJGZloH4Dgd3GGi2Hj
6QmCMRxKBMvPksHOh3Y2QzqBIt/dx18lPxhLrPq1KNuH5wcK+/dsk5/6HVht0RLB
qUkB0QPvrqDKvlP5KYykqfu1Uj7zlLlcSsoL7+af5hxGCqD7IUhXFbURlthM84rb
8vuB+lLWFUZaacDlNpqCJY57forfMrXUxqGa4cF1RKDiBi0AEQEAAYkBJQQYAQIA
DwUCTgDI9gIbDAUJCWYBgAAKCRAh64eejz+MKdoFB/0TLIp1PeRZT72yXmo/NFha
6fXuPghXCDOliFJWEocIRgzh+kqtCEFkwqCvxMPE0WX2nih36p0YPDwVsU7v2bDX
/u8p3c4qdIfHkJl2Ak3ZKVHlUyYhmufNyz9Ir7iilRGOMlCy7/WAfnuP1nWx1SkA
QvXIPnfkJZPB6YD6cS0Y8wCUXEBN1v/z4mz9uSKPZx/wsDXP4sqjtH7EZccBdV16
Br2hd+PCIyJGPniv1V87AfiPp9tE0U6xIOoj4lBRpMUnzg00kR49I8HmZM7kTVzs
ovGW6bASizJjQJpe51nZqX6/ac5aPNvCC8H9pyaqZAAO/eexc5AeshgN+CqXXkXl
=Ug5s
-----END PGP PUBLIC KEY BLOCK-----

--------------010808030505070508030105
Content-Type: application/pgp-signature;
 name="0x8F3F8C29.asc.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0x8F3F8C29.asc.sig"

iQEcBAABAgAGBQJR5cdcAAoJECHrh56PP4wpL2sIAJVXOM6HQ2yjSiv27GAVdjIz+kNQg5a4
fSpJLU/XLRyj55t+c2lzganE1ubOO3zIGz/xwSnTK7lZtC9dheAyJ51B+lSyDRpdchLdULE1
vZiEnNv6+HmWcXgLxSjcSWUg6D2sYzo4FjU/odhVc8peqBEtUGVodEIW2OY831/l7hKT6l3l
30ugowZ1SQXrQu3vI73qd84icAsLtY56RDGAUVtUgAZMAptsaHPebs6IVxq0a4vkPwSMv/Ux
6OvWDSJ1UHksbSsvBPjs3tsnj+rZkPHGv2Rv96I+0zFzUZtIiQyLlaZOYkhHo4qoLRUSBNFx
GeFJJyDJpPNZBffpdliJ3sU=
--------------010808030505070508030105--
