From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: API to find out wether a IP address is local?
Date: Tue, 14 Jun 2011 11:48:03 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106141144590.25822@frira.zrqbmnf.qr>
References: <BANLkTi=fu+bMtOs_xWfaW0rwwDhk4TrSdA@mail.gmail.com> <4DF725A8.7040205@oracle.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DF725A8.7040205@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Haxby <john.haxby@oracle.com>
Cc: Clemens Eisserer <linuxhippy@gmail.com>, netfilter@vger.kernel.org

On Tuesday 2011-06-14 11:11, John Haxby wrote:

>On 14/06/11 08:31, Clemens Eisserer wrote:
>> I know this question is not really netfilter related, sorry. But I
>> didn't know where to ask it instead.
>>
>> Does Linux have an API to find out wether an IP address is local?
>
>netdevice(7) tells you how to extract all the IPv4 addresses from the
>network devices; /proc/net/if_inet6 lists all the local IPv6 addresses.

The API is netlink:

	ip route get 2001:db8::1

and test for whether the standalone keyword "local" is present. (Or 
alternatively, do the interfacing with netlink yourself using something 
like libmnl.)

Due to things like client-side transparent proxying using TPROXY, it is 
possible that "local" is returned even though the address is not on 
any interface - but depending on your definition of "local" that might 
just be what is desired.

Oh and stop using procfs, it is way too inferior.
