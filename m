From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Mon, 23 Aug 2010 10:13:48 +0200
Message-ID: <4C722DBC.6060000@plouf.fr.eu.org>
References: <835126759.1436781282547490956.JavaMail.root@tendai.telenet-ops.be> <632287680.1437041282547640257.JavaMail.root@tendai.telenet-ops.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <632287680.1437041282547640257.JavaMail.root@tendai.telenet-ops.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

bdschuym@telenet.be a =E9crit :
> You're right. The Linux bridge does just what the 802.1D standard
> recommends
> (http://standards.ieee.org/getieee802/download/802.1D-2004.pdf):
> "7.12.5 Unique identification of a bridge
> A unique 48-bit Universally Administered MAC Address, termed the Brid=
ge
> Address, shall be assigned to each Bridge. The Bridge Address may be
> the individual MAC Address of a Bridge Port, in which case, use of th=
e
> address of the lowest numbered Bridge Port (Port 1) is recommended."

Thanks for the explanation.

> Apparently you can get around this problem, see (I didn't verify):
> http://backreference.org/2010/07/28/linux-bridge-mac-addresses-and-dy=
namic-ports/

"if the bridge's MAC address is forced to a specific value, the bridge
"remembers" that and makes the address permanent. But there's a caveat:
the address must belong to one of the devices enslaved to the bridge"

Hmm, I remember I had a similar idea, but it didn't work : the address
was not permanent and could still be replaced if an interface with a
lower MAC address was added. Maybe I didn't do things right, I will try
again, thanks.

I had the idea that maybe it was a kernel change, so looking at the
kernel changelogs, I found this in ChangeLog-2.6.27 :

> commit 92c0574f11598c8036f81e27d2e8bdd6eed7d76d
> Author: Stephen Hemminger <shemminger@vyatta.com>
> Date:   Tue Jun 17 16:10:06 2008 -0700
>=20
>     bridge: make bridge address settings sticky
>=20
>     Normally, the bridge just chooses the smallest mac address as the
>     bridge id and mac address of bridge device. But if the administra=
tor
>     has explictly set the interface address then don't change it.

At the time I tried to force a permanent MAC address to the bridge I
used a kernel older than 2.6.27, this explains why it didn't work.
