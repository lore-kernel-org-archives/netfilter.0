From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: New connection to windows boxes very slow, very fast after
	initial delay
Date: Tue, 16 Mar 2004 08:07:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079417253.4759.4.camel@raylinux.internal>
References: <C8DE82BEF24D0146862937D2A9DD0E92026842@qlmail2.qlogitek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-BJ18gEPSv8IsirVGHf1y"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C8DE82BEF24D0146862937D2A9DD0E92026842@qlmail2.qlogitek.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-BJ18gEPSv8IsirVGHf1y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-03-15 at 16:27, Miguel Laborde wrote:
> Hello all,
>=20
> 	I have a question that I'm sure some of you will be able to answer since=
 I vaguely remember something which might be related to
>  this. Awhile ago I read that MS had implemented a nonstandard 'feature' =
with respect to TCP/IP in which they appeared to skip the SYN=20
> step and go straight to an ACK for re-establishing a connection to a prev=
iously (assumeably within a certain time constraint) connected=20
> machine. Here is the article I was rememebering(just found it on Google),=
 now this has to do with IE, but I'm sure this 'feature'=20
> happens at the stack level and not application so it applies to any netwo=
rk related activity=20
> - http://grotto11.com/blog/slash.html?+1039831658
>=20
> 	I'm having a similiar situation when connecting from a windows machine t=
o another windows machine in the DMZ with an=20
> iptables firewall between. I've noticed, as well as others, that after no=
t connecting to the machine for awhile (ie: after a weekend)=20
> the initial connection results in about a 10-15 second delay however foll=
owing connections are instantaneous. When I say connection=20
> here I'm meaning connection to a share on the machine such as \\dmzmachin=
e\share and the explore window popping up.=20

This is the way that the SMB protocol works. It is UDP based, and
therefore 'connectionless' and entirely based on broadcasts. What is
most likely happening is that the local netbios name cache on your
source machine has been expunged of old entries (probably a preset time)
and your machine therefore has to re-lookup the ip/name pair for the
target machine and possibly re-authenticate, re-query all the shares,
etc.
>=20
> 	I've capture the interation with snort and noticed something that seems =
to confirm what I state in the first paragraph.
>=20
> 	After the weekend, haven't connected for days, this is the initial conne=
ction (all the Snort output). Note the packet flags are AP until there is s=
ome ICMP activity, presumably checking the host is up, and then starting wi=
th a SYN packet. When I try again we carry off right away with the an ACK/P=
USH packet without any delay. My assumption is iptables has timed out the c=
onnection after seeing no activity for hours and as a result deleted it fro=
m memory. When the windows machine tries to reconnect without a SYN packet =
it never gets through since IPtables has no memory of this ever being an es=
tablished connection.  Does my conclusion sound reasonable to others?
>=20
> 	Thanks
>=20
> 03/15-09:01:52.225494 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5636 IpLen:20 DgmLen:120 DF
> ***AP*** Seq: 0x91B15444  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 4C FF 53 4D 42 75 00 00 00 00 18 07 C8  ...L.SMBu.......
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 03 F0 41 D7 04 FF 00 4C 00 08 00 01 00 21 00 00  ..A....L.....!..
> 5C 00 5C 00 51 00 4C 00 46 00 54 00 50 00 5C 00  \.\.Q.L.F.T.P.\.
> 49 00 50 00 43 00 24 00 00 00 3F 3F 3F 3F 3F 00  I.P.C.$...?????.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:01:52.637772 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5638 IpLen:20 DgmLen:120 DF
> ***AP*** Seq: 0x91B15444  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 4C FF 53 4D 42 75 00 00 00 00 18 07 C8  ...L.SMBu.......
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 03 F0 41 D7 04 FF 00 4C 00 08 00 01 00 21 00 00  ..A....L.....!..
> 5C 00 5C 00 51 00 4C 00 46 00 54 00 50 00 5C 00  \.\.Q.L.F.T.P.\.
> 49 00 50 00 43 00 24 00 00 00 3F 3F 3F 3F 3F 00  I.P.C.$...?????.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:01:53.639293 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5640 IpLen:20 DgmLen:120 DF
> ***AP*** Seq: 0x91B15444  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 4C FF 53 4D 42 75 00 00 00 00 18 07 C8  ...L.SMBu.......
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 03 F0 41 D7 04 FF 00 4C 00 08 00 01 00 21 00 00  ..A....L.....!..
> 5C 00 5C 00 51 00 4C 00 46 00 54 00 50 00 5C 00  \.\.Q.L.F.T.P.\.
> 49 00 50 00 43 00 24 00 00 00 3F 3F 3F 3F 3F 00  I.P.C.$...?????.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:01:55.642327 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5642 IpLen:20 DgmLen:120 DF
> ***AP*** Seq: 0x91B15444  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 4C FF 53 4D 42 75 00 00 00 00 18 07 C8  ...L.SMBu.......
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 03 F0 41 D7 04 FF 00 4C 00 08 00 01 00 21 00 00  ..A....L.....!..
> 5C 00 5C 00 51 00 4C 00 46 00 54 00 50 00 5C 00  \.\.Q.L.F.T.P.\.
> 49 00 50 00 43 00 24 00 00 00 3F 3F 3F 3F 3F 00  I.P.C.$...?????.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:01:56.673989 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5645 IpLen:20 DgmLen:93 DF
> ***AP*** Seq: 0x91B15494  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 31 FF 53 4D 42 2B 00 00 00 00 18 43 C0  ...1.SMB+.....C.
> 00 00 00 00 00 00 00 00 00 00 00 00 FF FF FF FE  ................
> 00 00 FE FF 01 01 00 0C 00 4A 6C 4A 6D 49 68 43  .........JlJmIhC
> 6C 42 73 72 00                                   lBsr.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:01:59.648429 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5647 IpLen:20 DgmLen:173 DF
> ***AP*** Seq: 0x91B15444  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 4C FF 53 4D 42 75 00 00 00 00 18 07 C8  ...L.SMBu.......
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 03 F0 41 D7 04 FF 00 4C 00 08 00 01 00 21 00 00  ..A....L.....!..
> 5C 00 5C 00 51 00 4C 00 46 00 54 00 50 00 5C 00  \.\.Q.L.F.T.P.\.
> 49 00 50 00 43 00 24 00 00 00 3F 3F 3F 3F 3F 00  I.P.C.$...?????.
> 00 00 00 31 FF 53 4D 42 2B 00 00 00 00 18 43 C0  ...1.SMB+.....C.
> 00 00 00 00 00 00 00 00 00 00 00 00 FF FF FF FE  ................
> 00 00 FE FF 01 01 00 0C 00 4A 6C 4A 6D 49 68 43  .........JlJmIhC
> 6C 42 73 72 00                                   lBsr.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:07.660605 10.0.0.171:3625 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5649 IpLen:20 DgmLen:173 DF
> ***AP*** Seq: 0x91B15444  Ack: 0xDAD83F0B  Win: 0xFDB2  TcpLen: 20
> 00 00 00 4C FF 53 4D 42 75 00 00 00 00 18 07 C8  ...L.SMBu.......
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 03 F0 41 D7 04 FF 00 4C 00 08 00 01 00 21 00 00  ..A....L.....!..
> 5C 00 5C 00 51 00 4C 00 46 00 54 00 50 00 5C 00  \.\.Q.L.F.T.P.\.
> 49 00 50 00 43 00 24 00 00 00 3F 3F 3F 3F 3F 00  I.P.C.$...?????.
> 00 00 00 31 FF 53 4D 42 2B 00 00 00 00 18 43 C0  ...1.SMB+.....C.
> 00 00 00 00 00 00 00 00 00 00 00 00 FF FF FF FE  ................
> 00 00 FE FF 01 01 00 0C 00 4A 6C 4A 6D 49 68 43  .........JlJmIhC
> 6C 42 73 72 00                                   lBsr.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:23.693580 10.0.0.171 -> 172.16.38.37
> ICMP TTL:32 TOS:0x0 ID:5660 IpLen:20 DgmLen:60
> Type:8  Code:0  ID:512   Seq:14856  ECHO
> 41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50  ABCDEFGHIJKLMNOP
> 51 52 53 54 55 56 57 41 42 43 44 45 46 47 48 49  QRSTUVWABCDEFGHI
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:23.693756 172.16.38.37 -> 10.0.0.171
> ICMP TTL:127 TOS:0x0 ID:15086 IpLen:20 DgmLen:60
> Type:0  Code:0  ID:512  Seq:14856  ECHO REPLY
> 41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50  ABCDEFGHIJKLMNOP
> 51 52 53 54 55 56 57 41 42 43 44 45 46 47 48 49  QRSTUVWABCDEFGHI
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:23.694051 10.0.0.171:4592 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5661 IpLen:20 DgmLen:48 DF
> ******S* Seq: 0x72B00927  Ack: 0x0  Win: 0xFFFF  TcpLen: 28
> TCP Options (4) =3D> MSS: 1460 NOP NOP SackOK=20
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:23.694242 172.16.38.37:445 -> 10.0.0.171:4592
> TCP TTL:127 TOS:0x0 ID:15087 IpLen:20 DgmLen:48 DF
> ***A**S* Seq: 0x6112099F  Ack: 0x72B00928  Win: 0xFFFF  TcpLen: 28
> TCP Options (4) =3D> MSS: 1460 NOP NOP SackOK=20
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:23.694385 10.0.0.171:4592 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5662 IpLen:20 DgmLen:40 DF
> ***A**** Seq: 0x72B00928  Ack: 0x611209A0  Win: 0xFFFF  TcpLen: 20
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
>=20
> 03/15-09:02:23.694529 10.0.0.171:4592 -> 172.16.38.37:445
> TCP TTL:128 TOS:0x0 ID:5663 IpLen:20 DgmLen:177 DF
> ***AP*** Seq: 0x72B00928  Ack: 0x611209A0  Win: 0xFFFF  TcpLen: 20
> 00 00 00 85 FF 53 4D 42 72 00 00 00 00 18 53 C8  .....SMBr.....S.
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF FE  ................
> 00 00 00 00 00 62 00 02 50 43 20 4E 45 54 57 4F  .....b..PC NETWO
> 52 4B 20 50 52 4F 47 52 41 4D 20 31 2E 30 00 02  RK PROGRAM 1.0..
> 4C 41 4E 4D 41 4E 31 2E 30 00 02 57 69 6E 64 6F  LANMAN1.0..Windo
> 77 73 20 66 6F 72 20 57 6F 72 6B 67 72 6F 75 70  ws for Workgroup
> 73 20 33 2E 31 61 00 02 4C 4D 31 2E 32 58 30 30  s 3.1a..LM1.2X00
> 32 00 02 4C 41 4E 4D 41 4E 32 2E 31 00 02 4E 54  2..LANMAN2.1..NT
> 20 4C 4D 20 30 2E 31 32 00                        LM 0.12.
>=20
> =3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=
=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D+=3D=
+
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-BJ18gEPSv8IsirVGHf1y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAVpmlh1fuR/Bv+ygRAp2BAJ97NXqd06bVH8jDaDSnSRxHdiu0cgCfb/7X
rWYdr6u1h1f1U9AgF5YkTcA=
=2eqm
-----END PGP SIGNATURE-----

--=-BJ18gEPSv8IsirVGHf1y--


