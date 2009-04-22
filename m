From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Wed, 22 Apr 2009 12:01:32 +0200
Message-ID: <1240394492.20822.13.camel@enterprise.ims-firmen.de>
References: <op.uslkl80px1lyi3@localhost> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
	 <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
	 <1240227862.27336.43.camel@enterprise.ims-firmen.de>
	 <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com>
	 <1240234658.27336.66.camel@enterprise.ims-firmen.de>
	 <145d4e1a0904200815q3176c9e2m2dfef314b205f348@mail.gmail.com>
	 <20090420185918.GA1158@internet24.de>
	 <145d4e1a0904220253w73af0297w15c21af27c9fc407@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0904220253w73af0297w15c21af27c9fc407@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Javier =?ISO-8859-1?Q?G=E1lvez?= Guerrero <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2009-04-22 at 11:53 +0200, Javier G=C3=A1lvez Guerrero wrote:
> I've switched to Debian Lenny 5.01 (kernel 2.6.26-2, iptables 1.4.2)
> and Jan's suggestion has worked out-of-the-box: the old streams are
> stable when changing the default route in the main table =3D).
>=20
> Anyway, I would like to know if you have any clue about what could be
> happening in Ubuntu 8.10 (kernel 2.6.27-11, iptables 1.4.0), since it
> would be very helpful in case I need to develop some iptables-related
> stuff in the future.

I am not running Ubuntu 8.10 anywhere, but I am employing self-compiled
2.6.27.X and 1.4.X versions on a Lenny base, and there I haven't had an=
y
problems with policy routing (in a lab environment). But then again, I
didn't have any with 2.6.18 and 1.3.X either ;)=20

In generally all this stuff is pretty mature and doesn't simply stop
working when you switch to the next generation. Also there should be a
number of people out there that do something similar with stock Lenny
and 8.10 packages, and they'd be sure to complain, maybe you should tak=
e
a look at the Debian/Ubuntu bug tracker .....

