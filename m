From: =?ISO-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: passing data transparently
Date: Sun, 26 Feb 2012 19:36:06 +0100
Message-ID: <4F4A7B96.30506@bringe.com>
References: <20120226180356.GA25431@scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120226180356.GA25431@scriptkitchen.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Payal <payal@scriptkitchen.com>

Am 26.02.2012 19:03, schrieb Payal:
> Hi all,
> I am helping a friend with this setup. They have a device which has a
> fixed ip (say 1.2.3.4) which talks with its software running on
> MS-Windows which must be physically connected to it and must have a
> specific IP (say 1.2.3.5) only. Now it happens that the laptop runnin=
g
> that software is in a branch office so physical connection is not
> possible. So, we have thought of,
>
> Device(1.2.3.4)<-->(1.2.3.5)Linux(ext add.)<-->INTERNET<-->(ext.
> add.)Linux2(1.2.3.4)<-->(1.2.3.5)MS-Win Laptop
>

Have you thought about using a site-to-site ethernet bridge over an=20
OpenVPN tunnel?

It also helps to protect your privacy with regard to the data passend=20
netween laptop and device.

See=20
http://www.openvpn.net/index.php/open-source/documentation/miscellaneou=
s/76-ethernet-bridging.html=20
for a starting point.

HTH,
Thomas










MfG,
Thomas B=E4tzler
--=20
BRINGE Informationstechnik GmbH
Zur Seeplatte 12
D-76228 Karlsruhe
Germany

=46on: +49 721 94246-0
=46on: +49 171 5438457
=46ax: +49 721 94246-66
Web: http://www.bringe.de/

Gesch=E4ftsf=FChrer: Dipl.-Ing. (FH) Martin Bringe
Ust.Id: DE812936645, HRB 108943 Mannheim

