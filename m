From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: Linux as router (Gateway Server) [Revisited]
Date: Mon, 31 Jan 2005 21:52:34 +0100
Message-ID: <20050131205234.GU5167@freenet.de>
References: <00a601c4fe34$5e74bd80$eaab9385@gagan>
	<1106851960.14748.6.camel@localhost.localdomain>
	<005701c507a8$f84e5330$eaab9385@gagan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABd7dauUP597Mpr3"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <005701c507a8$f84e5330$eaab9385@gagan>
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


--ABd7dauUP597Mpr3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 2005-01-31 20:54:10, schrieb Navneet:
> Many many thanks to all of you for devoting you valuable by reading &
> replying to my mail(query).
>=20
> Quick recaps and updates:
>=20
> 1.i am still using RedHat Linux 9

A little bit to fat...
I use Debian GNU/Linux 3.0 with 2.4.27 on a K5-133
with 64 MB of memory and a 210 MB HDD.

> #uname -a
>=20
> Linux agni.leo.com 2.4.20-8 #1 Thu Mar 13 17:54:28 EST 2003 i686 i686 i386
> GNU/Linux

You should upgrade your kernel to 2.4.27 or higher.

> 2.Having: RTL8139 on board +  RTL 8029 plugged in(external label is of SMC
> ?).
>=20
> #lspci -v
>=20
> 3:06.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8029(AS)
>         Subsystem: Standard Microsystems Corp [SMC] EZ-Card (SMC1208)
>         Flags: medium devsel, IRQ 5
>         I/O ports at cc00 [size=3D32]
>         Expansion ROM at ffffc000 [disabled] [size=3D16K]
>=20
> 03:0a.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> RTL-8139/8139C/8139C+ (rev 10)
>         Subsystem: Unknown device 1849:8139
>         Flags: bus master, medium devsel, latency 32, IRQ 3
>         I/O ports at c800 [size=3D256]
>         Memory at dfdfff00 (32-bit, non-prefetchable) [size=3D256]
>         Capabilities: [50] Power Management version 2
>=20
> NOTE: should I use different NIC , that use different modules ?

You can get better ones like the 3Com 3c509B and the 3c905{B,C}
on <http://www.ebay.com/> but better prices you can get on
<http://www.ebay.de/>.

> 3. iptables  v1.2.7a

Upgrading ?

> 4.Now I am port redirecting i.e http/80 >>squid-cache/3128
>=20
> adding my current iptables rules

??? I have a transparent proxy, but do nothing with IP tables.

> 5.users can browse Internet, but can't able to access FTP sites?

Are you sure, you want this ?

> Please refer below for ftp error logs/X'fer log
>=20
> 6.What I am trying to :
>=20
> a.>  This Linux system should act as gateway 9router) between my LAN &
> WAN.[Working]
>=20
> b.>  Act as proxy server trough Squid & url filtering by using SquidGuard.
> [Working]
>=20
> c.>  Act as firewall
>=20
> Allowed traffic http/https,POP3/SMTP,FTP & SonicMQ.
>=20
>=20
>=20
> Please help in configuring this system

What about:
        man iptables
        netfilter-HOWTO
        NET3-HOWTO
        firewall-HOWTO

        man squid

> But my external NIC is eth1 NOT eth1 .Any particular reason for using eth0
                         ^^^^     ^^^^
                          ??? What ???
> as external?

> WINSOCK.DLL: WinSock 2.0
> WS_FTP32 4.04, Copyright =A9 1992-1996 Ipswitch, Inc. All rights reserved.

> PORT 192,168,0,234,11,12
          ^   ^ ^   ^^^^^^
Why are you using commas ?
And why two ports ?

It should be

PORT 192.168.0.234:21

> 500 Illegal PORT command.
> DoDirList returned 0

Do you Log-In with a script ?

Greetings
Michelle

--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/=20
Michelle Konzack   Apt. 917                  ICQ #328449886
                   50, rue de Soultz         MSM LinuxMichi
0033/3/88452356    67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--ABd7dauUP597Mpr3
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB/pqSC0FPBMSS+BIRAmV+AJ400m4cUU/IPvStq32itXm5TG19PQCfXIM/
Yw8ZKlcYyrOrSr7+BEirZas=
=eyxT
-----END PGP SIGNATURE-----

--ABd7dauUP597Mpr3--

