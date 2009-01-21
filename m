From: Peter Renzland <peter@dancing.org>
Subject: Re: CONNLIMIT Questions
Date: Wed, 21 Jan 2009 13:57:18 -0500
Message-ID: <4EEEDB86-20DA-481B-95B7-95162C05225B@dancing.org>
References: <55F56AFD-736E-4FBB-9F08-B4A6A3393140@dancing.org> <slrngn97bo.dts.sitaramc@sitaramc.homelinux.net> <080C17B3-CF53-45FD-AC6D-C3F7C545C8A5@dancing.org> <49776CBF.6000406@freemail.hu>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49776CBF.6000406@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Sitaram Chamarty <sitaramc@gmail.com>, netfilter@vger.kernel.org

Swifty,

You're right and I was doubly wrong.

What the manual actually says, and what I had in my original message, =20
was:

"restrict the number of parallel TCP connections to a server per =20
client IP address (or address block)."

I want to limit what overwhelmingly are divergent UDP connection =20
attempts to 1000's of servers.

Peter



On 09  Jan 21, at 13:43 , G=E1sp=E1r Lajos wrote:

> Hi!
>
>
> Peter Renzland =EDrta:
>> The central question that was never addressed was:
>>
>> * The iptables manual page states that connlimit limits *incoming* =20
>> *tcp* connections.  I want to limit what overwhelmingly are =20
>> outgoing UDP connections.
> Don't get me wrong... but EVERY forwarded connection/packet at first =
=20
> is incoming on the firewall...
> Think about it...
>>
>> Thanks,
>> Peter Renzland
>>
> Swifty
>
>

