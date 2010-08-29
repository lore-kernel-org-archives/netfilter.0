From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Need for a specific source address selection rule ? (not
 neccessarily netfilter)
Date: Sun, 29 Aug 2010 15:41:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A57D1.8070702@httrack.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Xavier Roche <roche*lkml@httrack.com>
Cc: netfilter@vger.kernel.org

On Sunday 2010-08-29 14:51, Xavier Roche wrote:
> Jan Engelhardt a =C3=A9crit :
>> You are confusing incoming with outgoing connections.
>
> Yes, my mistake.
>
>> correct. For the incoming one you bind to [::]:25, for the outgoing
>> one you bind to [2a01::desired]:0. Problem solved.
>
> What would happend for v4 destinations ? Both v4/v6 destinations may =
exist at
> the same time.

A socket is generally only responsible for a single protocol. In other=20
words, that makes two sockets, one is [::]:25, the other is 0.0.0.0:25.
Now since IPv6 was designed - as is usual for IETF, resp it working=20
groups - a bit whacky, there exists the possibility to receive v4=20
connections on v6... but thank god there is a IPV6_V6ONLY socket option=
=2E

> but not to add a specific rule depending on various parameters
> (destination, owner, etc.) at all.

ip route add $(address of google.com) src $(my alternate address)

should do it. IPsec already does so if I am not mistaken.

