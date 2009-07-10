From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: tc and virtual interfaces
Date: Fri, 10 Jul 2009 15:08:04 +0200
Message-ID: <4A573D34.7080100@plouf.fr.eu.org>
References: <4A572D8C.7010703@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A572D8C.7010703@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Hello,

=46abio Marcone a =E9crit :
> Hi all,
> I need to add traffic shaping in a linux router (debian) and I need t=
o=20
> understand tc behaviour with virtual interfaces.
>=20
> Examples:
> I have eth0 and eth0:0, if I set a limit on eth0 datarate, is also=20
> eth0:0 involved?

eth0:0 is not an interface, it is an IPv4 alias on eth0. The real and=20
only interface here is eth0.

> ...or...
> If I have a tunnel OpenVPN (tun0) on eth0, how is managed data rate l=
imit?

tun0 is an interface on its own. However, if encapsulating traffic=20
happens to go through eth0, it will be affected by traffic shaping just=
=20
as any other traffic going through eth0.


