From: "Juan Antonio" <pushakk@limbo.ari.es>
Subject: Re: Ugly problem with ebtables
Date: Mon, 27 Apr 2009 22:26:48 +0200 (CEST)
Message-ID: <07d1b2f79cd9ef9765046bb4503bc658.squirrel@limbo.ari.es>
References: <c5f74e0f56607a07b993f7b3e858a659.squirrel@limbo.ari.es>
    <49F5B376.2090101@plouf.fr.eu.org>
Reply-To: pushakk@limbo.ari.es
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F5B376.2090101@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter List <netfilter@vger.kernel.org>

> Hello,

Hello and thanks for your reply,

>
> Juan Antonio Rodriguez Moreno a =E9crit :
>>
>> I have a linux bridged machine, with eth1 and eth2 port on br0. I'm
>> using
>> ebtables to up smtp traffic on routing process and iptables to mark =
it.
>> I
>> route this traffic over openvpn tunnel tun0.
>>
>> That's all right but when IP fragment a packet and send the former f=
rame
>> without the PUSH flag, this frame dissapear.
>
> What your traces shows below is not IP fragmentation (which has nothi=
ng
> to do with PUSH which is a TCP flag) but TCP segmentation.

Ok. excuses the mistake.

>> I can see all traffic on the sending point of the tunel, but the fra=
mes
>> without the PUSH flag set don't arrive on the another side.
>
> IIUC, some packets enter the bridge, are routed through the tunnel an=
d
> don't arrive at the other end. What makes you think that ebtables is
> involved ?

I was not sure wherefrom the issue was, I should have been a bit more
careful to explain the problem.

> Couldn't it be an MTU problem in the tunnel ? AFAIK, when TCP transmi=
ts
> a message which must be segmented, it sends maximum-size segments
> without the PUSH flag and a last smaller segment with the PUSH flag s=
et
> containing the remaining data.

I know that, really this is the problem. The first segments without the
PUSH flag dissapear completely in spite of these go out for the tunnel =
=2E
The MTU is the first thing that I verified and this is 1500 in both sid=
es.

I'm so confuse becouse the same config is in another linux box with the
same config, same version for all packages, etc ..  and this works real=
ly
good.

I have been looking for some sysctl value in /proc/sys/net/ipv4 related
but I can see anything about this.

Thank you.

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


