From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Altering MTU in ICMPv6 packet too big message
Date: Wed, 24 Feb 2010 12:59:39 +1300
Message-ID: <b17242f22db7cbd027a94a9fe002189a@mail.treenet.co.nz>
References: <20100223234228.GA3521@Linus-Debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100223234228.GA3521@Linus-Debian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Wed, 24 Feb 2010 00:42:28 +0100, Linus L=C3=BCssing <linus.luessing@=
web.de>
wrote:
> Hi there,
>=20
> we're having a buggy, closed source IPv6 router here, which keeps
> announcing a wrong MTU via ICMPv6 packet too big messages. Is
> there a way to modify the 1500 to a 1480 with a rule in the mangle
> table on the host that receives those broken messages? I think
> despite this one value, also the checksum would have to be
> recalculated.
>=20
> Cheers, Linus
>=20
> PS: the tcpmss-target extension is not enough, as I'm still having
> trouble with UDP packets.

If someone more experienced does not have a cleaner solution... I've fo=
und
setting fixed MTU on the NIC of each box plugged into such hardware to =
work
nicely for all protocols. Generating the ICMP message at a box that wor=
ks.

AYJ
Amos
