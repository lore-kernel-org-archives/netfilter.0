From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Bridge IPv6 traffic between 2 interfaces
Date: Thu, 22 Mar 2012 07:07:42 -0400
Message-ID: <CACuyg24PnPZVrffq+VSvT=oA0RM-TjMD3MUV2Zj5zAw9GtVnmA@mail.gmail.com>
References: <BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4636@GSX300A.mxchg.m.corp>
	<CACuyg24rGyYX9bWO21Fbo2HMHtBwwLJQEehq1j1AoNKoew5_3A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=bD8uK1SIgTeYrTKcxiy5eCwZDpieR58qMg8hy7j2tDs=;
        b=wHCaTL/UEuNYDfDhSuJgLy1/bwn5khsOXmLEhAcUH0+pMQdnSckk+yRFQ1UvTQQWwV
         vrW+PEvFF5stq6lHgMKNgqNDvvWP1pV1mmdfatU7UNeEoKtpYg0wqyS8trf30SDs/lmO
         n+LjAOXZGwVylSvSUphH1PpWRxz2w3jIF/yM7gUI2i6WxvqROTlE8Oicra/hWarK0NoB
         dxFVoke32dTTog1+vmJYdUO6h4y3d+WUb0sNn8Sz8qd8Re98GuzETdljivQLDprv0Mo9
         s0AW8O5Yuvkaz1BH1QY7X+AnGDAqlgwtL45aucNdeNbsMLH4UjjF7ajEH/BRQEnFahOn
         U/pg==
In-Reply-To: <CACuyg24rGyYX9bWO21Fbo2HMHtBwwLJQEehq1j1AoNKoew5_3A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Huebner, Thomas" <thomas.huebner@cassidian.com>
Cc: netfilter@vger.kernel.org

Hi,

I do not know if I understand correctly.

You want the IPv6 traffic across the bridge transparently.
But whether a control standard for IPv4 - is it?

To control what crosses the bridge or not you should use ebtables (in
broute chain).
I believe it is something like:

ebtables -t broute -A BROUTING -p ipv4 -j DROP

This prevents the processing of the * bridge * for IPv4 packets, but
you can still use iptables to filter * routing *.

I hope it's this and that works.
Thanks.

Em 22 de mar=E7o de 2012 07:06, Humberto Juc=E1 <betolj@gmail.com> escr=
eveu:
> Hi,
>
> I do not know if I understand correctly.
>
> You want the IPv6 traffic across the bridge transparently.
> But whether a control standard for IPv4 - is it?
>
> To control what crosses the bridge or not you should use ebtables (in
> broute chain).
> I believe it is something like:
>
> ebtables -t broute -A BROUTING -p ipv4 -j DROP
>
> This prevents the processing of the * bridge * for IPv4 packets, but
> you can still use iptables to filter * routing *.
>
> I hope it's this and that works.
> Thanks.
>
>
> 2012/3/22 Huebner, Thomas <thomas.huebner@cassidian.com>:
>> Hello,
>>
>> I have a computer (A) which is connected on the left side to a priva=
te
>> network (usb0) and on the right side to a stand alone computer (B).
>>
>>
>> ----+ =A0 =A0 =A0 =A0 +-----------------+ =A0 =A0 =A0 =A0 =A0 =A0+--=
-----+
>> NET | =A0 =A0 =A0 =A0 | =A0 =A0 =A0BOX A =A0 =A0 =A0| =A0 =A0 =A0 =A0=
 =A0 =A0| BOX B |
>> =A0A =A0+--IPv4---+--- =A0IPv4 in =A0---+------IPv4--+ =A0 =A0 =A0 |
>> =A0 =A0+--IPv6-+ | =A0IPv6 'arround' | +----IPv6--+ =A0 =A0 =A0 |
>> =A0 =A0| =A0 =A0 =A0 | +-----------------+ | =A0 =A0 =A0 =A0 =A0+---=
----+
>> ----+ =A0 =A0 =A0 +->----<--->----<--->-+
>>
>>
>> I try to find a way to bridge the IPv6 traffic completely transparen=
t
>> (including all the ICMPv6 and solicitation stuff), between the
>> interfaces usb0 and usb1 while the IPv4 traffic is not affected.
>>
>> I've tried using a brctl which connects the two interfaces perfectly=
,
>> but disconnects them from the host A itself.
>> Also marking the IPv6 packets with set-mark and routing them using "=
ip
>> route" seems not to work.
>>
>> The iptables ROUTE target using the "--oif" option seems exactly wha=
t
>> I'm looking for, but unfortunatly this target is not available for
>> ip6tables.
>>
>> Has anyone an idea or hint?
>>
>>
>> Thanks
>>
>> Thomas
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
