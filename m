From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Need for a specific source address selection rule ? (not
 neccessarily netfilter)
Date: Sun, 29 Aug 2010 14:04:50 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr>
References: <4C7A3B14.9010805@httrack.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A3B14.9010805@httrack.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xavier Roche <roche*lkml@httrack.com>
Cc: netfilter@vger.kernel.org


On Sunday 2010-08-29 12:48, Xavier Roche wrote:

>1. one outgoing IP per service (for example, a SMTP server would
>have its own address for the outgoing interface - and one unique
>reverse IP to the declared SMTP server address)
>
>The first case can sometimes be partially solved using
>application-specific configuration (bind to a specific address) -
>however this is not desirable when you need to listen to all
>interfaces (ie. including IPv4-only or IPv6-only ones)

You are confusing incoming with outgoing connections. bind is
correct. For the incoming one you bind to [::]:25, for the outgoing
one you bind to [2a01::desired]:0. Problem solved.


> 3. one outgoing IP for specific network blocks
> etc ..

Hosts uses their assigned address as outgoing source address.


>RFC 3484 (4) specifies the way source address is selected ; with the
>following order (5):
>
> 1. Prefer same address. (i.e. destination is local machine)
> 2. Prefer appropriate scope. (i.e. smallest scope shared with the destination)
> 3. Avoid deprecated addresses.
> 4. Prefer home addresses.
> 5. Prefer outgoing interface. (i.e. prefer an address on the interface we're
> sending out of)
> 6. Prefer matching label.
> 7. Prefer public addresses.
> 8. Use longest matching prefix.

And somewhere in between is /etc/gai.conf.
