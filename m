From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: using iptables with tun/tap interfaces? no rule sees tun/tap
 interface traffic
Date: Sun, 29 Aug 2010 17:01:59 +0200
Message-ID: <4C7A7667.3060205@plouf.fr.eu.org>
References: <4C7A3E75.5020202@wpkg.org> <20100829131559.23abd652@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100829131559.23abd652@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Tomasz Chmielewski <mangoo@wpkg.org>, netfilter@vger.kernel.org

Hello,

Marek Kierdelewicz a =E9crit :
>=20
>> tcpdump: WARNING: tap0: no IPv4 address assigned
>=20
> So you're bridging.
>=20
> Make sure /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1.

It is by default.
But -i/-o must match the bridge interface, not the port. Ports can be
matched with the physdev match as you pointed out in another post.

Tomasz asked :
>
> Should I use ebtables for this?

Yes, if ebtables can do what you need.
