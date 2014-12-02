From: Smart Weblications GmbH - Florian Wiessner 
	<f.wiessner@smart-weblications.de>
Subject: Re: Can not see VM packets using Netfilter
Date: Tue, 02 Dec 2014 12:14:14 +0100
Message-ID: <547D9F06.90602@smart-weblications.de>
References: <66549406-F09A-46F9-82B2-9BDF53A256E1@gmail.com>
Reply-To: f.wiessner@smart-weblications.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <66549406-F09A-46F9-82B2-9BDF53A256E1@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?546L5Y+vIOeOiw==?= <klwangke@gmail.com>, netfilter@vger.kernel.org

Hi,

Am 02.12.2014 06:48, schrieb =E7=8E=8B=E5=8F=AF =E7=8E=8B:
> Hi all,
>=20
> I=E2=80=99m recently developing a simple program using netfilter and =
I=E2=80=99m having a tricky problem. My program is mainly to log the sr=
c and dst ip address of all the packets. This program is run in the hos=
t machine. I have several virtual machines on that host machine.=20
>=20
> The problem is, I can not capture the packets generated or destined a=
t the VMs. All the VMs use bridging network to connect.
>=20
> Can anyone help me? A lot of thanks!
>=20

Depending on the interface you use (bridge) and the method you try to l=
og
packets, you may try again with:

echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables



--=20

Mit freundlichen Gr=C3=BC=C3=9Fen,

=46lorian Wiessner

Smart Weblications GmbH
Martinsberger Str. 1
D-95119 Naila

fon.: +49 9282 9638 200
fax.: +49 9282 9638 205
24/7: +49 900 144 000 00 - 0,99 EUR/Min*
http://www.smart-weblications.de

--
Sitz der Gesellschaft: Naila
Gesch=C3=A4ftsf=C3=BChrer: Florian Wiessner
HRB-Nr.: HRB 3840 Amtsgericht Hof
*aus dem dt. Festnetz, ggf. abweichende Preise aus dem Mobilfunknetz
