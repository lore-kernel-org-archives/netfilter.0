From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Fri, 28 Apr 2023 16:59:15 +0800
Message-ID: <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
 <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
 <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682672359; x=1685264359;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jQk0BYTwzDu8sGQwFs+7m3v1mXXgPpbe6YluaneRbFA=;
        b=J6Ad+pM7++iB18kLKeO9qBt7sa0EGhD6SRmkHEfryNjEJhazYvrN1Ip5p4js6mq8Qe
         oyT+C2wKKm3NHCUTQOZ2Y7qXh58c4bLr+e/upYM+L6sF7NNBl+RxiAog9zCKIES5ET9d
         HS5MHSQbY5iEuypUNw/aFHH1UPHZb2fJx4t/cUnWfvq8B9kAxE3gvyckFKYb3y8cxvmZ
         IK6B9J8+bvJZ1ChTuSL3ce/7IKqqQuLsUBEA920hG9z9Mx322UU1t82xfzv+4goBeF/9
         zKHdg9Rji3Sdme4wBmeLYXLPsJtyaDIfTMV5dK5oCDzvPKoGLKyBwGvdx5wu8K77lQ93
         pjpQ==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: seentr@at.encryp.ch
Cc: netfilter@vger.kernel.org

Thanks for the detailed example.

> nft add rule x prerouting fib daddr . iif type local accept
=E2=80=9Clocal" is very close to what I=E2=80=99m after, but from my =
test, it doesn=E2=80=99t match. The linked wiki seems to suggest that =
=E2=80=9Clocal=E2=80=9D means the same interface a packet originates =
from?

I wonder if there is an address type that denotes any IP that is hosted =
on local interfaces.

> nft add rule x prerouting fib daddr . iif oifname wan accept

This seems to also match packets that forward to wan, not just destine =
to wan.

> On Apr 28, 2023, at 4:03 PM, seentr@at.encryp.ch wrote:
>=20
> I think you need something like this:
>> nft add rule x prerouting fib daddr . iif type local accept
>=20
> Also, in the wiki I see following information:
>> General syntax is: fib key data operator expression, where:
>>=20
>>      key: saddr, daddr, mark, iif, oif (use '.' for concatenations to =
represent tuples)
>>      data: oif, oifname, (address) type
>>      operator: eq, neq, vmap, map
>=20
> Thus you may try something like this:
>> nft add rule x prerouting fib daddr . iif oifname wan accept
>=20
> I am currently away from PC and could not verify how it actually =
behaves but you can try and experiment with different parameters on your =
own.
>=20
> 2023-04-28T07:55:25Z Glen Huang <heyhgl@gmail.com>:
>=20
>> Thanks for the quickly reply.
>>=20
>> Maybe I missed something, but it seems both nexthop and fib can only =
filter packets that go out of a certain interface, but not ones that =
have wan IP as the destination?
>>=20
>>> On Apr 28, 2023, at 3:22 PM, seentr@at.encryp.ch wrote:
>>>=20
>>> Have you tried this: =
https://wiki.nftables.org/wiki-nftables/index.php/Matching_routing_informa=
tion ?
>>>=20
>>> 2023-04-28T03:59:07Z Glen Huang <heyhgl@gmail.com>:
>>>=20
>>>> Hi,
>>>>=20
>>>> I use tproxy to redirect all traffic from the lan interface, but I =
want to exemplify traffic whose destination IP belongs to the wan =
interface. I wonder if it=E2=80=99s possible to specify if ip daddr =
matches the wan interface IP in the prerouting chain?
>>>>=20
>>>> The only solution I can think of right now, is to create a set, and =
manually update the set with wan IPs (also whenever they change), which =
is very cumbersome.
>>>>=20
>>>> I wonder if there is a direct way to that in nft?
>>>>=20
>>>> I use nft1.0.7 with kernel 5.15.108

