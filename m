From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Iptables 1.3.7 and uClibc
Date: Fri, 23 Feb 2007 10:41:06 +0100
Message-ID: <45DEB6B2.80408@cetrtapot.si>
References: <45DC6B39.8040907@cetrtapot.si>
	<200702221508.29669.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702221508.29669.alan.ezust@presinet.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Alan Ezust <alan.ezust@presinet.com>
Cc: netfilter@lists.netfilter.org

Alan Ezust wrote:
> I'd recommend uncommenting the
>=20
>  NO_SHARED_LIBS =3D 1
>=20
> at the top of the Makefile. That way they will all be built into one bi=
nary=20
> and you won't have to worry about the executable finding things.
>=20

I've tried that, but when I tried to execute the iptables binary on the=20
target system, it failed with:

getsockopt failed strangely: No such file or directory

Maybe I'll look in to it, but in the meanwhile I managed to get iptables=20
version 1.2.7 to work. I still don't know why 1.3.7 can't load the=20
shared object it needs, while it works on 1.2.7. Maybe my kernel version=20
- 2.6.12 is too old?

Best regards,
hinko

--=20
=C4=8CETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si


