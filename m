From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Fri, 28 Apr 2023 15:53:52 +0800
Message-ID: <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682668441; x=1685260441;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YtbjqtWhyIA+KpACybDw/fcIucN9/ewDeqfuycmxLzQ=;
        b=RZpZrvLobZ12IVqWjXXAtMKCkqGsNmqTHpd3xdM+zyzqd0mDWTz7qo7qZjQrLwL37h
         C2Jc2dfiwsdC9a/GxE2rfTBNVdmop1E9rzbT6WVrAYxsm3QhqOTzhtoOY3VMqhugyJli
         zgpXXy8pLJkdUxYFF67ofYa0T0i6niaOby7cuxqmeTy8iuuaLNeK14hWQFNrXFpEyvxq
         dwe/PNWmswPfUedfCMiL7t64cpMYeJa4Sux06uaodkg4Lx8iJYMNqNf9dHVMdxdPRCAt
         879LlIH6MzN0W+tap5isRAsBNFYFyntKp9TAp/hnoKcZ93wGw9OXfB62nDUBWaJgxaYx
         1zfg==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: seentr@at.encryp.ch
Cc: netfilter@vger.kernel.org

Thanks for the quickly reply.

Maybe I missed something, but it seems both nexthop and fib can only =
filter packets that go out of a certain interface, but not ones that =
have wan IP as the destination?

> On Apr 28, 2023, at 3:22 PM, seentr@at.encryp.ch wrote:
>=20
> Have you tried this: =
https://wiki.nftables.org/wiki-nftables/index.php/Matching_routing_informa=
tion ?
>=20
> 2023-04-28T03:59:07Z Glen Huang <heyhgl@gmail.com>:
>=20
>> Hi,
>>=20
>> I use tproxy to redirect all traffic from the lan interface, but I =
want to exemplify traffic whose destination IP belongs to the wan =
interface. I wonder if it=E2=80=99s possible to specify if ip daddr =
matches the wan interface IP in the prerouting chain?
>>=20
>> The only solution I can think of right now, is to create a set, and =
manually update the set with wan IPs (also whenever they change), which =
is very cumbersome.
>>=20
>> I wonder if there is a direct way to that in nft?
>>=20
>> I use nft1.0.7 with kernel 5.15.108

