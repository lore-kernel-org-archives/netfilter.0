From: Lopsch <lopsch@lopsch.com>
Subject: Re: CONNMARK patch do not work in kernel 2.6.9
Date: Tue, 14 Dec 2004 02:41:58 +0100
Message-ID: <41BE44E6.4010407@lopsch.com>
References: <1241129595.20041204132415@roger.net.ru>	<41B3271B.20008@lopsch.com>
	<1916839365.20041214012818@comtv.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enigD38A80FD560D1814B643AEE7"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1916839365.20041214012818@comtv.ru>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD38A80FD560D1814B643AEE7
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Evgeniy Zaitsev schrieb:
> Hello, Lopsch.
>=20
> Sunday, December 5, 2004, 6:19:55 PM, you wrote:
>=20
>=20
>>>I try to use latest patch-o-matic to
>>>I have tried to use last patch-o-matic
>>>(patch-o-matic-ng-20040621.tar.bz2 also do not work)
>>>for addition of purpose CONNMARK in iptables on a kernel 2.6.9
>>>
>>>But the patch is not set, as does not find the necessary lines of a co=
de in a file
>>>linux/net/ipv4/netfilter/ip_conntrack_standalone.c
>>>
>=20
> L> Try this:
>=20
> Thanks, Lopsch, patch are works. It appears, for its imposing it was
> necessary to take advantage switcg "-F 3", As with "-F 2 " don't
> passed any chunks.
>=20
> Unfortunately, I have faced the same problem, as with previous a patch =
(patch-o-matic-ng-20040621)
> on a kernel 2.6.7
>=20
> iptables -t mangle -A PREROUTING -i eth1 -j prert_services_ctv_spec_ctv
> iptables -t mangle -A prert_services_ctv_spec_ctv -s 10.0.0.0/8 -m mac =
--mac-source 00:90:27:A7:58:21 -m
> state --state NEW -j CONNMARK --set-mark 0x40=20
> iptables -t mangle -A prert_services_ctv_spec_ctv -m mark --mark 0x40 -=
j ACCEPT=20
> iptables -t mangle -A prert_services_ctv_spec_ctv -s 10.0.0.0/8 -m stat=
e --state NEW -j CONNMARK
> --set-mark 0x60=20
> iptables -t mangle -A prert_services_ctv_spec_ctv -m mark --mark 0x60 -=
j ACCEPT=20
>=20
> In this rules list a command
> iptables-t mangle-A prert_services_ctv_spec_ctv-m mark - mark 0x40-j AC=
CEPT=20
> does not work:
>=20
> # iptables -t mangle -nxvL  prert_services_ctv_spec_ctv
> Chain prert_services_ctv_spec_ctv (1 references)
>     pkts      bytes target     prot opt in     out     source          =
     destination
>        5      304 CONNMARK   all  --  *      *       10.0.0.0/8        =
   0.0.0.0/0           MAC
> 00:90:27:A7:58:21 state NEW CONNMARK set 0x40
>        0        0 ACCEPT     all  --  *      *       0.0.0.0/0         =
   0.0.0.0/0           MARK match
> 0x40
>      116     6048 CONNMARK   all  --  *      *       10.0.0.0/8        =
   0.0.0.0/0           state NEW
> CONNMARK set 0x60
>    57464 48953156 ACCEPT     all  --  *      *       0.0.0.0/0         =
   0.0.0.0/0           MARK match
> 0x60
>=20
>=20
> This commands used for "not simple routing":
>=20
>                                       ----- router1 ---\
>     LAN1            LAN1-router,NAT  / mark 0x40        \
> 192.168.1.0/24 ---> 192.168.1.1(eth1)                      LAN2 10.0.0.=
0/8
>                                      \ mark 0x60        /
>                                       ----- router2 ---/
>=20
>=20
> LAN2, 10.0.0.0/24 it is possible to enter two different ways, through
> router1 with mac addr 00:90:27:A7:58:21 and through router2.
>=20
> Inside LAN1 are a servers which from LAN2 are visible under different
> IP-addresses (router1 and router2 addresses).
> Therefore it is necessary  what the inquiry coming through router1 in
> LAN1, back came back as through router1. For router2 - it is similar.
>=20
> For this purpose I marking incoming connections (from LAN2) in a chain
> "prert_services_ctv_spec_ctv" (*mangle table) and when packets on this =
connection come back in LAN2,
> they depending on marks (I apply - restore-mark) on the same channel on=
 whom they and came.
>=20
> But the matter is that a command
> iptables-t mangle-A prert_services_ctv_spec_ctv-m mark - mark 0x40-j AC=
CEPT=20
> does not work, therefore all entering connections are marked as 0x60
> and are sent through router2 :(
>=20
> I where that was mistaken in a spelling of rules?
> I can not understand in any way. Thought, switching to kernel 2.6.9 wil=
l rescue, appeared - has not
> rescued.
>=20
>=20
>=20
>=20
Sorry I can=B4t help, because I don=B4t understand what you=B4re trying t=
o=20
explain and the topology of that network :(.

--=20

PGP-ID 0xF8EAF138

--------------enigD38A80FD560D1814B643AEE7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQb5E6SXe0Lt4Z4FpAQHC5BAAi8Hi9ErBWIWwX9e6JBAx9XHItTI1F67s
WMJBO1YgzJZrdSEaIlgbOyRis0AS/P8PNBV/NECynx84xgulhVBb/f5KrvveVdUb
3ThtizqgElsr8CwP6hr7zuaIcY28IsSMBVAjhYqMmvLavnv+HINXW70OmKJFAImw
n3fq9IXM6W28ailUR7Js2mly6nn8jt6PoW8y5AQv6B8DIXy6iqCvFTJaQZJFZDuZ
2gfhLnBpApXmSHZKiYplcTBurlu6/GyeOMZM5Xe6gOphCT15SGBzjMnb6y7h+1lJ
60nrl19VYCdmyZjQ/bx0x7gTcY0GXej9t98o7fGR5SUYWkJDa5Oxdb7JdIVNvEmx
N+uef2gXD8+p3QBtbsvzwDZcmm1Gu7lHmEklJajW6txtuQ1JjB0quFJCRc+t+88N
Zg6m58GDk781YbjS9loAKyd4ocDaAIXoCi9OrzMac3yu15zfpNsPQDCtX7+Zh/oR
zwfWbUXd0OCMyUSS2OUyA7ZEMdVEnq9Pf9BrhCcrtoK5RtOwejIC/uEW4BWgZIIQ
i11p+LOu616tF1uXqYk4nYzPZsnBf8OTRgHhpdgIbHjb2J1pTjbwBsKawI0J4Sqy
Gi+YG6moQI8AwPLPUzW+tyTAtQxW/gzIYjb+594Me/01AuOcyAJDS5fm7eX92Ncm
uBZ+nCqU9O0=
=hRfE
-----END PGP SIGNATURE-----

--------------enigD38A80FD560D1814B643AEE7--


