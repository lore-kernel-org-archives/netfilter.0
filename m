From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: Wrong ips
Date: Thu, 01 Feb 2007 13:37:32 +0200
Message-ID: <45C1D0FC.9050908@gmail.com>
References: <200702010851.14795.alp@rosten.elektra.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig03A16AA564AFD68A5EE03B3C"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702010851.14795.alp@rosten.elektra.ru>
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
--------------enig03A16AA564AFD68A5EE03B3C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Alexander Pyhalov wrote:
> Hello.
> Maybe I'm doing something wrong, but I have the following trouble.
> I have kernel 2.6.17.11 and options, related to netfilter in it :
> //////////////////////////////////////////////
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> CONFIG_NETFILTER_NETLINK_LOG=3Dm
> CONFIG_NETFILTER_XTABLES=3Dm
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> CONFIG_IP_NF_CONNTRACK=3Dm=09
> CONFIG_IP_NF_FTP=3Dm
> CONFIG_IP_NF_IRC=3Dm
> CONFIG_IP_NF_TFTP=3Dm
> CONFIG_IP_NF_AMANDA=3Dm
> CONFIG_IP_NF_QUEUE=3Dm
> CONFIG_IP_NF_IPTABLES=3Dm
> CONFIG_IP_NF_MATCH_IPRANGE=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_IP_NF_TARGET_REJECT=3Dm
> CONFIG_IP_NF_TARGET_LOG=3Dm
> CONFIG_IP_NF_TARGET_ULOG=3Dm
> //////////////////////////////////////////////
>=20
> lsmod shows, that all related to netfilter (as I think)  modules are lo=
aded:
> af_packet              16904  0
> xt_tcpudp               3584  0
> ip_queue                8480  0
> ipt_iprange             1920  0
> ipt_REJECT              4608  0
> ipt_LOG                 6656  0
> iptable_filter          2816  0
> ip_tables              14556  1 iptable_filter
> x_tables               12932  5 xt_tcpudp,ipt_iprange,ipt_REJECT,ipt_LO=
G,ip_tables
> capability              5128  0
> commoncap               7424  1 capability
> ...
>=20
> iptables version is 1.3.6
>=20
> I'm trying to add some rules, but they don't work, when contain port nu=
mbers:=20
>=20
> When I'm adding the following rule
>=20
> #  Access to HTTP server
> iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> #  Access to SSH is allowed to all
> iptables -A INPUT -p tcp -m --dport 22 -j ACCEPT

This line is wrong ^

> #  Access to Tomcat
> iptables -A INPUT  -s <ip1>ACCEPT
> iptables -A INPUT  -s <ip2>  -j ACCEPT
> # Access to SMB is allowed to all
> iptables -A INPUT -p tcp -m --dport 139   -j ACCEPT=20
> iptables -A INPUT -p tcp -m --dport 445   -j ACCEPT=20
> iptables -P INPUT REJECT=20
>=20
> I can't ssh to server.=20
> When I do=20
> iptables -A INPUT -s <my ip> -j ACCEPT
> everything is fine.
>=20
> Now I do=20
>=20
> iptables -A INPUT -p tcp -m tcp -s <my ip>   -j LOG
>=20
> and got something strange in log:
> eb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c:=
00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D255.255.0.13 LEN=3D15942 =
TOS=3D0x14
>  PREC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D47.98.0.13 LEN=3D15942 T=
OS=3D0x14 P
> REC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D0.0.8.0 DST=3D0.0.0.13 LEN=3D0 TOS=3D0x00 =
PREC=3D0x00 T
> TL=3D0 ID=3D0 PROTO=3D0
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D0.0.0.13 LEN=3D15942 TOS=
=3D0x14 PRE
> C=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:12 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.49.48.58 DST=3D255.255.0.13 LEN=3D15942=
 TOS=3D0x14
>  PREC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:13 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D58.48.57.58 DST=3D255.255.0.13 LEN=3D15942=
 TOS=3D0x14
>  PREC=3D0x20 TTL=3D49 ID=3D25954 MF FRAG:32 PROTO=3D32
> Feb  1 08:15:13 athena kernel: IN=3Deth0 OUT=3D MAC=3D00:0d:60:eb:a7:7c=
:00:02:b3:d6:be:9d:08:00 SRC=3D0.0.0.0 DST=3D0.0.0.13 LEN=3D19526 TOS=3D0=
x04 PREC=3D0x
> 40 TTL=3D0 ID=3D257 FRAG:256 PROTO=3D0
>=20
> But these ip addresses are not my ip addresses.
> They even don't exist in network environment....
>=20
> =20
>=20
>=20


--=20
regards,
Georgi Alexandrov

key server - pgp.mit.edu :: key id - 0x37B4B3EE
Key fingerprint =3D E429 BF93 FA67 44E9 B7D4  F89E F990 01C1 37B4 B3EE


--------------enig03A16AA564AFD68A5EE03B3C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFFwdD8+ZABwTe0s+4RAj99AJ9rGt4mI+VdP9RG5XugNxCnAghvugCZAUVF
u4lXtO6Gopv5R6a34+kHr1Q=
=hMPg
-----END PGP SIGNATURE-----

--------------enig03A16AA564AFD68A5EE03B3C--

