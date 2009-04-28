From: "Juan Antonio" <pushakk@limbo.ari.es>
Subject: Re: Ugly problem with ebtables
Date: Tue, 28 Apr 2009 13:56:13 +0200 (CEST)
Message-ID: <16d4b3592f68db5e01ba40a2c61c3192.squirrel@limbo.ari.es>
References: <c5f74e0f56607a07b993f7b3e858a659.squirrel@limbo.ari.es>
    <49F5B376.2090101@plouf.fr.eu.org>
    <07d1b2f79cd9ef9765046bb4503bc658.squirrel@limbo.ari.es>
    <49F6CF16.2060508@plouf.fr.eu.org>
Reply-To: pushakk@limbo.ari.es
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F6CF16.2060508@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter List <netfilter@vger.kernel.org>

> Juan Antonio a =E9crit :
>>
>>> Couldn't it be an MTU problem in the tunnel ? AFAIK, when TCP trans=
mits
>>> a message which must be segmented, it sends maximum-size segments
>>> without the PUSH flag and a last smaller segment with the PUSH flag=
 set
>>> containing the remaining data.
>>
>> I know that, really this is the problem. The first segments without =
the
>> PUSH flag dissapear completely in spite of these go out for the tunn=
el .
>> The MTU is the first thing that I verified and this is 1500 in both
>> sides.
>
> Did you check that the tunnel can actually handle packets of that siz=
e,
> for example by sending pings of various sizes up to 1500 through it ?
> Tunnel encapsulation adds overhead, which might create fragmentation =
or
> other issues.

Hello,

I can send pings to exactly 1370 bytes, and over 1440 bytes but I can't
ping between this interval.

ping 10.8.1.1 -c 1 -s 1450
PING 10.8.1.1 (10.8.1.1) 1450(1478) bytes of data.
1458 bytes from 10.8.1.1: icmp_seq=3D1 ttl=3D64 time=3D61.1 ms
1 packets transmitted, 1 received, 0% packet loss, time 0ms

ping 10.8.1.1 -c 1 -s 1440
PING 10.8.1.1 (10.8.1.1) 1440(1468) bytes of data.
1 packets transmitted, 0 received, 100% packet loss, time 0ms

However the MTU is 1500 in both sides and I can send ping without probl=
em
in this size.

ping 10.8.1.1 -c 1 -s 1500
PING 10.8.1.1 (10.8.1.1) 1500(1528) bytes of data.
1508 bytes from 10.8.1.1: icmp_seq=3D1 ttl=3D64 time=3D60.7 ms
1 packets transmitted, 1 received, 0% packet loss, time 0ms

Now I'm really lost, I'll look for some parameter in openvpn config.

Thank you very much


> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


