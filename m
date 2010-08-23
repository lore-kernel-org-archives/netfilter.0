From: bdschuym@telenet.be
Subject: Re: Forced lladdr change with bridge - or not?
Date: Mon, 23 Aug 2010 09:14:00 +0200 (CEST)
Message-ID: <632287680.1437041282547640257.JavaMail.root@tendai.telenet-ops.be>
References: <835126759.1436781282547490956.JavaMail.root@tendai.telenet-ops.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <835126759.1436781282547490956.JavaMail.root@tendai.telenet-ops.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Bart De Schuymer <bdschuym@pandora.be>, netfilter@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

You're right. The Linux bridge does just what the 802.1D standard recom=
mends (http://standards.ieee.org/getieee802/download/802.1D-2004.pdf):
"7.12.5 Unique identification of a bridge
A unique 48-bit Universally Administered MAC Address, termed the Bridge=
 Address, shall be assigned to
each Bridge. The Bridge Address may be the individual MAC Address of a =
Bridge Port, in which case, use
of the address of the lowest numbered Bridge Port (Port 1) is recommend=
ed."

Apparently you can get around this problem, see (I didn't verify):
http://backreference.org/2010/07/28/linux-bridge-mac-addresses-and-dyna=
mic-ports/

cheers,
Bart

----- Originele e-mail  -----
Van: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
Aan: "Jan Engelhardt" <jengelh@medozas.de>
Cc: "Bart De Schuymer" <bdschuym@pandora.be>, netfilter@vger.kernel.org
Verzonden: Zondag 22 augustus 2010 22:53:04 GMT +01:00 Amsterdam / Berl=
ijn / Bern / Rome / Stockholm / Wenen
Onderwerp: Re: Forced lladdr change with bridge - or not?

Hello,

Jan Engelhardt a =C3=A9crit :
> On Sunday 2010-08-22 18:55, Bart De Schuymer wrote:
>>> # brctl addbr br0
>>> # brctl addif br0 tap1
>>> # brctl addif br0 tap2
>>> # ip a
>>> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qle=
n 500
>>>    link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>>> 197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qle=
n 500
>>>    link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
>>> 198: br0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN     =
link/ether
>>> 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>>>
>>> Is this behavior normal that the lladdrs of all but the first brpor=
t
>>> remain unchanged? If so, what is the purpose of changing the lladdr=
 on the
>>> first brport?
>>> =20
>> I don't understand your question,

Me neither : according to your output, the MAC address of neither port
has changed.

> but the Linux bridge code assigns the MAC
>> address of its first-added port to the virtual bridge device.
>=20
> 1. Why does it do that,

The bridge interface must have a MAC address, so why not pick up one in
thoses of its ports ?

> 2. Why only the first port?

IME, the bridge picks up the lowest MAC address of its ports.
This has an advantage : the bridge MAC address ends up the same for a
same set of ports regardless of the order in which the ports are added.
But this also has a big disadvantage : the bridge MAC address can chang=
e
whenever you add or remove a port, breaking ARP for a while, changing
link-local and stateless autoconfigured IPv6 addresses...
