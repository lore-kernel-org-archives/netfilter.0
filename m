From: =?ISO-8859-1?Q?Per_J=F8rgensen?= <linux@pbj-design.dk>
Subject: IPtables problem
Date: Sat, 06 Oct 2007 18:28:17 +0200
Message-ID: <4707B7A1.3090906@pbj-design.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hej List.

I have a problem wit my Firewall - That is build upon Soekris 4801 with=
=20
Debian Stable and IPTABLES.

I have from my work - been giving a internet connection - with static I=
P=20
- and a range with 2 IP more.

Now I would like to use the extra IP for more cases.
Eth0 =3D WAN
eth0:0 WAN - extra IP 1
eth0:1 WAN - extra IP 2
eth1 =3D Lan
eth2 =3D DMZ
eth3 =3D testzone ( Pluto system)

I have placed my script here - http://linux.pbj-design.dk/IPTABLES.TXT
so you'll be able to se itt.

The problem is that I cannot get the connection on the extra IP1 to=20
forward all request on port 22 & 80 - to the machine that is placed in=20
eth3. I only gets a - Cannot display the page. I know the server is=20
working OK - caurse when I place my computer on eth3 subnet - and point=
=20
directly - it works.  So don't quite know what I'm doing wrong here - s=
o=20
please guide me to the rigth direction.

Thanks a lot!

--=20

Med Venlig Hilsen

Greetings

Per J=F8rgensen
Linux-user 393221
linux@pbj-design.dk <mailto:linux@pbj-design.dk>
<mailto:linux@pbj-design.dk>http://linux.pbj-design.dk=20
<http://linux.pbj-design.dk/>



