From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ugly problem with ebtables
Date: Mon, 27 Apr 2009 15:30:30 +0200
Message-ID: <49F5B376.2090101@plouf.fr.eu.org>
References: <c5f74e0f56607a07b993f7b3e858a659.squirrel@limbo.ari.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c5f74e0f56607a07b993f7b3e858a659.squirrel@limbo.ari.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Juan Antonio Rodriguez Moreno a =E9crit :
>=20
> I have a linux bridged machine, with eth1 and eth2 port on br0. I'm u=
sing
> ebtables to up smtp traffic on routing process and iptables to mark i=
t. I
> route this traffic over openvpn tunnel tun0.
>=20
> That's all right but when IP fragment a packet and send the former fr=
ame
> without the PUSH flag, this frame dissapear.

What your traces shows below is not IP fragmentation (which has nothing=
=20
to do with PUSH which is a TCP flag) but TCP segmentation.

> I can see all traffic on the sending point of the tunel, but the fram=
es
> without the PUSH flag set don't arrive on the another side.

IIUC, some packets enter the bridge, are routed through the tunnel and=20
don't arrive at the other end. What makes you think that ebtables is=20
involved ?

Couldn't it be an MTU problem in the tunnel ? AFAIK, when TCP transmits=
=20
a message which must be segmented, it sends maximum-size segments=20
without the PUSH flag and a last smaller segment with the PUSH flag set=
=20
containing the remaining data.
