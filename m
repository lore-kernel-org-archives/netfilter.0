From: christophe leroy <christophe.leroy@c-s.fr>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Mon, 12 Oct 2015 20:06:38 +0200
Message-ID: <561BF6AE.7080803@c-s.fr>
References: <54761724.9060201@c-s.fr> <54815E4F.10500@c-s.fr>
 <20141205103827.GB3746@salvia> <54EDBD07.5010801@c-s.fr>
 <CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jason Sipula <alupis1@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org


Le 25/02/2015 16:58, Jason Sipula a =C3=A9crit :
> my understanding was 3.13 had the core of nftables merged
Yes but according to Pablo, "userspace supports this but unfortunately=20
the kernel code is still missing".
Hence my question.

As of today, what is the status of nftables regarding the support of ct=
=20
helper ?
If it is not in yet, how can I help getting it in ?

Christophe

>
> On Wed, Feb 25, 2015 at 4:16 AM, leroy christophe
> <christophe.leroy@c-s.fr> wrote:
>> Le 05/12/2014 11:38, Pablo Neira Ayuso a =C3=A9crit :
>>> On Fri, Dec 05, 2014 at 08:27:11AM +0100, leroy christophe wrote:
>>>> test.c               100%
>>>> |*****************************************************************=
*******|
>>>> 804   0:00:00 ETA
>>>>
>>>> # nft list ruleset
>>>> table ip filter {
>>>>           chain output {
>>>>                    type filter hook output priority 0;
>>>>                    udp dport tftp ct helper "tftp"
>>> The right syntax is:
>>>
>>>           udp dport tftp ct helper set "tftp"
>>>                                    ^^^
>>>
>>> your rule above does something different:
>>>
>>> 1) udp dport tftp
>>>
>>> and
>>>
>>> 2) the ct helper is "tftp"
>>>
>>> However, userspace supports this but unfortunately the kernel code =
is
>>> still missing.  So you'll have to wait for this feature or
>>> (temporarily) rely on the automagic helper assignment (from that
>>> message, I understand you already do).
>> Any idea of when the kernel support will be added ?
>>
>> Christophe
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html


---
L'absence de virus dans ce courrier =C3=A9lectronique a =C3=A9t=C3=A9 v=
=C3=A9rifi=C3=A9e par le logiciel antivirus Avast.
https://www.avast.com/antivirus

